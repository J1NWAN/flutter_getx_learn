import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_login/controller/getx_login_controller.dart';
import 'package:flutter_getx_learn/getx_login/screen/getx_login_recovery.dart';
import 'package:flutter_getx_learn/getx_login/screen/getx_login_signup.screen.dart';
import 'package:flutter_getx_learn/getx_login/screen/getx_login_success.screen.dart';
import 'package:get/get.dart';

class LoginMainScreen extends StatelessWidget {
  LoginMainScreen({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GetXLoginController controller = Get.put(GetXLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  hintText: 'ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 8),
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
                      Get.to(() => GetxLoginRecoveryScreen());
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
                  minimumSize: const Size(double.infinity, 50),
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
          ),
        ),
      ),
    );
  }
}
