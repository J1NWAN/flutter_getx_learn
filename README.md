# GetX를 사용한 예제 프로젝트

## 프로젝트 목표

GetX를 사용하여 예제 프로젝트를 만들고 화면 이동 및 데이터 전달 방법을 익힌다.
<br>
예제에 대한 정보나 아이디어는 GetX 공식 문서를 참고한다.(https://github.com/jonataslaw/getx/blob/master/README.ko-kr.md)

## 프로젝트 구성

1. GetX를 사용한 카운터 앱
    - 버튼을 눌렀을 때 누른 횟수만큼 단순히 숫자가 증가하는 앱
    - GetX를 사용하여 Route 이동 및 데이터 전달 방법을 익힌다.
    - obs 키워드에 대한 이해를 배운다.
    - Controller 클래스를 활용하여 다른 화면으로 이동할 때 데이터를 전달한다.

2. GetX를 사용한 라우트 관리 예제
    - Get.to(), Get.toNamed(), Get.off(), Get.offAll() 메서드를 사용하여 화면 이동 및 데이터 전달 방법을 익힌다.
        1. Get.to() : 현재 화면을 유지하면서 이동
        2. Get.toNamed() : 현재 화면을 유지하면서 이동, Get.to메서드와 다르게 main.dart에 정의된 라우트 이름을 사용하여 이동
        3. Get.off() : 현재 화면을 삭제하고 이동
        4. Get.offAll() : 현재 화면을 삭제하고 이동
