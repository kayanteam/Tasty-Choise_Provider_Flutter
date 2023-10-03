import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:tasty_choise_provider/core/components/custom_dropdown_menu.dart';
import 'package:tasty_choise_provider/core/components/my_app_bar.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/components/my_text_field.dart';
import 'package:tasty_choise_provider/core/components/pick_media_product_widget.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/home_cubit/home_cubit.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'اضافة منتج'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(height: 10.h),
          MyContainerShape(
            borderRadius: 12,
            paddingHorizontal: 17,
            paddingVertical: 12,
            bgContainer: AppColors.WHITE2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: 'صور المنتج',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 12.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return PickMediaWidget(
                      pickSingle: false,
                      media: HomeCubit.get(context).media,
                      onTapDelete: (int index) {
                        HomeCubit.get(context).deleteMedia(index);
                      },
                      onTapPickMedia: () {
                        HomeCubit.get(context).pickMedia();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          MyContainerShape(
            bgContainer: AppColors.WHITE2,
            borderRadius: 12,
            paddingHorizontal: 12,
            paddingVertical: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(title: 'معلومات المنتج'),
                SizedBox(height: 16.h),
                MyTextField(
                  textHint: '',
                  labelText: 'اسم المنتج',
                  fillColor2: AppColors.WHITE,
                  isBorder: true,
                  hintColor: AppColors.BLACK.withOpacity(.7),
                ),
                SizedBox(height: 10.h),
                CustomDropdownMenu(
                  listItems: ['تصنيف المنتج1', 'تصنيف المنتج2'],
                  onChanged: (String? s) {},
                  hint: 'تصنيف المنتج',
                  background: AppColors.WHITE,
                  paddingHorizontal: 10,
                  isExpanded: true,
                  alignment: AlignmentDirectional.centerStart,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: MyText(title: 'سعر الوحدة'),
                    ),
                    Expanded(
                      flex: 2,
                      child: MyTextField(
                        textHint: '',
                        fillColor2: AppColors.WHITE,
                        isBorder: true,
                        hintColor: AppColors.BLACK.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                MyTextField(
                  textHint: 'وصف المنتج',
                  labelText: '',
                  fillColor2: AppColors.WHITE,
                  isBorder: true,
                  maxLines: 8,
                  hintColor: AppColors.BLACK.withOpacity(.7),
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyElevatedButton(
              title: 'اضافة',
              onPressed: () {},
              borderRaduis: 30,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.h),
          ],
        ),
      ),
    );
  }
}
