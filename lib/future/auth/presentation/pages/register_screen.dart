import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_choise_provider/core/components/custom_dropdown_menu.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/components/my_text_field.dart';
import 'package:tasty_choise_provider/core/components/terms_and_privacy_widget.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            SizedBox(height: 20.h),
            Image.asset(
              'assets/images/ic_logo.png',
              width: 130.w,
              height: 116.h,
            ),
            SizedBox(height: 16.h),
            Align(
              child: MyText(
                title: 'حساب جديد',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 64.h),
            MyTextField(
              textHint: '',
              hintColor: AppColors.GRAY,
              labelText: 'اسم المطعم',
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8.w),
                  SvgPicture.asset('assets/images/ic_checken.svg'),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomDropdownMenu(
              listItems: ['asdf', 'asdfs'],
              isExpanded: true,
              background: AppColors.WHITE4,
              alignment: AlignmentDirectional.centerStart,
              hint: 'نوع المطعم',
              borderRadius: 2,
              paddingHorizontal: 0,
              enabledBorder: false,
              iconDropdown: Icon(Icons.arrow_drop_down_outlined),
              onChanged: (String? s) {},
              iconLeading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8.w),
                  SvgPicture.asset('assets/images/ic_checken.svg'),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            MyTextField(
              textHint: '',
              hintColor: AppColors.GRAY,
              labelText: 'البريد الالكتروني',
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8.w),
                  const Icon(Icons.email),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            MyTextField(
              textHint: '',
              hintColor: AppColors.GRAY,
              labelText: 'اسم المسؤول',
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8.w),
                  const Icon(Icons.person),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const TermsAndPrivacyPolicyWidget(),
            SizedBox(height: 30.h),
            MyElevatedButton(
              title: 'انشاء حساب',
              fontSize: 16,
              borderRaduis: 30,
              fontWeight: FontWeight.bold,
              onPressed: () {},
            ),
            SizedBox(height: 16.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'لدي بالفعل حساب ، ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.GRAY,
                  fontSize: 14.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'تسجيل دخول',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => AppHelpers.navigationBack(context),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.BLACK,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
