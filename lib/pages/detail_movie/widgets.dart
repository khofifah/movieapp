import 'package:flutter/material.dart';
import 'package:movieapp/pages/detail_movie/detail_movie.dart';
import 'package:movieapp/utils/routes.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_text.dart';

Widget listRecommendation(
  BuildContext context,
  List data,
  String type,
) {
  double width = MediaQuery.of(context).size.width;

  return Column(
      children: data.map((e) {
    return InkWell(
      onTap: () {
        goTo(
          context,
          DetailMovie(
            id: e['id'],
            type: type,
            isBack: true,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.network(
                urlImage + e['poster_path'],
                width: width * 0.2,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: e['title'] ?? e['original_title'],
                    maxLines: 2,
                    fontSize: 20,
                  ),
                  SizedBox(height: 5),
                  CustomText(
                    text: e['adult'] ? 'Adult' : 'Teen',
                    color: primaryColor,
                  ),
                  SizedBox(height: 5),
                  CustomText(
                    text: e['overview'],
                    maxLines: 2,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }).toList());
}

Widget cardDetail(String label, String desc) {
  return Row(
    children: [
      Expanded(
        child: CustomText(
          text: label,
          fontSize: 16,
          isBold: true,
          color: primaryColor,
        ),
      ),
      Expanded(
        child: CustomText(
          text: label,
          fontSize: 16,
          align: TextAlign.end,
        ),
      ),
    ],
  );
}
