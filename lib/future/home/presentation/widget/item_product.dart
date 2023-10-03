import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/home/presentation/pages/nav/order/order_details_screen.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            AppHelpers.navigationToPage(context, const OrderDetailsScreen());
          },
          child: MyContainerShape(
            borderRadius: 12,
            paddingHorizontal: 12,
            bgContainer: AppColors.WHITE2,
            paddingVertical: 12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/klipartz.png', width: 80.w),
                SizedBox(width: 22.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: '120.00ر.س',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            title: 'الاثنين ، 16 فبراير',
                            fontSize: 10,
                            color: AppColors.GRAY,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              title: 'برجر الحراق المكسيكي',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MyText(title: 'X 2'),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      const Divider(height: 1),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          MyContainerShape(
                            height: 20.r,
                            width: 20.r,
                            borderRadius: 20,
                            bgContainer: AppColors.BASE_COLOR,
                            child: MyText(
                              title: 'D',
                              height: 0,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: MyText(
                              title: 'فهد بن طلال',
                              fontSize: 10,
                              color: AppColors.GRAY3,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          MyText(
                            title: '3156416#',
                            fontSize: 10,
                            color: AppColors.GRAY3,
                            fontWeight: FontWeight.w300,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
