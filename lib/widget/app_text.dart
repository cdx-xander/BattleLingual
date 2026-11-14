import 'package:flutter/material.dart';

class AppText extends StatelessWidget{
  final String text;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontweight;
  final TextAlign? textAlign;
  AppText({
    super.key,
    required this.text,
    this.color,
    this.fontsize,
    this.fontweight,
    this.textAlign

  }
  );

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontweight,
    ),
    textAlign: textAlign,
    );
  }
}