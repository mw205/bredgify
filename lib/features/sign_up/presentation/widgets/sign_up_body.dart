import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_button.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/social_authentication_bar.dart';
import 'package:bridgefy/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:text_divider/text_divider.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SignUpForm(),
          Gap(41.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomButton(
              onTap: () {},
              title: "Sign up",
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
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Already have an account? ",
                      style: AppTextStyles.kDarkGray12FontW500),
                  TextSpan(
                    text: "Sign In",
                    style: AppTextStyles.kDarkBlue12FontW700Underlined,
                  )
                ],
              ),
            ),
          ),
          Gap(50.h)
        ],
      ),
    );
  }
}
