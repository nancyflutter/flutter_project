import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final double? enabledBorderWidth;
  final double? focusedBorderWidth;
  final Color? fillColor;
  final Color? focusColor;
  final BorderRadius? enabledBorderRadius;
  final BorderRadius? focusedBorderRadius;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<BoxShadow>? textFieldBoxShadow;
  final void Function(String)? onSubmitted;

  const CommonTextField({
    super.key,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.enabledBorderWidth,
    this.focusedBorderWidth,
    this.fillColor,
    this.focusColor,
    this.enabledBorderRadius,
    this.focusedBorderRadius,
    this.textFieldBoxShadow,
    this.controller,
    this.keyboardType,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 20.0, top: 10, right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: textFieldBoxShadow,
        ),
        child: TextField(
          onSubmitted: onSubmitted,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            // icon: Icon(Icons.person),
            // border: InputBorder.none,
            fillColor: fillColor ?? Colors.grey.shade300,
            focusColor: focusColor ?? Colors.grey.shade300,
            filled: true,
            prefixIcon: prefixIcon,
            labelText: labelText,
            hintText: hintText ?? "UserName",
            enabledBorder: OutlineInputBorder(
              borderRadius: enabledBorderRadius ??
                  const BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(
                color: enabledBorderColor ?? Colors.black,
                width: enabledBorderWidth ?? 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: focusedBorderRadius ??
                  const BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(
                color: focusedBorderColor ?? Get.theme.primaryColor,
                width: focusedBorderWidth ?? 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
