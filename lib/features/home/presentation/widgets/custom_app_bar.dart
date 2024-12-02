import 'package:bridgefy/features/notificatoins/presentation/screens/notifications_screen.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      decoration: BoxDecoration(
        color: ColorName.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
        ),
        image: DecorationImage(
            image: Assets.images.homeBanner.provider(),
            fit: BoxFit.cover,
            opacity: 0.2),
      ),
      child: Column(
        children: [
          Gap(55.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Yara ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Let’s start Success Journey!",
                      style: TextStyle(
                        color: ColorName.veryLightBlue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.push(NotificationsScreen.id);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Assets.images.notificationIcon.svg(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Gap(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 251.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 15.h,
                    ),
                    hintText: "Search",
                    prefixIcon: Transform.scale(
                        scale: 0.5,
                        child: Assets.images.searchIcon.svg(height: 20.h)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Gap(24.w),
              Container(
                padding: EdgeInsets.all(18.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Assets.images.filterIcon.svg(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
