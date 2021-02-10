import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui_scale.dart';

// ignore: must_be_immutable
class UIText extends StatelessWidget {
  UIText(this.text, {this.fontSize, this.color, this.fontWeight});
  String text;
  double fontSize;
  Color color;
  FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: GoogleFonts.openSans(
          decoration: TextDecoration.none,
          fontSize: fontSize ?? UIScale.width(5),
          color: color ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
