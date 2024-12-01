import 'package:bridgefy/features/data/model/socail_auth_model.dart';
import 'package:bridgefy/features/sign_in/presentation/widgets/socail_authbutton.dart';
import 'package:bridgefy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SocialAuthenticationBar extends StatelessWidget {
  const SocialAuthenticationBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<SocailAuthModel> socialAuthMethods = [
      SocailAuthModel(
        image: Assets.images.googleLogo.path,
        onTap: () {},
      ),
      SocailAuthModel(
        image: Assets.images.linkedInLogo.path,
        onTap: () {},
      ),
      SocailAuthModel(
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
