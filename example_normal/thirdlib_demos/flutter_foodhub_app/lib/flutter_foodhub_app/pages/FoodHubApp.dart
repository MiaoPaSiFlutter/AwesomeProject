import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';

class FoodHubApp extends StatefulWidget {
  const FoodHubApp({super.key});

  @override
  State<FoodHubApp> createState() => _FoodHubAppState();
}

class _FoodHubAppState extends State<FoodHubApp> {
  bool _init = false;
  @override
  void initState() {
    super.initState();
    main();
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    final NotificationHelper notificationHelper = NotificationHelper();
    final BackgroundServiceHelper backgroundServiceHelper =
        BackgroundServiceHelper();

    backgroundServiceHelper.initializeIsolate();
    if (Platform.isAndroid) {
      await AndroidAlarmManager.initialize();
    }
    await notificationHelper.initNotification(flutterLocalNotificationsPlugin);

    setState(() {
      _init = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _init
        ? const MyApp()
        : const Center(
            child: Text('准备中。。。'),
          );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationHelper notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    notificationHelper
        .configureSelectNotificationSubject(Routes.restaurantDetailScreen);
  }

  void checkAlarmNotification(
      PreferenceSettingsProvider preferenceSettingsProvider) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final notif = Provider.of<NotificationSchedulingProvider>(
          Navigation.getContext(),
          listen: false);

      if (preferenceSettingsProvider.isDailyNotificationActive) {
        // Check shared prefs alarm is true, then set notif schedule to be active
        notif.notifScheduleNews(
            preferenceSettingsProvider.isDailyNotificationActive);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantFavoriteProvider(
            databaseHelper: DatabaseHelper(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferenceSettingsProvider(
            preferenceSettingsHelper: PreferenceSettingsHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationSchedulingProvider(),
        ),
      ],
      child: Consumer<PreferenceSettingsProvider>(
        builder: (context, preferenceSettingsProvider, _) {
          checkAlarmNotification(preferenceSettingsProvider);
          return MaterialApp(
            title: 'Food Hub App',
            theme: preferenceSettingsProvider.themeData,
            navigatorKey: navigatorKey,
            initialRoute: Routes.splashScreen,
            routes: routesApp,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}
