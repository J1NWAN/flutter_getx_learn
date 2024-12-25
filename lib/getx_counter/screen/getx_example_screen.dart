import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_counter/controller/getx_counter_controller.dart';
import 'package:get/get.dart';

class GetxExampleScreen extends StatelessWidget {
  const GetxExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetxCounterController controller = Get.find<GetxCounterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 예제 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('이전 화면에서 증가된 숫자:'),
            Obx(() => Text(
                  '${controller.count}',
                  style: const TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
