import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/core/widgets/idea_item.dart';
import 'package:bridgefy/features/layout/data/model/idea_model.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key, required this.categoryName});
  static String id = "/projects";
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    List<IdeaModel> ideas = [
      IdeaModel(
        name: "Smart Agriculture with AI and IoT",
        description:
            "Combines AI and IoT to \noptimize farming through real-time monitoring and automation, improving efficiency and sustainability",
        image: Assets.images.land.path,
        category: "Agriculture",
        rate: 4,
      ),
      IdeaModel(
        name: "Smart Agriculture with AI and IoT",
        description:
            "Combines AI and IoT to \noptimize farming through real-time monitoring and automation, improving efficiency and sustainability",
        image: Assets.images.land.path,
        category: "Agriculture",
        rate: 4,
      ),
      IdeaModel(
        name: "Smart Agriculture with AI and IoT",
        description:
            "Combines AI and IoT to \noptimize farming through real-time monitoring and automation, improving efficiency and sustainability",
        image: Assets.images.land.path,
        category: "Agriculture",
        rate: 4,
      ),
      IdeaModel(
        name: "Smart Agriculture with AI and IoT",
        description:
            "Combines AI and IoT to \noptimize farming through real-time monitoring and automation, improving efficiency and sustainability",
        image: Assets.images.land.path,
        category: "Agriculture",
        rate: 4,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: Text(
          categoryName,
          style: AppTextStyles.kBlack20FontW600,
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var idea = ideas[index];
            return IdeaItem(idea: idea);
          },
          separatorBuilder: (context, index) => Gap(24.h),
          itemCount: ideas.length),
    );
  }
}
