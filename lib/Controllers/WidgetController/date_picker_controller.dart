import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());
  Rx<TimeOfDay> selectedTime = Rx<TimeOfDay>(TimeOfDay.now());

  //------------------------DatePickerMethod------------------------------//

  void selectDateFunc(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      if (kDebugMode) {
        print("date ------------------>>> ${selectedDate.value}");
      }
      showSelectedDateSnackBar();
    }

    if (pickedDate == null) {
      if (kDebugMode) {
        print("date ------------------>>>");
      }
      noSelectedDateSnackBar();
    }
  }

  void showSelectedDateSnackBar() {
    Get.snackbar(
      "selected date:",
      "$selectedDate.value",
      messageText: Row(
        children: [
          const Icon(Icons.watch_later, color: Colors.yellow),
          Text(
            " $selectedDate.value",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
      colorText: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[300],
    );
  }

  void noSelectedDateSnackBar() {
    Get.snackbar(
      "Not Selected: ",
      "NULL",
      messageText: const Row(
        children: [
          Icon(Icons.watch_later, color: Colors.yellow),
          Text(
            "NULL",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
      colorText: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[300],
    );
  }

  //------------------------TimePickerMethod------------------------------//

  Future<void> selectedTimeFunc(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (newTime != null) {
      selectedTime.value = newTime;
      if (kDebugMode) {
        print("time ------------->>> ${selectedTime.value}");
      }
      showSelectedTimeSnackBar();
    }
    if (newTime == null) {
      if (kDebugMode) {
        print("no selected ------------->>>");
      }
      noSelectedDateSnackBar();
    }
  }

  void showSelectedTimeSnackBar() {
    Get.snackbar(
      "selected Time:",
      "$selectedTime.value",
      messageText: Row(
        children: [
          const Icon(Icons.watch_later, color: Colors.yellow),
          Text(
            " $selectedTime.value",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
      colorText: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[300],
    );
  }
}
