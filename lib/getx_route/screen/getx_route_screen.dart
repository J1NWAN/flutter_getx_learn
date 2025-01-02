import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_route/screen/sample1_screen.dart';
import 'package:get/get.dart';

class GetxRouteScreen extends StatelessWidget {
  const GetxRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 라우트 관리 예제'),
      ),
      body: Column(
        children: [
          buildListTile('Get.to() / Get.back()', 'Get.to()를 사용해서 이동된 화면', () {
            Get.to(() => const Sample1Screen());
          }),
          buildListTile('Get.toNamed() / Get.off(), Get.offAll()', 'Get.toNamed()를 사용해서 이동된 화면', () {
            Get.toNamed('/sample2');
          }),
        ],
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
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
