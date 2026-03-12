import 'package:flutter/material.dart';
import 'package:recast_design/core/widgets/custom_blur_button.dart';
import 'package:recast_design/core/helper/app_navigator.dart';
import 'package:recast_design/core/widgets/custom_text.dart';
import 'package:recast_design/core/style/app_colors.dart';
import 'package:recast_design/core/style/app_sizes.dart';

import '../../data/models/order_model.dart';
import '../widgets/preparation_component.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                /// IMAGE
                Container(
                  width: double.infinity,
                  height: AppSize.getHeight(249),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppSize.getSize(44)),
                      topLeft: Radius.circular(AppSize.getSize(44)),
                    ),
                  ),
                ),

                /// BLUR BACK BUTTON
                PositionedDirectional(
                  start: AppSize.getWidth(13),
                  top: AppSize.getHeight(32),
                  child: GestureDetector(
                    onTap: () => AppNavigator.pop(),
                    child: BlurCircleButton(
                      size: AppSize.getSize(48),
                      borderRadius: AppSize.getSize(25),
                      borderColor: AppColors.black30,
                      blur: 4,
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: AppSize.getSize(20),
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),

                /// SHADOW
                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: Container(
                    height: 47,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.black0, AppColors.black],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: AppSize.padding(
                start: AppSize.getWidth(15),
                end: AppSize.getWidth(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: product.category,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.font(10),
                    color: AppColors.grey60,
                    letterSpacing: -0.05,
                  ),
                  CustomText(
                    text: product.name,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.font(18),
                    height: 1.2,
                    color: AppColors.white,
                    letterSpacing: -0.05,
                    gradient: LinearGradient(
                      colors: [Color(0xffE4B679), Color(0xffFEE5C4)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(6)),
                  CustomText(
                    text: product.description,
                    fontSize: AppSize.font(11),
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    height: 1.2,
                    letterSpacing: -0.05,
                  ),

                  SizedBox(height: AppSize.getHeight(14)),
                  CustomText(
                    text: "Preparation",
                    fontSize: AppSize.font(10),
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey70,
                    letterSpacing: -0.05,
                  ),

                  SizedBox(height: AppSize.getHeight(9)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PreparationTimeBadge(text: product.preparationTime),
                      SizedBox(width: AppSize.getWidth(4)),
                      PreparationTimeBadge(
                        text: "Serving Size: ${product.servingSize}",
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getHeight(27)),

                  Row(
                    children: [
                      /// PRICE
                      Column(
                        children: [
                          CustomText(
                            text: product.price,
                            fontSize: AppSize.font(15),
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            height: 0.98,
                            letterSpacing: -0.05,
                            gradient: LinearGradient(
                              colors: [Color(0xffE4B679), Color(0xffFEE5C4)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          CustomText(
                            text: "+ tax & service",
                            fontWeight: FontWeight.w700,
                            fontSize: AppSize.font(10),
                            color: AppColors.grey,
                            // letterSpacing: -0.05,
                          ),
                        ],
                      ),
                      Spacer(),

                      /// ORDER BUTTON
                      Container(
                        width: AppSize.getWidth(120),
                        height: AppSize.getHeight(45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(23),
                          ),
                          border: Border.all(
                            width: AppSize.getSize(1),
                            color: AppColors.white30,
                          ),
                          gradient: LinearGradient(
                            colors: [Color(0xffE4B679), Color(0xffFEE5C4)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Add To Order",
                              fontSize: AppSize.font(10),
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                              letterSpacing: -0.05,
                              height: 0.98,
                            ),

                            SizedBox(width: AppSize.getWidth(10)),

                            /// BLUR BUTTON
                            BlurCircleButton(
                              size: AppSize.getSize(36),
                              borderRadius: AppSize.getSize(18),
                              borderColor: AppColors.black10,
                              blur: 2,
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                size: AppSize.getSize(18),
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: AppSize.getHeight(20)),
          ],
        ),
      ),
    );
  }
}
