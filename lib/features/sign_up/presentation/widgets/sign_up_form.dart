import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_textfield.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: "Name",
              prefixIcon: Assets.images.person.svg(),
              label: "Name",
            ),
            Gap(18.h),
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
            CustomTextFormField(
              obscureText: true,
              hintText: "Confirm Password",
              prefixIcon: Assets.images.lockIcon.svg(),
              label: "Confirm Password",
            ),
            Gap(18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    activeColor: ColorName.darkBlue,
                    value: termsAccepted,
                    onChanged: (value) {
                      setState(() {
                        termsAccepted = value ?? false;
                      });
                    }),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I agree",
                        style: AppTextStyles.kBlack13FontW400,
                      ),
                      TextSpan(
                        text: " Terms & Conditions",
                        style: AppTextStyles.kDarkBlue13FontW700,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
