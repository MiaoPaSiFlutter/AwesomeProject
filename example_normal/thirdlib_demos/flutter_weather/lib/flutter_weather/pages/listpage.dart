// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'dart:math' show asin, cos, pi, sqrt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_weather/flutter_weather.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:hzy_common_module/hzy_common_module.dart' hide PermissionStatus;

class CityList extends StatefulWidget {
  const CityList({super.key});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  List<Map<String, dynamic>> cities = [];
  List<Map<String, dynamic>> filteredCities = [];
  Map<String, List<Map<String, dynamic>>> _searchIndex = {};
  TextEditingController _searchController = TextEditingController();
  bool searching = false;
  List<Weather> cityWeather = [];
  bool isLoading = true;
  bool edit = false;
  bool enabled = false;
  bool loading = true;
  LocationData? _locationData;
  final _dataService = DataService();
  WeatherResponse? _response;
  LocationData? _previousLocationData;

  Future<WeatherResponse> getWeather(long, lat) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?&lon=$long&lat=$lat&appid=${Utils.appid()}&units=metric'));
    final json = jsonDecode(response.body);
    var responsee = WeatherResponse.fromJson(json);
    setState(() => _response = responsee);

    return responsee;
  }

  Future<Object> fetchWeather() async {
    final prefs = await SharedPreferences.getInstance();
    cityWeather = [];
    List<dynamic> ctid = prefs.getStringList('cityIds') ?? [];
    String cittiesIds = ctid.join(',');
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/group?id=$cittiesIds&APPID=${Utils.appid()}&units=metric'));

    if (response.statusCode == 200) {
      List<Weather> weatherData = [];
      Map<String, dynamic> values = json.decode(response.body);
      List<dynamic> list = values['list'];
      for (Map<String, dynamic> weather in list) {
        weatherData.add(Weather.fromJson(weather));
      }
      setState(() {
        cityWeather = weatherData;
      });
    }
    return cityWeather;
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
    fetchWeather();
    _loadCities();
  }

  void _loadCities() async {
    String data = await rootBundle.loadString(Utils.assets('json/citys.json'));
    List<dynamic> cities = json.decode(data);
    setState(() {
      cities = cities.map((city) => Map<String, dynamic>.from(city)).toList();
      filteredCities = cities as List<Map<String, dynamic>>;
      isLoading = false;

      // Populate the search index
      _searchIndex = {};
      for (var city in cities) {
        String name =
            '${city['owm_city_name']}, ${city['admin_level_1_long']}, ${city['country_long']}';
        if (name.isNotEmpty) {
          // check if name is not empty
          String initial = name.substring(0, 1).toLowerCase();
          if (_searchIndex[initial] == null) {
            _searchIndex[initial] = [];
          }
          _searchIndex[initial]?.add(city);
        }
      }
    });
  }

  void _determinePosition() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      enabled = true;
    });
    LocationData previousLocationData;

    LocationData currentLocationData = await location.getLocation();

    location.onLocationChanged.listen((LocationData currentLocation) {
      double distanceInMeters = _calculateDistance(
          currentLocationData.latitude,
          currentLocationData.longitude,
          currentLocation.latitude,
          currentLocation.longitude);
      if (distanceInMeters > 500) {
        // change threshold as required
        currentLocationData = currentLocation;
        getWeather(currentLocationData.longitude, currentLocationData.latitude);
      }
    });

    previousLocationData = currentLocationData;
    getWeather(previousLocationData.longitude, previousLocationData.latitude);
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    final p = pi / 180;
    final c = cos;
    final a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000;
  }

  void _filterCities(String query) {
    List<String> searchTerms = query.split(",");
    if (searchTerms.isNotEmpty && searchTerms[0].isNotEmpty) {
      String initial = searchTerms[0].toLowerCase().substring(0, 1);
      if (_searchIndex[initial] != null) {
        setState(() {
          filteredCities = _searchIndex[initial]!.where((city) {
            String cityName = city['owm_city_name'].toLowerCase();
            String stateName = city['admin_level_1_long'].toLowerCase();
            String countryName = city['country_long'].toLowerCase();
            for (var term in searchTerms) {
              if (term.trim().isNotEmpty &&
                  !cityName.contains(term.trim().toLowerCase()) &&
                  !stateName.contains(term.trim().toLowerCase()) &&
                  !countryName.contains(term.trim().toLowerCase())) {
                return false;
              }
            }
            return true;
          }).toList();
        });
      } else {
        setState(() {
          filteredCities = [];
        });
      }
    } else {
      setState(() {
        filteredCities = [];
      });
    }
  }

  Future<void> saveCityIds(String cityId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cityIds = prefs.getStringList('cityIds') ?? <String>[];
    if (!cityIds.contains(cityId)) {
      cityIds.add(cityId);
      await prefs.setStringList('cityIds', cityIds);
      fetchWeather();
    }
  }

  Future<void> removeCityIds(String cityId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cityIds = prefs.getStringList('cityIds') ?? <String>[];
    if (cityIds.contains(cityId)) {
      cityIds.remove(cityId);
      await prefs.setStringList('cityIds', cityIds);
      fetchWeather();
    }
  }

  Future<List<String>> getCityIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('cityIds') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSearchBar(),
            Flexible(
              child: _searchController.text.isNotEmpty
                  ? _buildFilteredResultView()
                  : enabled && loading == true
                      ? ListView.builder(
                          itemCount: enabled
                              ? cityWeather.length + 1
                              : cityWeather.length,
                          itemBuilder: (ctx, index) {
                            if (index == 0 && enabled) {
                              return _response != null
                                  ? WeatherLocationWidget(
                                      response: _response!,
                                      cityWeather: cityWeather,
                                      index: index)
                                  : Container();
                            } else {
                              int cityIndex = enabled ? index - 1 : index;
                              return _response != null
                                  ? WeatherCityWidget(
                                      response: _response!,
                                      cityWeather: cityWeather,
                                      index: index,
                                      cityIndex: cityIndex,
                                      enabled: enabled,
                                      edit: edit,
                                    )
                                  : Container();
                            }
                          },
                        )
                      : ListView.builder(
                          itemCount: enabled
                              ? cityWeather.length + 1
                              : cityWeather.length,
                          itemBuilder: (ctx, index) {
                            if (index == 0 && enabled) {
                              return _response != null
                                  ? WeatherLocationWidget(
                                      response: _response!,
                                      cityWeather: cityWeather,
                                      index: index)
                                  : Container();
                            } else {
                              int cityIndex = enabled ? index - 1 : index;
                              return _response != null
                                  ? WeatherCityWidget(
                                      response: _response!,
                                      cityWeather: cityWeather,
                                      index: index,
                                      cityIndex: cityIndex,
                                      enabled: enabled,
                                      edit: edit,
                                    )
                                  : Container();
                            }
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  // 导航栏View
  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        'Weather App',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        edit
            ? TextButton(
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : IconButton(
                onPressed: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 23.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.white12, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                          height: MediaQuery.of(context).size.height - 600,
                          child: Column(children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 9, bottom: 4),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    child: Text('Settings'),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                  color: Color.fromARGB(60, 49, 49, 49),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: DefaultTextStyle(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  child: Text('Edit List')),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  edit = true;
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              icon: const Icon(
                                                CupertinoIcons.pencil,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  CupertinoIcons.ellipsis_circle,
                  color: Colors.white,
                ),
              )
      ],
    );
  }

  // 搜索输入框View
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 13, right: 13),
      child: Container(
        child: CupertinoSearchTextField(
          itemSize: 18,
          placeholder: 'Search for a city',
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.white,
              inherit: false),
          controller: _searchController,
          onSuffixTap: () {
            setState(() {
              _searchController.text = '';
              filteredCities = [];
            });
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value) {
            isLoading ? _loadCities() : _filterCities(value);
          },
        ),
      ),
    );
  }

  // 搜索结果View
  Widget _buildFilteredResultView() {
    return filteredCities.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 30,
            itemBuilder: (context, index) {
              if (index >= filteredCities.length) {
                return const SizedBox.shrink();
              }
              final cityName = filteredCities[index]['owm_city_name'];
              final country = filteredCities[index]['country_long'];
              final state = filteredCities[index]['admin_level_1_long'];
              final teste = '$cityName, $state, $country';

              final query = _searchController.text.toLowerCase();
              final matchIndex = teste.toLowerCase().indexOf(query);

              if (matchIndex == -1) {
                return const SizedBox.shrink();
              }

              final before = teste.substring(0, matchIndex);
              final match =
                  teste.substring(matchIndex, matchIndex + query.length);
              final after = teste.substring(matchIndex + query.length);

              return GestureDetector(
                onTap: () {
                  saveCityIds(filteredCities[index]['owm_city_id']);
                  setState(() {
                    _searchController.text = '';
                    filteredCities = [];
                  });
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: before,
                          style: const TextStyle(color: Colors.white60),
                        ),
                        TextSpan(
                          text: match,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: after,
                          style: const TextStyle(color: Colors.white12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : Text(_searchController.text);
  }
}

class UnixTimestampClock extends StatefulWidget {
  final int timezone;
  UnixTimestampClock({Key? key, required this.timezone}) : super(key: key);

  @override
  _UnixTimestampClockState createState() => _UnixTimestampClockState();
}

class _UnixTimestampClockState extends State<UnixTimestampClock> {
  late Timer _timer;
  late DateTime _dateTime;
  var _timezone = 0;

  @override
  void initState() {
    super.initState();
    _timezone = widget.timezone;
    _timer = Timer.periodic(const Duration(seconds: 1), _updateDateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant UnixTimestampClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.timezone != oldWidget.timezone) {
      setState(() {
        _timezone = widget.timezone;
      });
    }
  }

  void _updateDateTime(Timer timer) {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    _dateTime = DateTime.now();
    var date = _dateTime.add(Duration(
        seconds: _timezone.toInt() - DateTime.now().timeZoneOffset.inSeconds));
    var formattedTime = DateFormat.Hm().format(date);
    return Text(
      formattedTime,
      style: const TextStyle(
          color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
    );
  }
}
