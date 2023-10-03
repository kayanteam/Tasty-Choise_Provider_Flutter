import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/components/my_text_field.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/auth/presentation/pages/forget_password_screen.dart';
import 'package:tasty_choise_provider/future/auth/presentation/pages/register_screen.dart';
import 'package:tasty_choise_provider/future/home/presentation/pages/main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                title: 'اهلا بعودتك 👋',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 64.h),
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
              labelText: 'كلمة المرور',
              fontSize: 14,
              hintColor: AppColors.GRAY,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8.w),
                  const Icon(Icons.lock),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: GestureDetector(
                onTap: () {
                  AppHelpers.navigationToPage(
                      context, const ForgetPasswordScreen());
                },
                child: MyText(
                  title: 'نسيت كلمة المرور؟',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50.h),
            MyElevatedButton(
              title: 'تسجيل الدخول',
              fontSize: 16,
              borderRaduis: 30,
              fontWeight: FontWeight.bold,
              onPressed: () {
                AppHelpers.navigationToPageAndExitAll(context, MainScreen());
              },
            ),
            SizedBox(height: 16.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'لا يوجد لدي حساب بالتطبيق ، ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.GRAY,
                  fontSize: 14.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'إنشاء حساب',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => AppHelpers.navigationToPage(
                          context, const RegisterScreen()),
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
