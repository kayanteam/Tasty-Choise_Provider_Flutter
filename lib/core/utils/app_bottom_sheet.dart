import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/components/my_text_field.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/profile/profile_cubit.dart';

class AppBottomSheet {
  static showAddBalanceWithBank(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController ibanController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.WHITE,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(34.r),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              MyContainerShape(
                width: 60.w,
                height: 3.h,
                bgContainer: AppColors.GRAY,
              ),
              SizedBox(height: 20.h),
              MyText(title: 'سحب رصيد', fontWeight: FontWeight.bold),
              SizedBox(height: 20.h),
              const Divider(),
              SizedBox(height: 20.h),
              MyTextField(
                controller: usernameController,
                labelText: 'اسم صاحب الحساب',
                textHint: '',
                fillColor2: AppColors.GRAY2.withOpacity(.05),
                filledColor: true,
                isBorder: true,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 12.h),
              MyTextField(
                controller: ibanController,
                labelText: 'رقم الايبان',
                textHint: '',
                fillColor2: AppColors.GRAY2.withOpacity(.05),
                filledColor: true,
                isBorder: true,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 12.h),
              MyTextField(
                controller: numberController,
                labelText: 'رقم الحساب',
                textHint: '',
                fillColor2: AppColors.GRAY2.withOpacity(.05),
                filledColor: true,
                isBorder: true,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 12.h),
              MyTextField(
                controller: amountController,
                labelText: 'قيمة المبلغ',
                textHint: '',
                fillColor2: AppColors.GRAY2.withOpacity(.05),
                filledColor: true,
                isBorder: true,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 50.h),
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is RequestMoneyFailed) {
                    AppHelpers.navigationBack(context);
                    AppHelpers.showSnackBar(context,
                        message: state.message, error: true);
                  }
                  if (state is RequestMoneySuccess) {
                    AppHelpers.navigationBack(context);

                    AppHelpers.showSnackBar(
                      context,
                      message: state.message,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RequestMoneyLoading) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  return MyElevatedButton(
                    borderRaduis: 50,
                    title: 'تأكيد',
                    onPressed: () {
                      ProfileCubit.get(context).requestMoney(
                        name: usernameController.text.trim(),
                        ibanNumber: ibanController.text.trim(),
                        accountNumber: numberController.text.trim(),
                        amount: amountController.text.trim(),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
            ],
          ),
        );
      },
    );
  }
}
