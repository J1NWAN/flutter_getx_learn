import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sample1Screen extends StatelessWidget {
  const Sample1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('샘플 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Get.to()를 사용해서 이동된 화면'),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('뒤로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
