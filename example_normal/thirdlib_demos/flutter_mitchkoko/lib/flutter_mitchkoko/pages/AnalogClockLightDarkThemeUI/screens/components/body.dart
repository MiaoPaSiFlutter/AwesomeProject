import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'clock.dart';
import 'country_card.dart';
import 'time_in_hour_and_minute.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const TimeInHourAndMinute(),
            const Clock(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CountryCard(
                      country: "New York, USA",
                      timeZone: "+3 HRS | EST",
                      iconSrc: NormalModuleUtils.configPackagesImage(
                          packagename: "flutter_mitchkoko",
                          name:
                              "assets/AnalogClockLightDarkThemeUI/images/Liberty.svg"),
                      time: "9:20",
                      period: "PM",
                    ),
                    CountryCard(
                      country: "Sydney, AU",
                      timeZone: "+19 HRS | AEST",
                      iconSrc: NormalModuleUtils.configPackagesImage(
                          packagename: "flutter_mitchkoko",
                          name:
                              "assets/AnalogClockLightDarkThemeUI/images/Sydney.svg"),
                      time: "1:20",
                      period: "AM",
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Newport Beach, USA | PST",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
