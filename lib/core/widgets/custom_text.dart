import 'package:flutter/material.dart';
import 'package:recast_design/core/style/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final Color color;
  final double letterSpacing;
  final Gradient? gradient;
  final TextAlign? textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.height = 1.0,
    this.color = Colors.black,
    this.letterSpacing = 0,
    this.gradient,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    if (gradient != null) {
      return ShaderMask(
        shaderCallback: (bounds) {
          return gradient!.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          );
        },
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            height: height,
            color: AppColors.white,
            letterSpacing: letterSpacing,
          ),
        ),
      );
    } else {
      return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          color: color,
          letterSpacing: letterSpacing,
        ),
      );
    }
  }
}
