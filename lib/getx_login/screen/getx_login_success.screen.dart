import 'package:flutter/material.dart';

class GetxLoginSuccessScreen extends StatelessWidget {
  const GetxLoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인 성공'),
      ),
      body: const Center(
        child: Text('로그인 성공 페이지'),
      ),
    );
  }
}
