import 'package:flutter/material.dart';
import 'package:movieapp/pages/detail_movie/widgets.dart';
import 'package:movieapp/providers/connection_provider.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/utils/routes.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_text.dart';
import 'package:movieapp/widgets/no_connection.dart';
import 'package:movieapp/widgets/show_loading.dart';
import 'package:movieapp/widgets/top_item.dart';
import 'package:provider/provider.dart';
import './detail_movie_view_model.dart';

class DetailMovieView extends DetailMovieViewModel {
  @override
  Widget build(BuildContext context) {
    MovieProvider movie = Provider.of<MovieProvider>(context);
    Size size = MediaQuery.of(context).size;
    bool isConnect =
        Provider.of<ConnectionProvider>(context).isConnect ?? false;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: isLoading
              ? circleLoading(context)
              : !isConnect
                  ? NoConnection(onRefresh: () => getDetailMovie())
                  : Column(
                      children: [
                        SizedBox(
                          child: Stack(
                            children: [
                              topItem(context, selectedMovie, true),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: InkWell(
                                  onTap: () {
                                    goBack(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      widget.isBack
                                          ? Icons.arrow_back
                                          : Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                cardDetail(
                                  'Year',
                                  selectedMovie['release_date']
                                      .toString()
                                      .substring(0, 4),
                                ),
                                SizedBox(height: 20),
                                cardDetail(
                                  'Popularity',
                                  selectedMovie['popularity'].toString(),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight: size.width * 0.2,
                                  ),
                                  width: size.width,
                                  child: CustomText(
                                    text: selectedMovie['overview'],
                                    useMaxline: false,
                                    isOverflow: false,
                                    fontSize: 16,
                                    align: TextAlign.justify,
                                  ),
                                ),
                                SizedBox(height: 30),
                                CustomText(
                                  text: 'Reccommendation',
                                  fontSize: 18,
                                  isBold: true,
                                ),
                                SizedBox(height: 20),
                                listRecommendation(
                                  context,
                                  listRecom,
                                  widget.type,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
