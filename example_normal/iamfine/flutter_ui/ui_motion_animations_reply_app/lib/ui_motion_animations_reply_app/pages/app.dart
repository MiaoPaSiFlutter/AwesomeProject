import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'providers/providers_index.dart';
import 'utils/utils_index.dart';

class ReplyApp extends StatefulWidget {
  const ReplyApp({Key? key}) : super(key: key);

  @override
  _ReplyAppState createState() => _ReplyAppState();
}

class _ReplyAppState extends State<ReplyApp> {
  final RouterProvider _replyState = RouterProvider(const ReplyHomePath());
  final ReplyRouteInformationParser _routeInformationParser =
      ReplyRouteInformationParser();
  late final ReplyRouterDelegate _routerDelegate;

  @override
  void initState() {
    super.initState();
    _routerDelegate = ReplyRouterDelegate(replyState: _replyState);
  }

  @override
  void dispose() {
    _routerDelegate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmailStore>.value(value: EmailStore()),
      ],
      child: Selector<EmailStore, ThemeMode>(
          selector: (context, emailStore) => emailStore.themeMode,
          builder: (context, themeMode, child) {
            return MaterialApp.router(
              routeInformationParser: _routeInformationParser,
              routerDelegate: _routerDelegate,
              themeMode: themeMode,
              title: 'Reply',
              darkTheme: buildReplyDarkTheme(context),
              theme: buildReplyLightTheme(context),
            );
          }),
    );
  }
}
