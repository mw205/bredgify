import 'package:bridgefy/core/widgets/categories_item.dart';
import 'package:bridgefy/features/layout/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.categories,
  });

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          CategoriesModel category = categories[index];
          return CategoriesItem(category: category);
        },
        separatorBuilder: (context, index) => Gap(30.w),
        itemCount: categories.length,
      ),
    );
  }
}
