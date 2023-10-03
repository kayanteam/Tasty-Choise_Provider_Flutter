import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';

class ItemNotification extends StatelessWidget {
  // final NotificationModel notification;
  const ItemNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyContainerShape(
          paddingHorizontal: 12,
          paddingVertical: 14,
          borderRadius: 10,
          bgContainer: AppColors.WHITE2,
          child: Column(
            children: [
              Row(
                children: [
                  MyContainerShape(
                    height: 44.r,
                    width: 44.r,
                    borderRadius: 10,
                    bgContainer: AppColors.GREEN.withOpacity(.2),
                    child: SvgPicture.asset(
                      'assets/images/order_done.svg',
                      width: 20.r,
                      height: 20.r,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: "طلب مكتمل",
                        color: AppColors.GRAY3,
                      ),
                      MyText(
                        title: "اليوم 19:10",
                        fontSize: 10,
                        color: AppColors.ICON_COLOR,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 12.h),
              MyText(
                title:
                    "تهانينا ، تم تسليم الطلب بنجاح من مطعم البجار للماكولات البحرية ",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: AppColors.GRAY3,
              )
            ],
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
