import 'package:flutter/material.dart';

class Sample3Screen extends StatelessWidget {
  const Sample3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Get.off()를 사용해서 이동된 화면'),
        ),
      ),
    );
  }
}
