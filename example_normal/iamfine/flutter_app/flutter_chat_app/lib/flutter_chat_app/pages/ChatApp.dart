import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'composition_root.dart';
import 'theme.dart';

class ChatApp extends GetView<ChatAppController> {
  const ChatApp({super.key});

  @override
  ChatAppController get controller => Get.put(ChatAppController());

  @override
  Widget build(BuildContext context) {
    return const MyAppWapper();
  }
}

class ChatAppController extends GetxController {
  ChatAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyAppWapper extends StatefulWidget {
  const MyAppWapper({super.key});

  @override
  _MyAppWapperState createState() => _MyAppWapperState();
}

class _MyAppWapperState extends State<MyAppWapper> {
  var _init = false;
  Widget _firstPage = Container();
  @override
  void initState() {
    super.initState();
    main();
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CompositionRoot.configure();
    _firstPage = await CompositionRoot.start();
    setState(() {
      _init = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _init
        ? MyApp(_firstPage)
        : const Center(
            child: Text("加载中。。。"),
          );
  }
}

class MyApp extends StatelessWidget {
  final Widget firstPage;

  MyApp(this.firstPage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: firstPage,
    );
  }
}
