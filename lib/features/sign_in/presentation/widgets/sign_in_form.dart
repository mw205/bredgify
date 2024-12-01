import 'package:bridgefy/core/widgets/custom_textfield.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:bridgefy/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: "Email",
              prefixIcon: Assets.images.emailIcon.svg(),
              label: "Email",
            ),
            Gap(18.h),
            CustomTextFormField(
              obscureText: true,
              hintText: "Password",
              prefixIcon: Assets.images.lockIcon.svg(),
              label: "Password",
            ),
            Gap(18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: ColorName.darkGray,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.poppins,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
