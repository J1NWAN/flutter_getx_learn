import 'package:get/get.dart';

class GetXLoginController extends GetxController {
  final RxBool isLogin = false.obs;

  final RxString id = ''.obs;
  final RxString password = ''.obs;
  final RxString email = ''.obs;

  final List<Map<String, String>> userList = [];

  bool login(String id, String password) {
    if (userList.any((user) => user['id'] == id && user['password'] == password)) {
      isLogin.value = true;
      return true;
    } else {
      Get.snackbar('알림', '아이디 또는 비밀번호가 틀렸습니다.');
      return false;
    }
  }

  bool signup(String id, String password, String email) {
    if (userList.any((user) => user['id'] == id)) {
      Get.snackbar('알림', '이미 존재하는 아이디입니다.');
      return false;
    }

    userList.add({'id': id, 'password': password, 'email': email});
    return true;
  }

  bool recovery(String id, String email) {
    if (userList.any((user) => user['id'] == id && user['email'] == email)) {
      return true;
    } else {
      Get.snackbar('알림', '아이디 또는 이메일이 틀렸습니다.');
      return false;
    }
  }

  void passwordChange(String id, String password) {
    for (var user in userList) {
      if (user['id'] == id) {
        user['password'] = password;
      }
    }
  }
}
