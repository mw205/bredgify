import 'package:bridgefy/core/constants/app_text_styles.dart';
import 'package:bridgefy/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: Text(
          "Explore",
          style: AppTextStyles.kBlack20FontW600,
        ),
      ),
    );
  }
}
