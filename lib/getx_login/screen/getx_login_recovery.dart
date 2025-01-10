import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_login/controller/getx_login_controller.dart';
import 'package:get/get.dart';

class GetxLoginRecoveryScreen extends StatelessWidget {
  GetxLoginRecoveryScreen({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GetXLoginController controller = Get.put(GetXLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 찾기'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: '이메일을 입력해주세요.',
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
                if (idController.text.isEmpty || emailController.text.isEmpty) {
                  Get.snackbar('알림', '모든 필드를 입력해주세요.');
                  return;
                }

                bool isSuccess = controller.recovery(idController.text, emailController.text);
                if (isSuccess) {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('비밀번호 변경'),
                      content: TextField(
                        decoration: const InputDecoration(
                          hintText: '신규 비밀번호를 입력해주세요',
                        ),
                        obscureText: true,
                        controller: passwordController,
                        onChanged: (value) {
                          controller.password.value = value;
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('취소'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (controller.password.value.isEmpty) {
                              Get.snackbar('알림', '비밀번호를 입력해주세요.');
                              return;
                            }
                            controller.passwordChange(idController.text, passwordController.text);
                            Get.back();
                            Get.snackbar('알림', '비밀번호가 변경되었습니다.');
                          },
                          child: const Text('확인'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('확인'),
            )
          ],
        ),
      ),
    );
  }
}
