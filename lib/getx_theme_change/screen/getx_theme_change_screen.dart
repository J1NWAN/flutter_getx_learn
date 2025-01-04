import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxThemeChangeScreen extends StatelessWidget {
  const GetxThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 테마 변경 예제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('아래 버튼을 누르면 테마가 변경됩니다.'),
            ElevatedButton(
                onPressed: () {
                  Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                child: const Text('테마 변경')),
          ],
        ),
      ),
    );
  }
}
