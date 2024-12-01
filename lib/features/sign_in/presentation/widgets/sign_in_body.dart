import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_button.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/sign_in_form.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/social_authentication_bar.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:text_divider/text_divider.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(65.h),
          const SignInForm(),
          Gap(41.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomButton(
              onTap: () {},
              title: "Sign in",
            ),
          ),
          Gap(24.h),
          TextDivider(
            color: ColorName.silver,
            text: Text(
              "OR",
              style: AppTextStyles.kSilver14FontW400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              bottom: 14.h,
            ),
            child: const SocialAuthenticationBar(),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyles.kDarkGray12FontW500),
                TextSpan(
                  text: "Sign up",
                  style: AppTextStyles.kDarkBlue12FontW700Underlined,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
