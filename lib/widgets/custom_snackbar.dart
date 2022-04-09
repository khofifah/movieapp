import 'package:flutter/material.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_text.dart';

customSnackbar(
  BuildContext context,
  String text, {
  Color backColor,
  Color textColor,
}) {
  return SnackBar(
    backgroundColor: backColor ?? thirdColor,
    content: CustomText(
      text: text,
      color: textColor ?? Colors.white,
      isBold: true,
      fontSize: 14,
    ),
    duration: const Duration(seconds: 1),
  );
}
