import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/components/my_text_field.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/auth/presentation/pages/verification_account_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.WHITE,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SvgPicture.asset(
            'assets/images/ic_forget_pass.svg',
            width: 200.r,
            height: 200.r,
          ),
          SizedBox(height: 16.h),
          Align(
            child: MyText(
              title: 'إعادة تعيين كلمة المرور',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: MyText(
                title:
                    'أدخل كلمة المرور الجديدة حاول أن تكون غير معقدة لتستطيع التسجيل بعدها بسهولة ..',
                fontSize: 14,
                textAlign: TextAlign.center,
                color: AppColors.GRAY,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          MyTextField(
            textHint: '',
            labelText: 'كلمة المرور',
            fontSize: 14,
            hintColor: AppColors.GRAY,
            obscureText: true,
            maxLines: 1,
            obscureEnabled: true,
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
          MyTextField(
            textHint: '',
            labelText: 'تأكيد كلمة المرور',
            fontSize: 14,
            hintColor: AppColors.GRAY,
            maxLines: 1,
            obscureText: true,
            obscureEnabled: true,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 8.w),
                const Icon(Icons.lock),
                SizedBox(width: 8.w),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          MyElevatedButton(
            title: 'ارسال',
            fontSize: 16,
            borderRaduis: 30,
            fontWeight: FontWeight.bold,
            onPressed: () {
              AppHelpers.navigationToPage(context, VerificationAccountScreen());
            },
          ),
        ],
      ),
    );
  }
}
