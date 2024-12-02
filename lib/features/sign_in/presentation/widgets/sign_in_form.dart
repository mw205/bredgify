import 'package:bridgefy/core/widgets/custom_textfield.dart';
import 'package:bridgefy/features/forget_password/persentation/screen/forget_password_screen.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:bridgefy/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
                  onPressed: () {
                    context.push(ForgetPasswordScreen.id);
                  },
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
