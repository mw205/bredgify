import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/features/notificatoins/data/models/notification_model.dart';
import 'package:bridgefy/features/notificatoins/presentation/widgets/notification_screen_body.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationsScreen extends StatelessWidget {
  static String id = "/notifications";
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> notifications = [
      NotificationModel(
          description:
              "Your idea 'Green Tech Solutions' has been rated 4.5 stars",
          receiveTime: "5")
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: Text(
          "Notifications",
          style: AppTextStyles.kBlack20FontW600,
        ),
      ),
      body: notificationsBuilder(notifications),
    );
  }
}

Widget notificationsBuilder(List<NotificationModel> notifications) {
  if (notifications.isEmpty) {
    return NotificationScreenBody(
      notifications: notifications,
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.notificationNotFound.svg(),
        Gap(10.h),
        Text(
          "No notifications yet",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(10.h),
        Text(
          "Your notification will appear here once you've received them.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xff4D4D4D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
