import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOutline extends StatelessWidget {
  const TextOutline({
    super.key,
    required this.text,
    required this.textStyle,
    required this.blurRadius,
    required this.dx,
    required this.dy,
    this.colorText,
    this.colorBorder,
  });

  final String text;
  final TextStyle textStyle;
  final Color? colorText;
  final Color? colorBorder;
  final double blurRadius;
  final double dx;
  final double dy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: textStyle.copyWith(
            color: colorBorder ?? Colors.white,
            shadows: [
              Shadow(
                blurRadius: blurRadius,
                color: colorBorder ?? Colors.white,
                offset: Offset(dx, dy),
              ),
            ],
          ),
        ),
        Text(
          text,
          style: textStyle.copyWith(color: colorText),
        ),
      ],
    );
  }
}
