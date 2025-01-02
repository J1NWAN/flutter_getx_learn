import 'package:flutter/material.dart';

class Sample4Screen extends StatelessWidget {
  const Sample4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Get.offAll()를 사용해서 이동된 화면'),
        ),
      ),
    );
  }
}
