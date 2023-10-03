import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/order_cubit/order_cubit.dart';
import 'package:tasty_choise_provider/future/home/presentation/widget/item_product.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                int index = OrderCubit.get(context).indexTap;
                return MyContainerShape(
                  height: 65.h,
                  paddingHorizontal: 9,
                  paddingVertical: 9,
                  bgContainer: AppColors.WHITE2,
                  borderRadius: 50,
                  child: Row(
                    children: [
                      ItemTabBar(
                        title: 'حالية',
                        isSelected: index == 0,
                        onTap: () {
                          OrderCubit.get(context).changeIndex(0);
                        },
                      ),
                      ItemTabBar(
                        title: 'قيد التنفيذ',
                        isSelected: index == 1,
                        onTap: () {
                          OrderCubit.get(context).changeIndex(1);
                        },
                      ),
                      ItemTabBar(
                        title: 'منتهية',
                        isSelected: index == 2,
                        onTap: () {
                          OrderCubit.get(context).changeIndex(2);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ItemProduct();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTabBar extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;
  const ItemTabBar(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: MyContainerShape(
          borderRadius: 40,
          bgContainer:
              isSelected ? AppColors.BASE_COLOR : AppColors.TRANSPARENT,
          child: MyText(
            title: title,
            color: isSelected ? AppColors.WHITE : AppColors.BLACK,
          ),
        ),
      ),
    );
  }
}
