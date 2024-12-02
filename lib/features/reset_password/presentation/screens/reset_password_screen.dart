import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/utils/app_utils.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/features/reset_password/presentation/widgets/reset_password_form.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static String id = "/reset_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "Reset Password",
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
      body: const ResetPasswordForm(),
    );
  }
}
