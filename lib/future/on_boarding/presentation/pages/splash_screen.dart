import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:tasty_choise_provider/core/storage/pref/shared_pref_controller.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasty_choise_provider/future/home/presentation/pages/main_screen.dart';
import 'package:tasty_choise_provider/future/on_boarding/presentation/pages/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getAppConfig().then(
      (value) {
        if (SharedPrefController().getToken != null) {
          AppHelpers.navigationReplacementToPage(context, const MainScreen());
        } else {
          AppHelpers.navigationReplacementToPage(
              context, const OnBoardingScreen());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/ic_logo.png',
          width: 260.r,
        ),
      ),
    );
  }
}
