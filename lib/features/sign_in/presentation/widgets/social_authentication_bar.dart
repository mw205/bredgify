import 'package:bridgefy/core/model/socail_auth_model.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/socail_authbutton.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SocialAuthenticationBar extends StatelessWidget {
  const SocialAuthenticationBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<SocailWaysModel> socialAuthMethods = [
      SocailWaysModel(
        image: Assets.images.googleLogo.path,
        onTap: () {},
      ),
      SocailWaysModel(
        image: Assets.images.linkedInLogo.path,
        onTap: () {},
      ),
      SocailWaysModel(
        image: Assets.images.githubLogo.path,
        onTap: () {},
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        socialAuthMethods.length,
        (index) => SocailAuthbutton(
          image: socialAuthMethods[index].image,
          onTap: socialAuthMethods[index].onTap,
        ),
      ),
    );
  }
}
