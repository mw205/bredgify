import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/model/socail_auth_model.dart';
import 'package:bridgefy/core/widgets/consultant_item.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:bridgefy/features/layout/data/model/consultant_model.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultantsScreen extends StatelessWidget {
  const ConsultantsScreen({super.key});
  static String id = "/consultants";
  @override
  Widget build(BuildContext context) {
    List<ConsultantModel> consultants = [
      ConsultantModel(
        image: Assets.images.mohamedAli.path,
        name: "Mohamed Ali",
        job: 'Business Consultant',
        socailMedia: [
          SocailWaysModel(
            image: Assets.images.linkedInLogo.path,
            onTap: () {},
          ),
          SocailWaysModel(
            image: Assets.images.githubLogo.path,
            onTap: () {},
          )
        ],
      ),
      ConsultantModel(
        image: Assets.images.mohamedAli.path,
        name: "Mohamed Ali",
        job: 'Business Consultant',
        socailMedia: [
          SocailWaysModel(
            image: Assets.images.linkedInLogo.path,
            onTap: () {},
          ),
          SocailWaysModel(
            image: Assets.images.githubLogo.path,
            onTap: () {},
          )
        ],
      ),
      ConsultantModel(
        image: Assets.images.mohamedAli.path,
        name: "Mohamed Ali",
        job: 'Business Consultant',
        socailMedia: [
          SocailWaysModel(
            image: Assets.images.linkedInLogo.path,
            onTap: () {},
          ),
          SocailWaysModel(
            image: Assets.images.githubLogo.path,
            onTap: () {},
          )
        ],
      ),
      ConsultantModel(
        image: Assets.images.mohamedAli.path,
        name: "Mohamed Ali",
        job: 'Business Consultant',
        socailMedia: [
          SocailWaysModel(
            image: Assets.images.linkedInLogo.path,
            onTap: () {},
          ),
          SocailWaysModel(
            image: Assets.images.githubLogo.path,
            onTap: () {},
          )
        ],
      )
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: Text(
          "Consultants",
          style: AppTextStyles.kBlack20FontW600,
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 12.w,
        ),
        itemCount: consultants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 5.w,
        ),
        itemBuilder: (context, index) {
          var consultant = consultants[index];
          return ConsultantItem(consultant: consultant);
        },
      ),
    );
  }
}
