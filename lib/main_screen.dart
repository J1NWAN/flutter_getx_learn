import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_counter/screen/getx_counter_screen.dart';
import 'package:flutter_getx_learn/getx_community/screen/getx_community_main.screen.dart';
import 'package:flutter_getx_learn/getx_route/screen/getx_route_screen.dart';
import 'package:flutter_getx_learn/getx_theme_change/screen/getx_theme_change_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('예제로 알아보는 GetX'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildListTile('GetX 카운터 앱', 'GetX를 사용한 카운터 앱', const GetxCounterScreen()),
            buildListTile('GetX 라우트 관리 예제', 'GetX를 사용한 라우트 관리 예제', const GetxRouteScreen()),
            buildListTile('GetX 테마 변경 예제', 'GetX를 사용한 테마 변경 예제', const GetxThemeChangeScreen()),
            buildListTile('GetX 활용 예제1(커뮤니티)', 'GetX를 사용한 커뮤니티 예제', GetxCommunityMainScreen()),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, Widget screen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Get.to(() => screen);
        },
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.white, width: 1),
        ),
        tileColor: Colors.white.withOpacity(0.1),
      ),
    );
  }
}
