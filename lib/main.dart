import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_route/screen/sample2_screen.dart';
import 'package:flutter_getx_learn/main_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: const MainScreen(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        primary: Colors.blue,
        secondary: Colors.blueAccent,
        surface: Colors.grey[900],
        background: Colors.black,
        error: Colors.redAccent,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
    ),
    // 라우트 관리 예제용
    getPages: [
      GetPage(name: '/sample2', page: () => const Sample2Screen()),
    ],
  ));
}
