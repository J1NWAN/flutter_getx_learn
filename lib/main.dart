import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() {
    count.value++;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // count가 변경 될 때마다 Obx(()=> 를 사용하여 Text()에 업데이트합니다.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${controller.count}"))),

        // 8줄의 Navigator.push를 간단한 Get.to()로 변경합니다. context는 필요없습니다.
        body: Center(child: ElevatedButton(child: const Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(onPressed: controller.increment, child: const Icon(Icons.add)));
  }
}

class Other extends StatelessWidget {
  Other({super.key});

  // 다른 페이지에서 사용되는 컨트롤러를 Get으로 찾아서 redirect 할 수 있습니다.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // 업데이트된 count 변수에 연결
    return Scaffold(appBar: AppBar(title: Text("${c.count}")), body: Center(child: Text("${c.count}")));
  }
}
