import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocailAuthbutton extends StatelessWidget {
  const SocailAuthbutton({super.key, required this.image, required this.onTap});
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 35.w),
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.silver),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }
}
