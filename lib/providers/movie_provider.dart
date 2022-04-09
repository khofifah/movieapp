import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  List listMovie = [];
  List listTV = [];
  List listTrendingToday = [];
  List listTrendingWeek = [];

  setListMovie(List data) async {
    listMovie = data;
    notifyListeners();
  }

  setListTV(List data) async {
    listTV = data;
    notifyListeners();
  }

  setListTrendingToday(List data) async {
    listTrendingToday = data;
    notifyListeners();
  }

  setListTrendingWeek(List data) async {
    listTrendingWeek = data;
    notifyListeners();
  }
}
