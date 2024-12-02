import 'package:bridgefy/core/widgets/custom_button.dart';
import 'package:bridgefy/core/widgets/custom_textfield.dart';
import 'package:bridgefy/features/home/presentation/screens/home_screen.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: Column(
        children: [
          Gap(65.h),
          Assets.images.banner.image(),
          Gap(41.h),
          CustomTextFormField(
            hintText: "Email",
            prefixIcon: Assets.images.emailIcon.svg(),
            label: "Email",
          ),
          Gap(167.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomButton(
              onTap: () {
                context.push(HomeScreen.id);
              },
              title: "Continue",
            ),
          ),
        ],
      ),
    );
  }
}
