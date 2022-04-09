import 'package:flutter/material.dart';
import 'package:movieapp/providers/connection_provider.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/services/movie_service.dart';
import 'package:provider/provider.dart';
import './beranda.dart';

abstract class BerandaViewModel extends State<Beranda> {
  MovieProvider movieProvider = MovieProvider();
  ConnectionProvider conProvider = ConnectionProvider();
  bool isLoading = true;

  getListMovie() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    await conProvider.checkConnectivity().then((value) async {
      if (conProvider.isConnect) {
        await MovieService().getListMovie(context);
        await MovieService().getListTV(context);
        await MovieService().getListTrending(context, 'day');
        await MovieService().getListTrending(context, 'week');
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    getListMovie();
    movieProvider = Provider.of<MovieProvider>(context, listen: false);
    conProvider = Provider.of<ConnectionProvider>(context, listen: false);
    super.initState();
  }
}
