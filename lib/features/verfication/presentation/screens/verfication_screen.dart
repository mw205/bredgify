import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/utils/app_utils.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/core/widgets/custom_button.dart';
import 'package:bridgefy/features/home/presentation/screens/home_screen.dart';
import 'package:bridgefy/features/verfication/presentation/widgets/otp_form.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({super.key});
  static String id = "/verification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "Verification",
          style: AppTextStyles.kBlack20FontW600,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(AppScreenUtils.w, 10.h),
          child: Divider(
            color: ColorName.lightGray,
            thickness: 1.h,
          ),
        ),
      ),
      body: Column(
        children: [
          Gap(65.h),
          Assets.images.banner.image(),
          Gap(41.h),
          OtpForm(
            onGenerateFields: (controllers, focusNodes) {},
          ),
          Gap(165.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomButton(
              onTap: () {
                context.push(HomeScreen.id);
              },
              title: "Continue",
            ),
          ),
          Gap(20.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Didn’t receive the code? ",
                  style: AppTextStyles.kBlack13FontW400,
                ),
                TextSpan(
                  text: "Resend",
                  style: AppTextStyles.kDarkBlue13FontW700,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
