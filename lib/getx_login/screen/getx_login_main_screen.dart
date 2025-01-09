import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_learn/getx_login/controller/getx_login_controller.dart';
import 'package:flutter_getx_learn/getx_login/screen/getx_login_recovery.dart';
import 'package:flutter_getx_learn/getx_login/screen/getx_login_signup.screen.dart';
import 'package:flutter_getx_learn/getx_login/screen/getx_login_success.screen.dart';
import 'package:get/get.dart';

class LoginMainScreen extends StatelessWidget {
  LoginMainScreen({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                    hintText: 'ID',
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
                    hintText: 'Password',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(() => GetxLoginSignupScreen());
                    },
                    child: const Text('회원가입'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const GetxLoginRecoveryScreen());
                    },
                    child: const Text('비밀번호 찾기'),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(300, 50),
                ),
                onPressed: () {
                  if (idController.text.isEmpty || passwordController.text.isEmpty) {
                    Get.snackbar('알림', '아이디와 비밀번호를 입력해주세요.');
                    return;
                  }

                  if (controller.login(idController.text, passwordController.text)) {
                    Get.to(() => const GetxLoginSuccessScreen());
                  }
                },
                child: const Text('로그인'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
