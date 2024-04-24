import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBackDropScaffold extends StatelessWidget {
  final Widget backLayer;
  final Color? scaffoldBackgroundColor;
  final Widget? floatingActionButton;
  final Widget frontLayer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final BorderRadius? frontLayerBorderRadius;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Color? backLayerBackgroundColor;
  final Widget? subHeader;
  final PreferredSizeWidget? preferredAppBar;
  final Color? appBarBackgroundColor;

  const CommonBackDropScaffold({
    super.key,
    required this.backLayer,
    required this.frontLayer,
    this.scaffoldBackgroundColor,
    this.floatingActionButton,
    this.appBar,
    this.bottomNavigationBar,
    this.frontLayerBorderRadius,
    this.scaffoldKey,
    this.backLayerBackgroundColor,
    this.subHeader,
    this.preferredAppBar,
    this.appBarBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      stickyFrontLayer: true,
      floatingActionButton: floatingActionButton,
      backgroundColor: scaffoldBackgroundColor ?? Get.theme.primaryColor,
      frontLayerShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18),
          topLeft: Radius.circular(18),
        ),
      ),
      appBar: preferredAppBar,
      subHeader: subHeader,
      backLayer: backLayer,
      frontLayer: frontLayer,
      bottomNavigationBar: bottomNavigationBar,
      frontLayerBorderRadius: frontLayerBorderRadius,
      scaffoldKey: scaffoldKey,
      backLayerBackgroundColor: backLayerBackgroundColor,
    );
  }
}
