import 'package:flutter/material.dart';
import 'package:movieapp/providers/connection_provider.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/services/movie_service.dart';
import 'package:provider/provider.dart';
import './detail_movie.dart';

abstract class DetailMovieViewModel extends State<DetailMovie> {
  MovieProvider movieProvider = MovieProvider();
  ConnectionProvider conProvider = ConnectionProvider();
  List listRecom = [];
  Map selectedMovie;
  bool isLoading = true;

  getDetailMovie() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    await conProvider.checkConnectivity().then((value) async {
      if (conProvider.isConnect) {
        await MovieService()
            .getDetail(context, widget.type, widget.id)
            .then((detail) async {
          await MovieService()
              .getRecommendation(context, widget.type, widget.id)
              .then((listrecom) {
            if (!mounted) return;
            setState(() {
              selectedMovie = detail;
              listRecom = listrecom;
              isLoading = false;
            });
          });
        });
      }
    });
  }

  @override
  void initState() {
    getDetailMovie();
    movieProvider = Provider.of<MovieProvider>(context, listen: false);
    conProvider = Provider.of<ConnectionProvider>(context, listen: false);
    super.initState();
  }
}
