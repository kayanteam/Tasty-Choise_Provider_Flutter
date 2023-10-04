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
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/auth/models/user_model.dart';
import 'package:tasty_choise_provider/future/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:tasty_choise_provider/future/home/models/categories.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/home_cubit/home_cubit.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  int categoryId = -1;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _adminController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    List<Categories>? categories =
        HomeCubit.get(context).appConfig!.categories!;
    categoryId = categories.length > 0 ? categories[0].id! : -1;

    print(AuthCubit.get(context).user!.toJson());
    AuthCubit.get(context).pathImage = AuthCubit.get(context).user!.image ?? "";
    _nameController.text = AuthCubit.get(context).user!.name ?? "";
    _emailController.text = AuthCubit.get(context).user!.email ?? "";
    _phoneController.text = AuthCubit.get(context).user!.phone ?? "";
    _adminController.text = AuthCubit.get(context).user!.mangerName ?? "";
    super.initState();
  }

  @override
  void deactivate() {
    AuthCubit.get(context).pickedImage = false;
    super.deactivate();
  }

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
                            child: BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                String? image =
                                    AuthCubit.get(context).pathImage;

                                return MyContainerShape(
                                  width: 118.r,
                                  height: 118.r,
                                  borderRadius: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      AuthCubit.get(context).changeProfile();
                                    },
                                    child: AuthCubit.get(context).pickedImage
                                        ? Image.file(File(image!))
                                        : image == null
                                            ? Icon(
                                                Icons.person,
                                                size: 50.r,
                                              )
                                            : Image.network(image),
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
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  MyText(title: 'اسم المطعم'),
                  SizedBox(height: 10.h),
                  MyTextField(
                    controller: _nameController,
                    textHint: '',
                    isBorder: true,
                    validator: (p0) => AppHelpers.checkFillData(p0, context),
                  ),
                  SizedBox(height: 12.h),
                  MyText(title: 'اسم المسؤول'),
                  SizedBox(height: 10.h),
                  MyTextField(
                    controller: _adminController,
                    textHint: '',
                    isBorder: true,
                    validator: (p0) => AppHelpers.checkFillData(p0, context),
                  ),
                  SizedBox(height: 12.h),
                  MyText(title: 'نوع المطعم'),
                  SizedBox(height: 10.h),
                  CustomDropdownMenu(
                    background: AppColors.WHITE4,
                    height: 60,
                    paddingHorizontal: 10,
                    isExpanded: true,
                    alignment: AlignmentDirectional.centerStart,
                    listItems: HomeCubit.get(context)
                        .appConfig!
                        .categories!
                        .map((e) => e.name!)
                        .toList(),
                    onChanged: (String? s) {
                      int index = HomeCubit.get(context)
                          .appConfig!
                          .categories!
                          .indexWhere((element) => element.name == s);
                      categoryId = HomeCubit.get(context)
                          .appConfig!
                          .categories![index]
                          .id!;
                    },
                  ),
                  SizedBox(height: 12.h),
                  MyText(title: 'رقم الهاتف'),
                  SizedBox(height: 10.h),
                  MyTextField(
                    controller: _phoneController,
                    textHint: '',
                    isBorder: true,
                    validator: (p0) => AppHelpers.checkFillData(p0, context),
                  ),
                  SizedBox(height: 12.h),
                  MyText(title: 'البريد الالكتروني'),
                  SizedBox(height: 10.h),
                  MyTextField(
                    controller: _emailController,
                    textHint: '',
                    isBorder: true,
                    validator: (p0) => AppHelpers.checkFillData(p0, context),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthUpdateProfileFailuer) {
                  AppHelpers.showSnackBar(context,
                      message: state.message, error: true);
                }
                if (state is AuthUpdateProfileSuccess) {
                  AppHelpers.showSnackBar(
                    context,
                    message: state.message,
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthUpdateProfileLoading) {
                  return const CircularProgressIndicator.adaptive();
                }
                return MyElevatedButton(
                  title: 'حفظ التعديل',
                  borderRaduis: 50,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthCubit.get(context).updateProfileData(
                          UserModel(
                            phone: _phoneController.text.trim(),
                            email: _emailController.text.trim(),
                            name: _nameController.text.trim(),
                            mangerName: _adminController.text.trim(),
                            image: AuthCubit.get(context).pickedImage
                                ? AuthCubit.get(context).pathImage
                                : null,
                          ),
                          categoryId);
                    }
                  },
                  background: AppColors.WHITE,
                  titleColor: AppColors.BLACK.withOpacity(.7),
                  borderColor: Color(0xffEEEEEE),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.h),
          ],
        ),
      ),
    );
  }
}
