import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:tasty_choise_provider/core/components/my_app_bar.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/order_cubit/order_cubit.dart';
import 'package:tasty_choise_provider/future/home/presentation/widget/item_product.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'تفاصيل الطلب'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 20.h),
          const ItemProduct(),
          SizedBox(height: 16.h),
          const Divider(height: 1),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: 'حالة الطلب'),
              MyContainerShape(
                width: 100.w,
                paddingVertical: 6,
                borderRadius: 40,
                bgContainer: AppColors.RED.withOpacity(.1),
                child: MyText(
                  title: 'الحالية',
                  color: AppColors.RED,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(height: 1),
          SizedBox(height: 16.h),
          MyText(title: 'ملاحظات'),
          SizedBox(height: 16.h),
          MyContainerShape(
            bgContainer: AppColors.WHITE2,
            borderRadius: 12,
            paddingHorizontal: 12,
            paddingVertical: 12,
            child: MyText(
              title:
                  'نرجو من سيادتكم الالتزام في وقت وتاريخ تسليم الخدمة باسرع وقت ممكن ، دمتم بود.',
              color: AppColors.GRAY3,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (OrderCubit.get(context).indexTap == 0) ...[
              MyElevatedButton(
                title: 'قبول الطلب',
                onPressed: () {},
                iconPath: 'assets/images/ic_accept_order.svg',
                borderRaduis: 30,
                iconColor: AppColors.WHITE,
              ),
              SizedBox(height: 15.h),
              MyElevatedButton(
                title: 'رفض الطلب',
                onPressed: () {},
                borderRaduis: 30,
                iconPath: 'assets/images/ic_delete_order.svg',
                iconColor: AppColors.BASE_COLOR,
                background: AppColors.TRANSPARENT,
                titleColor: AppColors.BASE_COLOR,
                borderColor: AppColors.BASE_COLOR,
              ),
            ],
            if (OrderCubit.get(context).indexTap == 1) ...[
              MyElevatedButton(
                title: 'تاكيد التسليم',
                onPressed: () {},
                background: AppColors.WHITE5,
                iconPath: 'assets/images/ic_order_complete.svg',
                borderRaduis: 30,
                titleColor: AppColors.BLACK,
                iconColor: AppColors.BLACK,
              ),
            ],
            SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h),
          ],
        ),
      ),
    );
  }
}
