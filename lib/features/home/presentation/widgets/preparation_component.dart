import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_sizes.dart';

class PreparationTimeBadge extends StatelessWidget {
  final String text;

  const PreparationTimeBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSize.padding(
        vertical: AppSize.getHeight(10),
        horizontal: AppSize.getWidth(10),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white30,
        border: Border.all(width: AppSize.getSize(1), color: AppColors.white18),
        borderRadius: BorderRadius.circular(AppSize.getSize(6)),
      ),
      child: CustomText(
        text: text,
        fontSize: AppSize.font(10),
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        letterSpacing: -0.05,
      ),
    );
  }
}
