import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recast_design/core/style/app_colors.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/style/app_sizes.dart';
import '../../../core/widgets/custom_blur_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../widgets/build_food_item.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
  final List<String> images = [
    AppImages.ceen,
    AppImages.steak,
    AppImages.ceen2,
    AppImages.ceen,
    AppImages.steak,
    AppImages.ceen,
    AppImages.ceen2,
    AppImages.ceen,
    AppImages.ceen2,
    AppImages.steak,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.getHeight(249),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.ceen),
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

                    /// IMAGE
                    PositionedDirectional(
                      end: AppSize.getWidth(20),
                      top: AppSize.getHeight(30),
                      child: BlurCircleButton(
                        size: AppSize.getSize(38),
                        child: Image.asset(AppImages.profile),
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
                        text: "Lorem",
                        fontWeight: FontWeight.w700,
                        fontSize: AppSize.font(10),
                        color: AppColors.grey80,
                        letterSpacing: -0.05,
                      ),
                      SizedBox(height: AppSize.getHeight(5)),
                      CustomText(
                        text: "CEANO",
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

                        fontSize: AppSize.font(10),
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey70,
                        height: 1.2,
                        letterSpacing: -0.05,
                      ),

                      SizedBox(height: AppSize.getHeight(20)),
                      CustomText(
                        text: "Atmosphere",
                        fontSize: AppSize.font(10),
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey70,
                        letterSpacing: -0.05,
                      ),
                      SizedBox(height: AppSize.getHeight(20)),
                    ],
                  ),
                ),

                /// SLIDER
                Container(
                  margin: AppSize.margin(start: AppSize.getWidth(20)),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      autoPlay: true,
                      enlargeCenterPage: false,
                      viewportFraction: 0.60,
                      padEnds: false,
                    ),
                    items: images.map((image) {
                      return Container(
                        padding: AppSize.padding(end: AppSize.getWidth(10)),
                        width: 223,
                        height: AppSize.getHeight(239),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(8),
                          ),
                          child: Image.asset(image, fit: BoxFit.cover),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: AppSize.getHeight(20)),

                Padding(
                  padding: AppSize.padding(
                    start: AppSize.getWidth(20),
                    end: AppSize.getWidth(20),
                  ),
                  child: CustomText(
                    text: "Food Menu",
                    fontSize: AppSize.font(11),
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.05,
                    color: AppColors.grey80,
                  ),
                ),
                SizedBox(height: AppSize.getHeight(15)),
              ],
            ),
          ),
          SliverPadding(
            padding: AppSize.padding(horizontal: 20),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                return BuildFoodItem(imagePath: images[index]);
              },
              childCount: images.length,
            ),
          ),

          // مسافة إضافية تحت الـ Grid
          SliverToBoxAdapter(child: SizedBox(height: AppSize.getHeight(50))),
        ],
      ),
    );
  }
}
