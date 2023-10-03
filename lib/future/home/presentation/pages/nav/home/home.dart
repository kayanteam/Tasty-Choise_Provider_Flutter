import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_page_view.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/home/presentation/pages/nav/home/add_product_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyContainerShape(
                height: 58.r,
                width: 58.r,
                borderRadius: 50,
                bgContainer: AppColors.BASE_COLOR,
                child: MyText(
                  title: 'B',
                  color: AppColors.WHITE,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    MyText(title: 'حياك الله،👋'),
                    SizedBox(height: 2.h),
                    MyText(title: 'مطعم البيك', fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          const MyPageView(
            images: [
              "https://hips.hearstapps.com/hmg-prod/images/best-ever-burger-index-646e5ae887b2b.jpg"
                  "https://food-images.files.bbci.co.uk/food/recipes/black_and_blue_burger_95881_16x9.jpg"
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: 'منتجاتي',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 0,
              ),
              MyElevatedButton(
                title: 'اضافة منتج',
                titleColor: AppColors.BLACK,
                background: AppColors.TRANSPARENT,
                borderColor: AppColors.BLACK,
                borderRaduis: 50,
                width: 100,
                height: 40,
                onPressed: () {
                  AppHelpers.navigationToPage(context, AddProductScreen());
                },
              )
            ],
          ),
          SizedBox(height: 24.h),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 166 / 230,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (context, index) {
              return MyContainerShape(
                bgContainer: AppColors.WHITE2,
                borderRadius: 12,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.r,
                        vertical: 12.r,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/images/klipartz.png',
                            height: 110.r,
                            width: 110.r,
                          ),
                          SizedBox(height: 5.h),
                          MyText(
                            title: 'برجر خاص',
                            fontSize: 12,
                          ),
                          MyText(
                            title: '120.00ر.س',
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: MyElevatedButton(
                                  title: 'تعديل',
                                  onPressed: () {},
                                  fontSize: 10,
                                  height: 35,
                                  titleColor: AppColors.BLUE,
                                  background: AppColors.BLUE.withOpacity(.1),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              MyContainerShape(
                                bgContainer: AppColors.RED.withOpacity(.1),
                                height: 35.r,
                                width: 35.r,
                                borderRadius: 8,
                                child: SvgPicture.asset(
                                    'assets/images/ic_delete.svg'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    if (index % 2 == 0)
                      PositionedDirectional(
                        top: 0,
                        end: 0,
                        child: MyContainerShape(
                          paddingHorizontal: 8,
                          bottomStartRaduis: 8,
                          bgContainer: AppColors.BASE_COLOR,
                          paddingVertical: 8,
                          child: MyText(
                            title: 'قيمة التخفيض 20%',
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: AppColors.WHITE,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
