import 'package:flutter/material.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/services/api.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:provider/provider.dart';

class MovieService {
  getListTrending(BuildContext context, String date) async {
    await getApi(
      '$serverUrl/trending/all/$date?api_key=$apiKey',
    ).then((value) {
      if (date == 'day') {
        Provider.of<MovieProvider>(context, listen: false).setListTrendingToday(
          value.data['results'],
        );
      } else {
        Provider.of<MovieProvider>(context, listen: false).setListTrendingWeek(
          value.data['results'],
        );
      }
    });
  }

  getListMovie(BuildContext context) async {
    await getApi(
      '$serverUrl/movie/popular?api_key=$apiKey',
    ).then((value) {
      Provider.of<MovieProvider>(context, listen: false).setListMovie(
        value.data['results'],
      );
    });
  }

  getListTV(BuildContext context) async {
    await getApi(
      '$serverUrl/tv/popular?api_key=$apiKey',
    ).then((value) {
      Provider.of<MovieProvider>(context, listen: false).setListTV(
        value.data['results'],
      );
    });
  }

  Future getDetail(BuildContext context, String type, int id) async {
    Map response;
    await getApi(
      '$serverUrl/$type/$id?api_key=$apiKey',
    ).then((value) {
      response = value.data;
    });
    return response;
  }

  Future getRecommendation(BuildContext context, String type, int id) async {
    List response = [];
    await getApi(
      '$serverUrl/$type/$id/recommendations?api_key=$apiKey',
    ).then((value) {
      response = value.data['results'];
    });
    return response;
  }
}
