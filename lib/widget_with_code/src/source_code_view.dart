import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_speed_dial_floating_button.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class SourceCodeView extends StatefulWidget {

  // Path of source file (relative to project root). The file's content will be
  // shown in the "Code" tab.
  final String filePath;
  final String? codeLinkPrefix;
  final bool showLabelText;
  final Color? iconBackgroundColor;
  final Color? iconForegroundColor;
  final Color? labelBackgroundColor;
  final TextStyle? labelTextStyle;
  final Widget? headerWidget;
  final Widget? footerWidget;
  final Map<String, TextStyle>? lightTheme;
  final Map<String, TextStyle>? darkTheme;

  const SourceCodeView({
    Key? key,
    required this.filePath,
    this.codeLinkPrefix,
    this.showLabelText = false,
    this.iconBackgroundColor,
    this.iconForegroundColor,
    this.labelBackgroundColor,
    this.labelTextStyle,
    this.headerWidget,
    this.footerWidget,
    this.lightTheme,
    this.darkTheme,
  }) : super(key: key);

  String? get codeLink =>
      codeLinkPrefix == null ? null : '$codeLinkPrefix/$filePath';

  @override
  SourceCodeViewState createState() {
    return SourceCodeViewState();
  }
}

class SourceCodeViewState extends State<SourceCodeView> {
  double _textScaleFactor = 5.0;

  Widget _getCodeView(String codeContent, BuildContext context) {
    codeContent = codeContent.replaceAll('\r\n', '\n');
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (widget.headerWidget != null) ...[
                widget.headerWidget!,
                const Divider(),
              ],
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HighlightView(
                  codeContent,
                  language: 'dart',
                  theme: Theme.of(context).brightness == Brightness.light
                      ? widget.lightTheme ?? atomOneLightTheme
                      : widget.darkTheme ?? atomOneDarkTheme,
                ),
              ),
              if (widget.footerWidget != null) ...[
                const Divider(),
                widget.footerWidget!,
              ],
            ],
          ),
        ),
      ),
    );
  }

  void zoomIn() {
    setState(() {
      _textScaleFactor += 0.1;
    });
  }

  void zoomOut() {
    setState(() {
      _textScaleFactor = max(0.8, _textScaleFactor - 0.1);
    });
  }

  Future<void> copyCodeToClipboard() async {
    Clipboard.setData(ClipboardData(
        text:
            await DefaultAssetBundle.of(context).loadString(widget.filePath)));
    Get.snackbar(
      'Massage',
      'Copy code to clipboard',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      borderRadius: 13,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(widget.filePath),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _getCodeView(snapshot.data!, context),
            ),
            floatingActionButton: CommonSpeedDialFloatingButton(
              children: [
                SpeedDialChild(
                  onTap: () {
                    _textScaleFactor += 0.5;
                    zoomIn();
                  },
                  child: const Icon(Icons.zoom_in),
                ),
                SpeedDialChild(
                  onTap: () {
                    zoomOut();
                    _textScaleFactor = max(0.8, _textScaleFactor - 0.1);
                  },
                  child: const Icon(Icons.zoom_out),
                ),
                SpeedDialChild(
                  onTap: () {
                    copyCodeToClipboard();
                  },
                  child: const Icon(Icons.copy),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _getCodeView(snapshot.data ?? "", context),
            ),
          );
        }
      },
    );
  }
}


