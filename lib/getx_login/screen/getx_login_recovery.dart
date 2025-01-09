import 'package:flutter/material.dart';

class GetxLoginRecoveryScreen extends StatelessWidget {
  const GetxLoginRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 찾기'),
      ),
      body: const Center(
        child: Text('비밀번호 찾기 페이지'),
      ),
    );
  }
}
