import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_pin_put.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/auth/presentation/pages/reset_password_screen.dart';

class VerificationAccountScreen extends StatefulWidget {
  const VerificationAccountScreen({super.key});

  @override
  State<VerificationAccountScreen> createState() =>
      _VerificationAccountScreenState();
}

class _VerificationAccountScreenState extends State<VerificationAccountScreen> {
  late final StopWatchTimer _stopWatchTimer;
  @override
  void initState() {
    _stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countDown);
    _stopWatchTimer.setPresetMinuteTime(1);
    _stopWatchTimer.setPresetSecondTime(12);

    _stopWatchTimer.onStartTimer();

    super.initState();
  }

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

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
              title: 'تم ارسال كود مكون من 4 ارقام الى  البريد الالكتروني',
              fontSize: 14,
              textAlign: TextAlign.center,
              color: AppColors.GRAY,
            ),
          ),
          Align(
            child: MyText(
              title: 'mhammedkhaled96@gmail.com',
              fontSize: 14,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w300,
              color: AppColors.BLACK,
            ),
          ),
          SizedBox(height: 32.h),
          MyPinput(),
          SizedBox(height: 43.h),
          MyElevatedButton(
            title: 'تاكيد الكود',
            fontSize: 16,
            borderRaduis: 30,
            fontWeight: FontWeight.bold,
            onPressed: () {
              AppHelpers.navigationToPage(context, ResetPasswordScreen());
            },
          ),
          SizedBox(height: 20.h),
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: 0,
            builder: (context, snap) {
              final value = snap.data;
              final displayTime = value == null
                  ? ''
                  : StopWatchTimer.getDisplayTime(
                      value,
                      milliSecond: false,
                      hours: false,
                    );
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title: 'الكود ينتهي خلال : ',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.TEXT_LIGHT,
                  ),
                  MyText(
                    title: displayTime,
                    color: AppColors.RED,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
