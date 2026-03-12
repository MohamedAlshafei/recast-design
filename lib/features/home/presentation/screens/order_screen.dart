import 'package:flutter/material.dart';
import 'package:recast_design/features/home/presentation/widgets/build_food_item.dart';
import 'package:recast_design/features/home/presentation/controller/order_state.dart';
import 'package:recast_design/features/home/presentation/controller/order_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recast_design/features/home/data/repo/order_repo_impl.dart';
import 'package:recast_design/core/widgets/custom_blur_button.dart';
import 'package:recast_design/core/widgets/custom_text.dart';
import 'package:recast_design/core/style/app_colors.dart';
import 'package:recast_design/core/style/app_sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(OrderRepoImpl())..fetchOrderData(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrderError) {
              return Center(
                child: CustomText(text: state.message, color: Colors.red),
              );
            } else if (state is OrderLoaded) {
              final data = context.read<OrderCubit>().orderData!;
              return CustomScrollView(
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
                                  image: AssetImage(data.headerImage),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    AppSize.getSize(44),
                                  ),
                                  topLeft: Radius.circular(AppSize.getSize(44)),
                                ),
                              ),
                            ),

                            /// BLUR BACK BUTTON
                            PositionedDirectional(
                              start: AppSize.getWidth(13),
                              top: AppSize.getHeight(31),
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
                              end: AppSize.getWidth(21),
                              top: AppSize.getHeight(37),
                              child: BlurCircleButton(
                                size: AppSize.getSize(38),
                                child: Image.asset(data.profileImage),
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
                            end: AppSize.getWidth(13),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: data.category,
                                fontWeight: FontWeight.w700,
                                fontSize: AppSize.font(10),
                                color: AppColors.grey80,
                                letterSpacing: -0.05,
                              ),
                              SizedBox(height: AppSize.getHeight(5)),
                              CustomText(
                                text: data.title,
                                fontWeight: FontWeight.w700,
                                fontSize: AppSize.font(18),
                                height: 1.2,
                                color: AppColors.white,
                                letterSpacing: -0.05,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffE4B679),
                                    Color(0xffFEE5C4),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              SizedBox(height: AppSize.getHeight(4)),
                              CustomText(
                                text: data.description,
                                fontSize: AppSize.font(10),
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey70,
                                height: 1.2,
                                letterSpacing: -0.05,
                              ),

                              SizedBox(height: AppSize.getHeight(15)),
                              CustomText(
                                text: data.atmosphereTitle,
                                fontSize: AppSize.font(10),
                                fontWeight: FontWeight.w700,
                                color: AppColors.grey70,
                                letterSpacing: -0.05,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.getHeight(15)),

                        /// SLIDER
                        Container(
                          margin: AppSize.margin(start: AppSize.getWidth(15)),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              autoPlay: true,
                              enlargeCenterPage: false,
                              viewportFraction: 0.60,
                              padEnds: false,
                            ),
                            items: data.sliderImages.map((image) {
                              return Container(
                                padding: AppSize.padding(
                                  end: AppSize.getWidth(9),
                                ),
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
                        SizedBox(height: AppSize.getHeight(15)),

                        Padding(
                          padding: AppSize.padding(
                            start: AppSize.getWidth(15),
                            end: AppSize.getWidth(15),
                          ),
                          child: CustomText(
                            text: data.foodMenuTitle,
                            fontSize: AppSize.font(11),
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.05,
                            color: AppColors.grey80,
                          ),
                        ),
                        SizedBox(height: AppSize.getHeight(9)),
                      ],
                    ),
                  ),

                  /// FOOD MENU
                  SliverPadding(
                    padding: AppSize.padding(horizontal: 15),
                    sliver: SliverMasonryGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSize.getHeight(7),
                      crossAxisSpacing: AppSize.getWidth(7),
                      itemBuilder: (context, index) {
                        return BuildFoodItem(product: data.products[index]);
                      },
                      childCount: data.products.length,
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSize.getHeight(50)),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
