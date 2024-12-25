import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_counter/controller/getx_counter_controller.dart';
import 'package:flutter_getx_learn/getx_counter/screen/getx_example_screen.dart';
import 'package:get/get.dart';

class GetxCounterScreen extends StatelessWidget {
  const GetxCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 컨트롤러 초기화
    final GetxCounterController controller = Get.put(GetxCounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 카운터 앱'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('클릭된 횟수: ${controller.count}')),
            ElevatedButton(
              onPressed: controller.increment,
              child: const Text('증가'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const GetxExampleScreen());
              },
              child: const Text('다음 페이지로'),
            ),
          ],
        ),
      ),
    );
  }
}
