// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../compontents/compontents_index.dart';
import '../constants/constants_index.dart';
import '../provider/provider_index.dart';
import '../services/Net/http_manager.dart';
import 'bottom_navigation_bar.dart';
import 'on_board/on_board_screen.dart';

class CryptoMarketApp extends StatelessWidget {
  const CryptoMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => APIServiceProvider()),
        ChangeNotifierProvider(create: (context) => StreamsProvider()),
        ChangeNotifierProvider(create: (context) => ChartsProvider()),
      ],
      child: MaterialApp(
          title: AppString.appName,
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: ShowSnackBar.messengerKey,
          navigatorKey: NavigationService.navigatorKey,
          theme:
              ThemeData(primarySwatch: Colors.indigo, fontFamily: "Vollkorn"),
          home: const OnBoardScreen()),
    );
  }
}

class TestApiScreen extends StatelessWidget {
  const TestApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: () {
            var headers = {
              "Host": "api.coingecko.com",
              "User-Agent":
                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/119.0",
              "Accept":
                  "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
              "Accept-Language":
                  "zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2",
              "Accept-Encoding": "gzip, deflate, br",
              "Connection": "keep-alive",
              "Cookie":
                  "__cf_bm=hWAaGxi1v8a7unlJGezhO1y8JDhMenBLjrrx.NrQO1M-1700187746-0-AZVNDiUxTiWkty6/4FsEM40siEOWlj1kRXlCMbJ6sjRw8Vc8fm+WAC8FqtYKpLmT0BRT57xm6eFO95BicKGqBzA=; __cf_bm=oBjm0AWsuURYYqbJaSs5yQ2Zn0Kazz68LvncSbiEV1c-1700187861-0-ATVNk49x77oYxhYdWPwd+IVNzUClrflwU5wFRvLOnY2D9mzY/UvgqR5bi2VRMz9/JXl6DjnsOHME3uDYH3Jpx6s=; _gcl_au=1.1.868367777.1700187862; _ga_LJR3232ZPB=GS1.1.1700187862.1.1.1700188282.0.0.0; _ga=GA1.1.363919422.1700187862",
              "Upgrade-Insecure-Requests": 1,
              "Sec-Fetch-Dest": "document",
              "Sec-Fetch-Mode": "navigate",
              "Sec-Fetch-Site": "none",
              "Sec-Fetch-User": "?1",
              "Pragma": "no-cache",
              "Cache-Control": "no-cache",
            };
            HttpManager.getInstance(baseUrl: '')
                .get(
              'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true',
              options: Options(
                headers: headers,
              ),
            )
                .then((resp) {
              dPrint("$resp");
            });
          },
          child: Text("点击获取数据"),
        ),
      ),
    );
  }
}
