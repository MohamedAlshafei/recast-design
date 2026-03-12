import 'package:flutter/material.dart';

import '../../../core/widgets/custom_blur_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_sizes.dart';

class BuildFoodItem extends StatelessWidget {
  BuildFoodItem({super.key, required this.imagePath});
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.getSize(9)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.getSize(9)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.2, 0.8, 1.0],
                    colors: [
                      Color(0xff222222).withAlpha(0),
                      Color(0xff222222).withAlpha(138),
                      Color(0xff222222),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: AppSize.padding(
                start: AppSize.getWidth(5),
                end: AppSize.getWidth(5),
                bottom: AppSize.getHeight(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Tenderloin Steak with Grilled Vegetables",
                      fontWeight: FontWeight.w500,
                      fontSize: AppSize.font(8),
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: AppSize.getWidth(5)),
                  BlurCircleButton(
                    size: 27,
                    blur: 2,
                    borderRadius: AppSize.getSize(13.5),
                    borderColor: AppColors.white30,
                    child: CustomText(
                      text: "49.95 JOD",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSize.font(6),
                      letterSpacing: -0.05,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
