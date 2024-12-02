import 'package:bridgefy/features/layout/data/model/idea_model.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IdeaItem extends StatelessWidget {
  const IdeaItem({
    super.key,
    required this.idea,
  });

  final IdeaModel idea;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 6.r,
            blurRadius: 15.r,
          ),
        ],
      ),
      padding: EdgeInsets.all(10.h),
      child: Row(
        children: [
          Image.asset(
            idea.image,
            width: 140.w,
            height: 102.h,
          ),
          Column(
            children: [
              //title
              Text(
                idea.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 8.w,
                  top: 8.h,
                ),
                child: SizedBox(
                  width: 170.w,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Description: ",
                          style: TextStyle(
                            color: ColorName.darkBlue,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: idea.description,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              //category //rate
              ,
              Gap(7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.5.h,
                      horizontal: 7.w,
                    ),
                    decoration: BoxDecoration(
                      color: ColorName.lavender,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        idea.category,
                        style: TextStyle(
                          color: ColorName.darkBlue,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        if (index < idea.rate) {
                          return Icon(
                            Icons.star_rate,
                            color: ColorName.yellow,
                            size: 18.sp,
                          );
                        } else {
                          return Icon(
                            Icons.star_rate,
                            color: ColorName.gray,
                            size: 18.sp,
                          );
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
