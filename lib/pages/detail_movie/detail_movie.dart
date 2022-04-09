import 'package:flutter/material.dart';
import './detail_movie_view.dart';

class DetailMovie extends StatefulWidget {
  final int id;
  final String type;
  final bool isBack;

  const DetailMovie({
    Key key,
    this.id,
    this.type,
    this.isBack = false,
  }) : super(key: key);

  @override
  DetailMovieView createState() => new DetailMovieView();
}
