import 'package:get/get.dart';

class BackDropFilterController extends GetxController{
  var sX = 5.0.obs;
  var sY = 5.0.obs;
  var textVar = "".obs;

  void updateValues(double sX, double sY, String text){
    this.sX.value = sX;
    this.sY.value = sY;
    textVar.value = text;
  }
}