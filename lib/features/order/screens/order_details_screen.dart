import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recast_design/core/constants/app_assets.dart';
import 'package:recast_design/core/style/app_colors.dart';
import 'package:recast_design/core/style/app_sizes.dart';
import 'package:recast_design/core/widgets/custom_text.dart';

import '../../../core/widgets/custom_blur_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
                      image: AssetImage(AppImages.steak),
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
                  start: AppSize.getWidth(20),
                  top: AppSize.getHeight(30),
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
                start: AppSize.getWidth(20),
                end: AppSize.getWidth(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Main Course",
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.font(10),
                    color: AppColors.grey60,
                    letterSpacing: -0.05,
                  ),
                  SizedBox(height: AppSize.getHeight(5)),
                  CustomText(
                    text: "Tenderloin Steak with Grilled Vegetables & Fries",
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
                  SizedBox(height: AppSize.getHeight(10)),
                  CustomText(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",

                    fontSize: AppSize.font(11),
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    height: 1.2,
                    letterSpacing: -0.05,
                  ),

                  SizedBox(height: AppSize.getHeight(20)),
                  CustomText(
                    text: "Preparation",
                    fontSize: AppSize.font(10),
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey70,
                    letterSpacing: -0.05,
                  ),

                  SizedBox(height: AppSize.getHeight(15)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: AppSize.padding(
                          vertical: AppSize.getHeight(10),
                          horizontal: AppSize.getWidth(10),
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.white30,
                          border: Border.all(
                            width: AppSize.getSize(1),
                            color: AppColors.white18,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(6),
                          ),
                        ),
                        child: CustomText(
                          text: "20 Minute",
                          fontSize: AppSize.font(10),
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          letterSpacing: -0.05,
                        ),
                      ),
                      SizedBox(width: AppSize.getWidth(5)),
                      Container(
                        padding: AppSize.padding(
                          vertical: AppSize.getHeight(10),
                          horizontal: AppSize.getWidth(10),
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.white30,
                          border: Border.all(
                            width: AppSize.getSize(1),
                            color: AppColors.white18,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(6),
                          ),
                        ),
                        child: CustomText(
                          text: "Serving Size: 1",
                          fontSize: AppSize.font(10),
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          letterSpacing: -0.05,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getHeight(25)),

                  Row(
                    children: [
                      /// PRICE
                      Column(
                        children: [
                          CustomText(
                            text: "45.95 JD",
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

                            SizedBox(width: AppSize.getWidth(20)),

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
