import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recast_design/core/widgets/custom_blur_button.dart';
import 'package:recast_design/core/helper/app_navigator.dart';
import 'package:recast_design/core/widgets/custom_text.dart';
import 'package:recast_design/core/style/app_colors.dart';
import 'package:recast_design/core/style/app_sizes.dart';

import '../../data/models/order_model.dart';
import '../screens/order_details_screen.dart';

class BuildFoodItem extends StatelessWidget {
  const BuildFoodItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.push(OrderDetailsScreen(product: product)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.getSize(9)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.getSize(9)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(product.image, fit: BoxFit.cover),
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

              /// STATUS
              if (product.status == "pending")
                PositionedDirectional(
                  top: AppSize.getHeight(5),
                  start: AppSize.getWidth(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.getSize(12)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        padding: AppSize.padding(
                          vertical: AppSize.getHeight(5),
                          horizontal: AppSize.getWidth(7),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(12),
                          ),
                          border: Border.all(
                            color: AppColors.white30,
                            width: 1,
                          ),
                          color: AppColors.white30,
                        ),
                        child: CustomText(
                          text: "Pending",
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.font(7),
                          color: AppColors.white,
                          height: 0.98,
                          letterSpacing: -0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: AppSize.padding(
                  start: AppSize.getWidth(7),
                  end: AppSize.getWidth(4),
                  bottom: AppSize.getHeight(9),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: product.name,
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
                        text: product.price,
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
      ),
    );
  }
}
