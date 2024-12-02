import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/utils/app_utils.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/features/sign_up/presentation/widgets/sign_up_body.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String id = "/signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "Sign Up",
          style: AppTextStyles.kBlack20FontW600,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(AppScreenUtils.w, 10.sp),
          child: Divider(
            color: ColorName.lightGray,
            thickness: 1.h,
          ),
        ),
      ),
      body: const SignUpBody(),
    );
  }
}
