import 'dart:ui';
import 'package:flutter/material.dart';

class BlurCircleButton extends StatelessWidget {
  const BlurCircleButton({
    super.key,
    required this.child,
    this.size = 36,
    this.blur = 2,
    this.borderRadius = 18,
    this.borderColor = const Color(0x33000000),
    this.backgroundColor = const Color(0x33000000),
  });

  final Widget child;
  final double size;
  final double blur;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          alignment: Alignment.center,
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(width: 1, color: borderColor),
            color: backgroundColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
