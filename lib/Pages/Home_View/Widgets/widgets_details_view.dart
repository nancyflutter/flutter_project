import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/bottom_navigation_controller.dart';
import 'package:flutter_project/widget_with_code/src/widget_with_codeview.dart';
import 'package:get/get.dart';

class WidgetDetailScreen extends StatelessWidget {
  final bottomController = Get.find<BottomNavigationController>();
  final String widgetName;
  final String title;
  final String details;
  final String codeFilePath;
  final Widget screenName;

  WidgetDetailScreen({
    Key? key,
    required this.widgetName,
    required this.title,
    required this.codeFilePath,
    required this.screenName,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bottomController.isSwitch.value
            ? Colors.black
            : !bottomController.isSwitch.value
                ? bottomController.selectedColor
                : Get.theme.primaryColor,
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(details),
                ),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
          if (title == "Safe Area") ...[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        body: Center(
                          child: GestureDetector(
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: "hero",
                              child: WidgetWithCodeView(
                                filePath: codeFilePath,
                                child: screenName,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.fullscreen),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text("Show Ad"),
                  ),
                ];
              },
              onSelected: (value) {},
            ),
          ),
        ],
      ),
      body: WidgetWithCodeView(
        filePath: codeFilePath,
        child: screenName,
      ),
    );
  }
}
