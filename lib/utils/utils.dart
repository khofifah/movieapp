import 'package:flutter/material.dart';

final String apiKey = '24bb05f18d59504807ff121bc1115609';
final String serverUrl = 'https://api.themoviedb.org/3';
final String urlImage = 'https://image.tmdb.org/t/p/w500';

const Color primaryColor = Color(0xff59bfff);
const Color secColor = Color(0xffbfe6ff);
const Color thirdColor = Color(0xff1e2f97);

bool validateEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return false;
  else
    return true;
}
