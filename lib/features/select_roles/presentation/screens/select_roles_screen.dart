import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_button.dart';
import 'package:bridgefy/features/select_roles/data/model/user_model.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SelectRolesScreen extends StatefulWidget {
  const SelectRolesScreen({super.key});
  static String id = "/select_roles";
  @override
  State<SelectRolesScreen> createState() => _SelectRolesScreenState();
}

class _SelectRolesScreenState extends State<SelectRolesScreen> {
  RoleName roleName = RoleName.innovator;
  void changeRole(RoleName role) {
    setState(() {
      roleName = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(80.h),
          Text(
            "Select your Role",
            style: AppTextStyles.kBlack20FontW600,
          ),
          Text(
            "Select your role which suits your need",
            style: AppTextStyles.kDarkGrey14FontW300,
          ),
          Gap(40.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24.w, end: 21.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Your Role :",
                  style: AppTextStyles.kBlack16FontW500,
                ),
                Gap(12.h),
                GestureDetector(
                  onTap: () {
                    changeRole(RoleName.innovator);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorName.gray,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          activeColor: ColorName.darkBlue,
                          value: RoleName.innovator,
                          groupValue: roleName,
                          onChanged: (value) {
                            changeRole(RoleName.innovator);
                          },
                        ),
                        Text(
                          "Innovator",
                          style: AppTextStyles.kBlack16FontW500,
                        )
                      ],
                    ),
                  ),
                ),
                Gap(14.h),
                GestureDetector(
                  onTap: () {
                    changeRole(
                      RoleName.investor,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorName.gray,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          activeColor: ColorName.darkBlue,
                          value: RoleName.investor,
                          groupValue: roleName,
                          onChanged: (value) {
                            changeRole(
                              RoleName.investor,
                            );
                          },
                        ),
                        Text(
                          "Investor",
                          style: AppTextStyles.kBlack16FontW500,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(200.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomButton(
                    onTap: () {},
                    title: "Continue",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
