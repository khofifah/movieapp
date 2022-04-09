import 'package:flutter/material.dart';

goTo(BuildContext context, dynamic page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

goBack(BuildContext context) {
  Navigator.pop(context);
}
