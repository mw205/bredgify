import 'package:bridgefy/core/widgets/custom_button.dart';
import 'package:bridgefy/core/widgets/custom_textfield.dart';
import 'package:bridgefy/features/home/presentation/screens/home_screen.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Gap(41.h),
          Assets.images.banner.image(),
          Gap(41.h),
          CustomTextFormField(
            obscureText: true,
            hintText: "New Password",
            prefixIcon: Assets.images.lockIcon.svg(),
            label: "Password",
          ),
          Gap(18.h),
          CustomTextFormField(
            obscureText: true,
            hintText: "Confirm Password",
            prefixIcon: Assets.images.lockIcon.svg(),
            label: "Password",
          ),
          Gap(68.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomButton(
              onTap: () {
                context.push(HomeScreen.id);
              },
              title: "Sign in",
            ),
          ),
        ],
      ),
    );
  }
}
