import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonSliverAppBar extends StatelessWidget {
  final bool? forceElevated;
  final bool? pinned;
  final Color? shadowColor;
  final bool? snap;
  final bool? floating;
  final ShapeBorder? shape;
  final double? elevation;
  final Color? backgroundColor;
  final double? expandedHeight;
  final Widget? flexibleSpace;
  final Widget? backgroundImage;
  final bool? centerTitle;
  final Widget? title;
  final TextStyle? style;

  const CommonSliverAppBar({
    super.key,
    this.forceElevated,
    this.pinned,
    this.shadowColor,
    this.snap,
    this.floating,
    this.shape,
    this.elevation,
    this.backgroundColor,
    this.expandedHeight,
    this.flexibleSpace,
    this.backgroundImage,
    this.centerTitle,
    this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: forceElevated ?? true,
      pinned: pinned ?? true,
      shadowColor: shadowColor ?? Colors.grey,
      snap: snap ?? false,
      floating: floating ?? false,
      excludeHeaderSemantics: true,
      shape: shape,
      elevation: elevation ?? 3,
      backgroundColor: backgroundColor ?? Colors.white,
      expandedHeight: expandedHeight ?? Get.height * 0.12,
      flexibleSpace: flexibleSpace ??
          FlexibleSpaceBar(
            background: backgroundImage ??
                Image.asset("assets/animation/setting_animation.gif"),
            centerTitle: centerTitle ?? true,
            title: title ??
                Text(
                  "Widget",
                  style: style ??
                      const TextStyle(
                        color: Colors.black,
                        height: 0.05,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
          ),
    );
  }
}
