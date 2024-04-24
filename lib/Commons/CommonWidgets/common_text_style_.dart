import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CommonText(
      {super.key,
      required this.data,
      this.color,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
