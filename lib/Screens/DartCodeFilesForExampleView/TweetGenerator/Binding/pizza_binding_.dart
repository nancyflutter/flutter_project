import 'package:flutter_project/Screens/DartCodeFilesForExampleView/TweetGenerator/Controller/pizza_app_controller_.dart';
import 'package:get/get.dart';

class PizzaAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PizzaController());
  }
}
