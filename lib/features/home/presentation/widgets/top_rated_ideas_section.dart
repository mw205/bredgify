import 'package:bridgefy/core/widgets/idea_item.dart';
import 'package:bridgefy/features/layout/data/model/idea_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TopRatedIdeasSection extends StatelessWidget {
  const TopRatedIdeasSection({
    super.key,
    required this.topRatedIdeas,
  });

  final List<IdeaModel> topRatedIdeas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated Ideas",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 150.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 8.w,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                IdeaModel idea = topRatedIdeas[index];
                return IdeaItem(idea: idea);
              },
              separatorBuilder: (context, index) => Gap(10.w),
              itemCount: topRatedIdeas.length,
            ),
          )
        ],
      ),
    );
  }
}
