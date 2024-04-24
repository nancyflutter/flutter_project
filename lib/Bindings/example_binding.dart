import 'package:flutter_project/Controllers/example_controller.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/TweetGenerator/Controller/pizza_app_controller_.dart';
import 'package:get/get.dart';

class ExampleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ExampleController());
    Get.lazyPut(() => PizzaController());
  }
}
