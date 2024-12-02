import 'package:flutter/material.dart';
import 'package:bridgefy/core/model/socail_auth_model.dart';
import 'package:bridgefy/core/widgets/consultant_item.dart';
import 'package:bridgefy/features/categories/presentation/screens/categories_screen.dart';
import 'package:bridgefy/features/consultants/presentation/screens/consultants_screen.dart';
import 'package:bridgefy/features/home/presentation/widgets/categories_section.dart';
import 'package:bridgefy/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:bridgefy/features/home/presentation/widgets/top_rated_ideas_section.dart';
import 'package:bridgefy/features/layout/data/model/categories_model.dart';
import 'package:bridgefy/features/layout/data/model/consultant_model.dart';
import 'package:bridgefy/features/layout/data/model/idea_model.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static String id = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  List<IdeaModel> topRatedIdeas = [
    IdeaModel(
      name: "Smart Agriculture with AI and IoT",
      description:
          "Combines AI and IoT to \noptimize farming through real-time monitoring and automation, improving efficiency and sustainability",
      image: Assets.images.land.path,
      category: "Agriculture",
      rate: 4,
    )
  ];
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
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomAppBar(),
          ),
          SliverGap(41.h),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 24.w,
                end: 24.w,
                bottom: 16.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(CategoriesScreen.id);
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        color: ColorName.darkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CategoriesSection(categories: categories),
          ),
          SliverGap(24.h),
          SliverToBoxAdapter(
            child: TopRatedIdeasSection(topRatedIdeas: topRatedIdeas),
          ),
          SliverGap(24.h),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w, end: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Consultants",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(ConsultantsScreen.id);
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                            color: ColorName.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(10.h),
                SizedBox(
                  height: 170.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var consultant = consultants[index];
                      return ConsultantItem(consultant: consultant);
                    },
                    separatorBuilder: (context, index) => const Gap(16),
                    itemCount: consultants.length,
                  ),
                )
              ],
            ),
          ),
          SliverGap(80.h)
        ],
      ),
    );
  }
}
