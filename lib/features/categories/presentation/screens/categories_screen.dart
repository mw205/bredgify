import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/categories_item.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/features/layout/data/model/categories_model.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static String id = "/categories";
  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> categories = [
      CategoriesModel(
        image: Assets.images.agriculture.svg(),
        title: "Agriculture",
      ),
      CategoriesModel(
        image: Assets.images.industry.svg(),
        title: "Industry",
      ),
      CategoriesModel(
        image: Assets.images.health.svg(),
        title: "Health",
      ),
      CategoriesModel(
        image: Assets.images.education.svg(),
        title: "Education",
      ),
      CategoriesModel(
        image: Assets.images.technolog.svg(),
        title: "Technology",
      ),
      CategoriesModel(
        image: Assets.images.energy.svg(),
        title: "Energy",
      ),
      CategoriesModel(
        image: Assets.images.water.svg(),
        title: "Water",
      ),
      CategoriesModel(
        image: Assets.images.environment.svg(),
        title: "Environment",
      ),
      CategoriesModel(
        image: Assets.images.community.svg(),
        title: "Community",
      ),
      CategoriesModel(
        image: Assets.images.economy.svg(),
        title: "Economy",
      ),
      CategoriesModel(
        image: Assets.images.ecommerce.svg(),
        title: "E-Commerce",
      ),
      CategoriesModel(
        image: Assets.images.tourism.svg(),
        title: "Tourism",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "Categories",
          style: AppTextStyles.kBlack20FontW600,
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.5,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          CategoriesModel categoriesModel = categories[index];
          return CategoriesItem(
            category: categoriesModel,
            iconSize: 55,
            fontsize: 15,
          );
        },
      ),
    );
  }
}
