import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key, this.iconColor = Colors.black, this.onPressed});
  final Color iconColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            if (context.canPop()) {
              context.pop();
            }
          },
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: iconColor,
        size: 24.sp,
      ),
    );
  }
}
