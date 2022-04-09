import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/beranda/widgets.dart';
import 'package:movieapp/pages/detail_movie/detail_movie.dart';
import 'package:movieapp/providers/connection_provider.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/widgets/no_connection.dart';
import 'package:movieapp/widgets/show_loading.dart';
import 'package:movieapp/widgets/top_item.dart';
import 'package:provider/provider.dart';
import './beranda_view_model.dart';

class BerandaView extends BerandaViewModel {
  @override
  Widget build(BuildContext context) {
    MovieProvider movie = Provider.of<MovieProvider>(context);
    Size size = MediaQuery.of(context).size;
    bool isConnect =
        Provider.of<ConnectionProvider>(context).isConnect ?? false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? circleLoading(context)
            : !isConnect
                ? NoConnection(onRefresh: () => getListMovie())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        topItem(context, movie.listMovie[0], false),
                        listMovieCard(
                          context,
                          'Trending Today',
                          movie.listTrendingToday,
                          'trending',
                        ),
                        listMovieCard(
                          context,
                          'Trending This Week',
                          movie.listTrendingWeek,
                          'trending',
                        ),
                        listMovieCard(
                          context,
                          'Popular Movies',
                          movie.listMovie,
                          'movie',
                        ),
                        listMovieCard(
                          context,
                          'Popular TV Series',
                          movie.listTV,
                          'tv',
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
      ),
    );
  }
}
