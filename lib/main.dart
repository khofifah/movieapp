import 'package:flutter/material.dart';
import 'package:movieapp/providers/provider_list.dart';
import 'package:movieapp/utils/shared_preferences.dart';
import 'package:movieapp/widgets/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with SharedPreferencesHandler {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerList,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
