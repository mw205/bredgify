import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/utils/app_utils.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/sign_in_body.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static String id = "/signin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Sign in",
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
      body: const SignInBody(),
    );
  }
}
