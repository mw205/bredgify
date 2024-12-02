import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_button.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/sign_in_form.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/social_authentication_bar.dart';
import 'package:bridgefy/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:bridgefy/features/verfication/presentation/screens/verfication_screen.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:text_divider/text_divider.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(65.h),
          Assets.images.banner.image(),
          Gap(41.h),
          const SignInForm(),
          Gap(41.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomButton(
              onTap: () {
                context.push(VerficationScreen.id);
              },
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
          GestureDetector(
            onTap: () {
              context.push(SignUpScreen.id);
            },
            child: RichText(
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
            ),
          ),
          Gap(50.h)
        ],
      ),
    );
  }
}
