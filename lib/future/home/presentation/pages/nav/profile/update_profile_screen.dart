import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_choise_provider/core/components/custom_dropdown_menu.dart';
import 'package:tasty_choise_provider/core/components/my_app_bar.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/components/my_text_field.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/profile/profile_cubit.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const MyAppBar(
        backgroundColor: AppColors.TRANSPARENT,
        textColor: AppColors.WHITE,
        fontSize: 16,
        title: 'الملف الشخصي',
        fontWeight: FontWeight.w400,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 230.h,
            child: Stack(
              children: [
                PositionedDirectional(
                  start: 0,
                  end: 0,
                  child: SvgPicture.asset(
                    'assets/images/bg_update_profile.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                PositionedDirectional(
                  start: 0,
                  end: 0,
                  bottom: 0,
                  child: Align(
                    child: MyContainerShape(
                      width: 128.r,
                      paddingVertical: 2,
                      height: 128.r,
                      paddingHorizontal: 2,
                      enableShadow: true,
                      shadow: AppColors.BLACK.withOpacity(0.1),
                      borderRadius: 100,
                      alignment: AlignmentDirectional.centerStart,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_shape.svg',
                            width: 62.r,
                          ),
                          Center(
                            child: BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                String? image =
                                    ProfileCubit.get(context).pathImage;

                                return MyContainerShape(
                                  width: 118.r,
                                  height: 118.r,
                                  borderRadius: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      ProfileCubit.get(context).changeProfile();
                                    },
                                    child: image == null
                                        ? Icon(
                                            Icons.person,
                                            size: 50.r,
                                          )
                                        : Image.file(File(image)),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                MyText(title: 'اسم المطعم'),
                SizedBox(height: 10.h),
                MyTextField(
                  textHint: '',
                  isBorder: true,
                ),
                SizedBox(height: 12.h),
                MyText(title: 'اسم المسؤول'),
                SizedBox(height: 10.h),
                MyTextField(
                  textHint: '',
                  isBorder: true,
                ),
                SizedBox(height: 12.h),
                MyText(title: 'نوع المطعم'),
                SizedBox(height: 10.h),
                CustomDropdownMenu(
                  listItems: ['مطعم برجر', 'مطعم برجر2'],
                  onChanged: (String? s) {},
                  background: AppColors.WHITE4,
                  height: 60,
                  paddingHorizontal: 10,
                  isExpanded: true,
                  alignment: AlignmentDirectional.centerStart,
                ),
                SizedBox(height: 12.h),
                MyText(title: 'رقم الهاتف'),
                SizedBox(height: 10.h),
                MyTextField(
                  textHint: '',
                  isBorder: true,
                ),
                SizedBox(height: 12.h),
                MyText(title: 'البريد الالكتروني'),
                SizedBox(height: 10.h),
                MyTextField(
                  textHint: '',
                  isBorder: true,
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 100.h),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyElevatedButton(
              title: 'حفظ التعديل',
              borderRaduis: 50,
              onPressed: () {},
              background: AppColors.WHITE,
              titleColor: AppColors.BLACK.withOpacity(.7),
              borderColor: Color(0xffEEEEEE),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.h),
          ],
        ),
      ),
    );
  }
}
