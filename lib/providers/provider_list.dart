import 'package:flutter/material.dart';
import 'package:movieapp/providers/connection_provider.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => MovieProvider()),
  ChangeNotifierProvider(create: (_) => ConnectionProvider()),
];
