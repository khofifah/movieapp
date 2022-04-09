import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  bool isBold;
  Color color;
  FontWeight weight;
  bool isNormalHeight;
  int maxLines;
  bool useMaxline;
  TextAlign align;
  FontStyle style;
  double spacing;
  double fontSize;
  bool isOverflow;
  double opacity;

  CustomText({
    this.text,
    this.isBold = false,
    this.color = Colors.black87,
    this.isNormalHeight = false,
    this.maxLines,
    this.useMaxline = true,
    this.align = TextAlign.start,
    this.style = FontStyle.normal,
    this.fontSize,
    this.isOverflow = true,
    this.opacity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color.withOpacity(opacity ?? 1.0),
        fontSize: fontSize ?? 14,
        fontWeight: isBold ? FontWeight.bold : weight ?? FontWeight.normal,
        height: 1,
        fontStyle: style,
      ),
      textAlign: align,
      maxLines: useMaxline ? maxLines ?? 1 : null,
      overflow: isOverflow ? TextOverflow.ellipsis : null,
    );
  }
}
