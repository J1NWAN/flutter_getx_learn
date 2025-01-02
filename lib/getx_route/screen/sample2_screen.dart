import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_route/screen/sample3_screen.dart';
import 'package:flutter_getx_learn/getx_route/screen/sample4_screen.dart';
import 'package:get/get.dart';

class Sample2Screen extends StatelessWidget {
  const Sample2Screen({super.key});

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
            const Text('Get.toNamed()를 사용해서 이동된 화면'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('아래 버튼을 클릭하면 Sample3Screen으로 이동하며 현재 페이지로 돌아올 수 없습니다. 주로 스플래시 화면이나 로그인 화면에 사용됩니다.'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(() => const Sample3Screen());
              },
              child: const Text('이동하기'),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('아래 버튼을 클릭하면 Sample4Screen으로 이동하고 이전 화면을 모두 삭제합니다. 주로 장바구니 같은 화면에 사용됩니다.'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => const Sample4Screen());
              },
              child: const Text('이동하기'),
            ),
          ],
        ),
      ),
    );
  }
}
