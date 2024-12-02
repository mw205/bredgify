import 'package:bridgefy/core/model/socail_auth_model.dart';
import 'package:bridgefy/core/utils/string_helpers.dart';
import 'package:bridgefy/features/layout/data/model/consultant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gap/gap.dart';

class ConsultantItem extends StatelessWidget {
  const ConsultantItem({
    super.key,
    required this.consultant,
  });

  final ConsultantModel consultant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            consultant.image,
            height: 70.h,
            width: 70.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Text(
                consultant.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(8.h),
              Text(
                StringHelpers.addLineBreakAfterEachWord(consultant.job),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
              Gap(15.h),
              Row(
                children: List.generate(
                  consultant.socailMedia.length,
                  (index) {
                    SocailWaysModel socailWaysModel =
                        consultant.socailMedia[index];
                    return GestureDetector(
                      onTap: () {
                        socailWaysModel.onTap!();
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Svg(socailWaysModel.image),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
