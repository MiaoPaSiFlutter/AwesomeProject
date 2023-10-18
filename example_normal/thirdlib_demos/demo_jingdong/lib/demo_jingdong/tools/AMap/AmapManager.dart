import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'AmapNet.dart';
import 'GpsUtil.dart';

class AmapManager {
  static String kKey = "256e12798b00f258b5a499a1f9ff5183";
  static String kBaseUrl =
      "https://restapi.amap.com/v3/geocode/regeo?output=json";

  static final AmapManager _shared = AmapManager._init();

  static AmapManager shared() => _shared;

  static final GeolocatorPlatform _geolocatorPlatform =
      GeolocatorPlatform.instance;

  static Position? locationData;

  AmapManager._init() {
    _initMessageChannel();
  }

  void _initMessageChannel() {}

  ///开始定位
  static Future<Position?> startLocation() async {
    try {
      final hasPermission = await requestLocationPermission();
      if (!hasPermission) {
        return null;
      }

      Position? position;
      /*
      某些机型上通过Geolocator.getCurrentPosition方法获取不到定位,暂不清楚原因。
      可以尝试先获取getLastKnownPosition，没有数据的话再去请求getCurrentPosition方法。
      为了在国内外都能正常使用，就不能依赖google服务，
      所以这里我们打将forceAndroidLocationManager属性设置为true。这样就会使用Android原生的LocationManager定位
      */
      Position? lastKnownPosition = await Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: true,
      );
      if (lastKnownPosition == null) {
        Position? currentPosition = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
        );
        position = currentPosition;
      } else {
        position = lastKnownPosition;
      }

      locationData = position;
      if (locationData == null) {
        return null;
      }
      print("定位成功 - ${position.toString()}");
      return position;
    } on PlatformException catch (err) {
      print("定位失败 - $err");
      return null;
    }
  }

  /// 逆地理编码
  static Future<Map<String, dynamic>?> geocodeFromServer({
    double? longitude,
    double? latitude,
    double? radius = 1000,
    String? extensions = "all",
  }) async {
    String fullUrl =
        "$kBaseUrl&location=${longitude},${latitude}&key=$kKey&radius=$radius&extensions=$extensions";
    try {
      Response response = await AmapNet().dio.get(fullUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  ///开始定位
  static Future<Map?> startLocationAndGeocode() async {
    try {
      //检查权限
      final hasPermission = await requestLocationPermission();
      if (!hasPermission) {
        return null;
      }
      Position? position;
      /*
      某些机型上通过Geolocator.getCurrentPosition方法获取不到定位,暂不清楚原因。
      可以尝试先获取getLastKnownPosition，没有数据的话再去请求getCurrentPosition方法。
      */
      Position? lastKnownPosition = await Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: true,
      );
      if (lastKnownPosition == null) {
        Position? currentPosition = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
        );
        position = currentPosition;
      } else {
        position = lastKnownPosition;
      }

      locationData = position;
      if (locationData == null) {
        return null;
      }
      double longitude = 0;
      double latitude = 0;
      if (Platform.isIOS) {
        //转成高德坐标系
        List result =
            GpsUtil.gps84_To_Gcj02(position.latitude, position.longitude);
        longitude = result.last;
        latitude = result.first;
      } else if (Platform.isAndroid) {
        longitude = position.longitude;
        latitude = position.latitude;
      } else {
        longitude = position.longitude;
        latitude = position.latitude;
      }

      Map<String, dynamic>? geoResultData =
          await geocodeFromServer(longitude: longitude, latitude: latitude);
      if (geoResultData == null) {
        return null;
      }
      return geoResultData;
    } catch (e) {
      print("定位失败 $e");
      return null;
    }
  }

  /// 动态申请定位权限
  static void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      print("定位权限申请通过");
    } else {
      print("定位权限申请不通过");
    }
  }

  /// 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  static Future<bool> requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
