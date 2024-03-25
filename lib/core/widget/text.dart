import 'package:flutter/material.dart';
import 'package:to_do_app2/constant.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight? fontWeight;
  const TextWidget(
      {super.key,
      required this.text,
      required this.size,
      this.color = kWhiteColor,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'lato',
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}
