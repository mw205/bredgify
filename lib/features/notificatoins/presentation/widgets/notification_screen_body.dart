import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/features/notificatoins/data/models/notification_model.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({
    super.key,
    required this.notifications,
  });

  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) {
        return Gap(24.h);
      },
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemBuilder: (context, index) {
        NotificationModel notificationModel = notifications[index];
        return ListTile(
          leading: Container(
            height: 48.r,
            width: 48.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.darkBlue,
            ),
            child: Center(
              child: Assets.images.celebrateIcon.svg(),
            ),
          ),
          title: Text(
            notificationModel.description,
            style: AppTextStyles.kBlack15FontW600,
          ),
          trailing: Text(
            "${notificationModel.receiveTime}m",
            style: AppTextStyles.kDarkBlue13FontW700,
          ),
        );
      },
    );
  }
}
