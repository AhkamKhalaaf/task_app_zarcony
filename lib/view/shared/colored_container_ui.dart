import 'package:flutter/material.dart';

class ColoredContainerUi extends StatelessWidget {
  const ColoredContainerUi(
      {Key? key,
      required this.width,
      required this.height,
      required this.colorBackground,
      required this.borderValue,
      required this.borderColor,
      required this.widget})
      : super(key: key);
  final double width;
  final double height;
  final Color colorBackground;
  final double borderValue;
  final Color borderColor;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: colorBackground,
          border: Border.all(width: 1.0, color: borderColor),
          borderRadius: BorderRadius.circular(borderValue)),
      child: widget,
    );
  }
}
