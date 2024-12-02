import 'package:bridgefy/features/create_project/presentation/screens/add_project_screen.dart';
import 'package:bridgefy/features/explore/presentation/screens/explore_screen.dart';
import 'package:bridgefy/features/favorites/presentation/screens/favorite_screen.dart';
import 'package:bridgefy/features/home/presentation/screens/home_screen.dart';
import 'package:bridgefy/features/profile/presentation/screens/profile_screen.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:bridgefy/gen/colors.gen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, this.navigatedIndex = 0});
  static String id = "/layout";

  final int? navigatedIndex;
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final int _homeIndex = 0;
  late int _selectedIndex;
  List<Widget> pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const AddProjectScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.navigatedIndex ?? _homeIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          backgroundColor: ColorName.white,
          elevation: 0,
          height: 64.h,
          style: TabStyle.fixedCircle,
          cornerRadius: 20.r,
          curveSize: 115.r,
          items: [
            TabItem(
              title: "Home",
              icon: Assets.images.homeIconInactive.svg(),
              activeIcon: Assets.images.homeIconActive.svg(),
            ),
            TabItem(
              title: "Explore",
              icon: Assets.images.exploreIconInactive.svg(),
              activeIcon: Assets.images.exploreIconActive.svg(),
            ),
            TabItem(
              icon: Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                  color: ColorName.darkBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TabItem(
              title: "Favorite",
              icon: Assets.images.favoriteIconInactive.svg(),
              activeIcon: Assets.images.favoriteIconActive.svg(),
            ),
            TabItem(
              title: "Profile",
              activeIcon: Assets.images.profileIconActive.svg(),
              icon: Assets.images.profileIconInactive.svg(),
            ),
          ],
          initialActiveIndex: _selectedIndex,
          onTap: (int index) {
            context.push(AddProjectScreen.id);
            setState(() {
              _selectedIndex = index;
              print('Selected index: $index');
            });
          },
        ),
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 24.w;

  @override
  double get activeIconMargin => 10.r;

  @override
  double get iconSize => 24.w;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 12.sp, color: Colors.black);
  }
}
