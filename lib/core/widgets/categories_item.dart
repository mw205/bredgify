import 'package:bridgefy/features/categories/presentation/screens/projects_screen.dart';
import 'package:bridgefy/features/layout/data/model/categories_model.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key,
      required this.category,
      this.iconSize = 60,
      this.fontsize = 14});

  final CategoriesModel category;
  final double iconSize;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ProjectsScreen.id, extra: category.title);
      },
      child: Column(
        children: [
          Container(
            width: iconSize.w,
            height: iconSize.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.lavender,
            ),
            child: Center(
              child: category.image,
            ),
          ),
          Gap(18.h),
          Text(
            category.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontsize.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
