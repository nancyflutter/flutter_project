import 'package:get/get.dart';

class DismissibleController extends GetxController {
  final List<int> items = List<int>.generate(10, (int index) => index).obs;
  final List<int> colorCode =
      <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900].obs;

  void updateValues(int index) {
    items.removeAt(index);
    colorCode.removeAt(index);
    update();
  }
}
