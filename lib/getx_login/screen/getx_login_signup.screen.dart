import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_login/controller/getx_login_controller.dart';
import 'package:get/get.dart';

class GetxLoginSignupScreen extends StatelessWidget {
  GetxLoginSignupScreen({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    hintText: '아이디를 입력해주세요.',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: '비밀번호를 입력해주세요.',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(300, 50),
            ),
            onPressed: () {
              bool isSuccess = controller.signup(idController.text, passwordController.text);
              if (isSuccess) {
                Get.snackbar('알림', '회원가입이 완료되었습니다.');
                Get.back();
              }
            },
            child: const Text('저장'),
          )
        ],
      ),
    );
  }
}
