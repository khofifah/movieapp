import 'package:flutter/material.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_divider.dart';
import 'package:movieapp/widgets/custom_text.dart';

Widget topItem(
  BuildContext context,
  Map data,
  bool isDetail,
) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width,
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: isDetail ? null : size.width,
              padding: EdgeInsets.only(bottom: 25),
              constraints: BoxConstraints(minHeight: size.width * 0.3),
              child: Image.network(
                urlImage +
                    (data[isDetail ? 'backdrop_path' : 'poster_path'] ??
                        data['poster_path']),
                fit: isDetail ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0, 0.1),
                        colors: <Color>[
                          Colors.transparent,
                          primaryColor,
                        ],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            text: data['vote_average'].toString(),
                            align: TextAlign.center,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          customVerDivider(),
                          CustomText(
                            text: data['adult'] ? 'Adult' : 'Teen',
                            align: TextAlign.center,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          width: size.width,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: CustomText(
            text: data['title'] ?? data['original_name'] ?? '',
            align: TextAlign.center,
            color: Colors.white,
            fontSize: 18,
            useMaxline: false,
            isBold: true,
          ),
        ),
      ],
    ),
  );
}
