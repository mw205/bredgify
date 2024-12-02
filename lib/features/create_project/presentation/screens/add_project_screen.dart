import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/utils/app_utils.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/core/widgets/custom_textfield.dart';
import 'package:bridgefy/features/layout/data/model/categories_model.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});
  static String id = "/addProject";

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
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
  ];

  late CategoriesModel chosenCategory;
  @override
  void initState() {
    super.initState();
    setState(() {
      chosenCategory = categories[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: Text(
          "Project’s Idea",
          style: AppTextStyles.kBlack20FontW600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Gap(40.h),
              const CustomTextFormField(
                hintText: "Enter your Project Name...",
                prefixIcon: SizedBox(),
                label: "Project Name*",
              ),
              Gap(24.h),
              SizedBox(
                width: AppScreenUtils.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category*",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: ColorName.gray,
                        ),
                      ),
                      width: AppScreenUtils.w,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<CategoriesModel>(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                          hint: Text(
                            "Health",
                            style: TextStyle(
                              color: ColorName.lightGray,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          alignment: Alignment.center,
                          items: categories.map((CategoriesModel value) {
                            return DropdownMenuItem<CategoriesModel>(
                              value: value,
                              child: Text(
                                value.title,
                                style: TextStyle(
                                  color: ColorName.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              chosenCategory = value!;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(18.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Project Overview*",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(10.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: ColorName.gray,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
