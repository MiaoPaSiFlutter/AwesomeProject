import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../providers/providers_index.dart';
import '../routers/routers_index.dart';
import '../tools/tools_index.dart';

class FoodHubApp extends GetView<FoodHubAppController> {
  const FoodHubApp({super.key});

  @override
  FoodHubAppController get controller => Get.put(FoodHubAppController());

  @override
  Widget build(BuildContext context) {
    return MyAppWrapper();
  }
}

class FoodHubAppController extends GetxController {
  FoodHubAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  bool _init = false;
  @override
  void initState() {
    super.initState();
    main();
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

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
  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }
}
