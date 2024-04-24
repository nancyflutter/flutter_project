import 'package:get/get.dart';

class WidgetModel {
  final String? title;
  final String? details;
  final int? id;
  RxBool isFavorite;
  final String? codeFilePath;
  final dynamic screenName;
  // final dynamic child;

  WidgetModel({
    this.title,
    this.details,
    this.id,
    required this.isFavorite,
    this.codeFilePath,
    this.screenName,
    // this.child,
  });
}
