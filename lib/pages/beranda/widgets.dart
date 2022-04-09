import 'package:flutter/material.dart';
import 'package:movieapp/pages/detail_movie/detail_movie.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_divider.dart';
import 'package:movieapp/widgets/custom_text.dart';

Widget itemMovie(
  Map data,
  Size size,
  int index, {
  Function onTap,
}) {
  double widthItem = size.width * 0.3;

  return InkWell(
    onTap: () => onTap(),
    child: Container(
      width: widthItem,
      margin: EdgeInsets.only(
        right: 20,
        left: index == 0 ? 20 : 0,
      ),
      decoration: BoxDecoration(
        color: secColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: widthItem,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: size.width * 0.2,
                    ),
                    child: Image.network(
                      urlImage + data['poster_path'],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  width: widthItem,
                  decoration: BoxDecoration(
                    color: secColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: CustomText(
                    text: data['title'] ?? data['original_name'] ?? '',
                    align: TextAlign.center,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: secColor,
                shape: BoxShape.circle,
              ),
              child: CustomText(
                text: data['vote_average'].toString(),
                align: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget listMovieCard(
  BuildContext context,
  String label,
  List data,
  String type,
) {
  Size size = MediaQuery.of(context).size;

  return Column(
    children: [
      SizedBox(height: 30),
      Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomText(
          text: label,
          fontSize: 20,
          isBold: true,
        ),
      ),
      SizedBox(height: 10),
      Container(
        width: size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: data.map((e) {
              int index = data.indexOf(e);
              String itemType = type == 'trending' ? e['media_type'] : type;

              return itemMovie(
                e,
                size,
                index,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    isScrollControlled: true,
                    builder: (_) {
                      return DetailMovie(
                        type: itemType,
                        id: e['id'],
                      );
                    },
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    ],
  );
}
