import 'package:flutter_project/Controllers/WidgetController/animation_controller_.dart';
import 'package:flutter_project/Controllers/WidgetController/back_drop_filter_controller_.dart';
import 'package:flutter_project/Controllers/WidgetController/column_controller_.dart';
import 'package:flutter_project/Controllers/WidgetController/date_picker_controller.dart';
import 'package:flutter_project/Controllers/WidgetController/dismissible_controller_.dart';
import 'package:flutter_project/Controllers/WidgetController/list_view_widget_controller.dart';
import 'package:flutter_project/Controllers/WidgetController/radio_button_widget_controller_.dart';
import 'package:flutter_project/Controllers/WidgetController/random_color_gen_controller.dart';
import 'package:flutter_project/Controllers/WidgetController/row_controller_.dart';
import 'package:flutter_project/Controllers/bottom_navigation_controller.dart';
import 'package:flutter_project/Controllers/example_controller.dart';
import 'package:flutter_project/Controllers/home_controller.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/TweetGenerator/Controller/pizza_app_controller_.dart';
import 'package:get/get.dart';

class BottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ExampleController());
    Get.lazyPut(() => DatePickerController());
    Get.lazyPut(() => ListViewController());
    Get.lazyPut(() => RandomColorController());
    Get.lazyPut(() => AnimationControllerScreen());
    Get.lazyPut(() => BackDropFilterController());
    Get.lazyPut(() => ColumnController());
    Get.lazyPut(() => RowController());
    Get.lazyPut(() => DismissibleController());
    Get.lazyPut(() => RadioButtonController());
    Get.lazyPut(() => PizzaController());
  }
}
