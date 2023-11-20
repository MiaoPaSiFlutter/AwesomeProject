import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../constants/app_colors.dart';
import '../providers/image_provider.dart';
import '../providers/models_provider.dart';
import '../providers/send_message_provider.dart';
import 'splash_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

class ChatGPTApp extends GetView<ChatGPTAppController> {
  const ChatGPTApp({super.key});

  @override
  ChatGPTAppController get controller => Get.put(ChatGPTAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class ChatGPTAppController extends GetxController {
  ChatGPTAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
        ChangeNotifierProvider(create: (_) => SendMessageProvider()),
        ChangeNotifierProvider(create: (_) => ImagesProvider()),
      ],
      child: MaterialApp(
        title: 'Chatbot app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.cyan,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.black,
          appBarTheme: const AppBarTheme(color: AppColors.black),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
