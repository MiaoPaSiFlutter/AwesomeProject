// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import '../extensions/extensions_index.dart';
import '../models/models_index.dart';
import '../pages/homepage.dart';
import '../pages/listpage.dart';
import '../tools/utils.dart';

class WeatherCityWidget extends StatelessWidget {
  WeatherCityWidget({
    Key? key,
    required this.response,
    required this.cityWeather,
    required this.index,
    required this.cityIndex,
    required this.enabled,
    required this.edit,
  }) : super(key: key);
  WeatherResponse response;
  List<Weather> cityWeather;
  int index;
  int cityIndex;
  bool enabled;
  bool edit;
  void pushCityHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        maintainState: true,
        builder: (context) => HomePage(
          cityWeather: cityWeather,
          indexx: index,
          loc: enabled,
          response: response,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (edit) {
      return _buildContent(context);
    } else {
      return GestureDetector(
        onTap: () {
          pushCityHome(context);
        },
        child: _buildContent(context),
      );
    }
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topLeft,
            children: [
              Ink.image(
                image: AssetImage(Utils.assets(
                    'images/${cityWeather[cityIndex].cityIcon}.jpeg')),
                height: 115,
                fit: BoxFit.cover,
                child: InkWell(
                  hoverColor: Colors.black,
                  onTap: () {
                    pushCityHome(context);
                  },
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cityWeather[cityIndex].cityName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700),
                            ),
                            UnixTimestampClock(
                              timezone:
                                  cityWeather[cityIndex].cityTimezone.toInt(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                cityWeather[cityIndex]
                                    .cityTempDesc
                                    .toTitleCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 80,
                            height: 78,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 9.0,
                                    sigmaY: 9.0,
                                  ),
                                  child: Container(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.13)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          //begin color
                                          Colors.white.withOpacity(0.15),
                                          //end color
                                          Colors.white.withOpacity(0.05),
                                        ]),
                                  ),
                                ),
                                //child ==> the first/top layer of stack
                                Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '${cityWeather[cityIndex].cityTemp.toStringAsFixed(0)}\u00B0',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'H:${cityWeather[cityIndex].cityHtemp.toStringAsFixed(0)}\u00B0',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'L:${cityWeather[cityIndex].cityLtemp.toStringAsFixed(0)}\u00B0',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }
}
