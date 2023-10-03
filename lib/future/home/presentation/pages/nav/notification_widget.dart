import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_choise_provider/future/home/presentation/widget/item_notification.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.only(
          top: 10.h,
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).padding.bottom + 20.h,
        ),
        itemBuilder: (context, index) {
          return const ItemNotification();
        },
      ),
    );
  }
}
