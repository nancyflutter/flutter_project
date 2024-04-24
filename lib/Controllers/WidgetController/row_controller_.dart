import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowController extends GetxController {
  var mainAxisAlignment = MainAxisAlignment.center.obs;

  void updateValues(MainAxisAlignment mainAxisAlignment) {
    this.mainAxisAlignment.value = mainAxisAlignment;
  }
}
