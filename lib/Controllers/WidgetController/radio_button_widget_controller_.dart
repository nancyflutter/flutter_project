import 'package:get/get.dart';

class RadioButtonController extends GetxController {
  var num = 1.obs;
  var char = "A".obs;

  void updateValues(int newNum) {
    num.value = newNum;
  }
  void updateCharValues(String newNum) {
    char.value = newNum;
  }
}
