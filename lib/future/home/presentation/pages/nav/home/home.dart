import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_choise_provider/core/components/my_contianer_shape.dart';
import 'package:tasty_choise_provider/core/components/my_elevated_button.dart';
import 'package:tasty_choise_provider/core/components/my_page_view.dart';
import 'package:tasty_choise_provider/core/components/my_text.dart';
import 'package:tasty_choise_provider/core/storage/pref/shared_pref_controller.dart';
import 'package:tasty_choise_provider/core/utils/app_colors.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/core/utils/app_loader.dart';
import 'package:tasty_choise_provider/future/home/models/product.dart';
import 'package:tasty_choise_provider/future/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasty_choise_provider/future/home/presentation/pages/nav/home/add_product_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is DeleteProductLoadingData) {
            AppLoaderDialog.show(context);
          }
          if (state is DeleteProductSuccessData) {
            AppLoaderDialog.hide(context);
            AppHelpers.showSnackBar(context, message: state.message);
          }
          if (state is DeleteProductFailureData) {
            AppLoaderDialog.hide(context);
            AppHelpers.showSnackBar(context,
                message: state.message, error: true);
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is HomeFailureData) {
            return const Center(
              child: Icon(
                Icons.error,
                color: AppColors.RED,
              ),
            );
          }
          List<Product> prodtucts =
              HomeCubit.get(context).homeData!.prodtucts ?? [];
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              SizedBox(height: 24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyContainerShape(
                    height: 58.r,
                    width: 58.r,
                    borderRadius: 50,
                    bgContainer: AppColors.BASE_COLOR,
                    child: SharedPrefController().getDataUser().image == null
                        ? const Icon(
                            Icons.person,
                            size: 30,
                          )
                        : Image.network(
                            SharedPrefController().getDataUser().image!,
                            height: 58.r,
                            width: 58.r,
                          ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        MyText(title: 'حياك الله،👋'),
                        SizedBox(height: 2.h),
                        MyText(
                            title:
                                SharedPrefController().getDataUser().name ?? "",
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              MyPageView(
                images: HomeCubit.get(context)
                    .homeData!
                    .ads!
                    .map((e) => e.image ?? "")
                    .toList(),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: 'منتجاتي',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                  MyElevatedButton(
                    title: 'اضافة منتج',
                    titleColor: AppColors.BLACK,
                    background: AppColors.TRANSPARENT,
                    borderColor: AppColors.BLACK,
                    borderRaduis: 50,
                    width: 100,
                    height: 40,
                    onPressed: () {
                      AppHelpers.navigationToPage(context, AddProductScreen());
                    },
                  )
                ],
              ),
              SizedBox(height: 24.h),
              prodtucts.length == 0
                  ? Align(child: MyText(title: 'لا توجد منتجات حتى الان'))
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: prodtucts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 166 / 230,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 10.w,
                      ),
                      itemBuilder: (context, index) {
                        return MyContainerShape(
                          bgContainer: AppColors.WHITE2,
                          borderRadius: 12,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.r,
                                  vertical: 12.r,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Image.network(
                                      prodtucts[index].image!,
                                      height: 110.r,
                                      width: 110.r,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return MyContainerShape(
                                          height: 110.r,
                                          width: 110.r,
                                          child: Icon(Icons.error),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 5.h),
                                    MyText(
                                      title: prodtucts[index].name ?? "",
                                      fontSize: 12,
                                    ),
                                    MyText(
                                      title:
                                          '${prodtucts[index].price ?? ""} ر.س',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: MyElevatedButton(
                                            title: 'تعديل',
                                            onPressed: () {
                                              AppHelpers.navigationToPage(
                                                  context,
                                                  AddProductScreen(
                                                      product:
                                                          prodtucts[index]));
                                            },
                                            fontSize: 10,
                                            height: 35,
                                            titleColor: AppColors.BLUE,
                                            background:
                                                AppColors.BLUE.withOpacity(.1),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        GestureDetector(
                                          onTap: () {
                                            HomeCubit.get(context)
                                                .deleteProduct(
                                                    id: prodtucts[index].id!);
                                          },
                                          child: MyContainerShape(
                                            bgContainer:
                                                AppColors.RED.withOpacity(.1),
                                            height: 35.r,
                                            width: 35.r,
                                            borderRadius: 8,
                                            child: SvgPicture.asset(
                                                'assets/images/ic_delete.svg'),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
