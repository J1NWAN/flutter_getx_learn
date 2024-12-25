import 'package:get/get.dart';

class GetxCounterController extends GetxController {
  // GetX의 변수는 .obs 키워드를 사용해서 선언해야 한다.
  var count = 0.obs;

  void increment() {
    count++;
  }
}
