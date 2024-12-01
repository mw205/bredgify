import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.title,
    this.color = ColorName.darkBlue,
    this.width,
    this.height,
    this.image,
    this.filled = true,
    this.isCircle = false,
    this.boarderRadius,
    this.child,
    this.radius,
    this.titleTextStyle,
  });
  final void Function()? onTap;
  final String? title;
  final Color color;
  final String? image;
  final double? width;
  final double? height;
  final double? radius;
  final double? boarderRadius;
  final bool filled;
  final bool isCircle;
  final Widget? child;
  final TextStyle? titleTextStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: filled ? color : ColorName.darkBlue,
          borderRadius: BorderRadius.circular(boarderRadius ?? 8.r),
          border: filled ? null : Border.all(color: ColorName.black),
          image: image == null
              ? null
              : DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.cover,
                ),
        ),
        height: radius ?? height,
        width: radius ?? width,
        child: child ??
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.w),
              child: Text(
                title ?? "",
                style: titleTextStyle ??
                    (filled
                        ? AppTextStyles.kWhite15FontW700
                        : AppTextStyles.kBlack15FontW700),
              ),
            ),
      ),
    );
  }
}
