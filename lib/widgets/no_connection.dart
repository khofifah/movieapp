import 'package:flutter/material.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/widgets/custom_button.dart';
import 'package:movieapp/widgets/custom_text.dart';

class NoConnection extends StatefulWidget {
  final Function onRefresh;
  const NoConnection({
    Key key,
    this.onRefresh,
  }) : super(key: key);

  @override
  State<NoConnection> createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // width: size.width,
      height: size.height,
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning,
            size: size.width * 0.3,
            color: primaryColor,
          ),
          SizedBox(height: 10),
          CustomText(
            text: 'Network Error!',
            align: TextAlign.center,
            fontSize: 20,
          ),
          SizedBox(height: 20),
          Material(
            child: CustomButton(
              label: 'REFRESH',
              onTap: () {
                widget.onRefresh();
              },
            ),
          ),
        ],
      ),
    );
  }
}
