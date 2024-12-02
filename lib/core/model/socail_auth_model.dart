class SocailWaysModel {
  final String image;
  void Function()? onTap;

  SocailWaysModel({
    required this.image,
    required this.onTap,
  });
}

enum SocialWaysType { github, linkedIn, google }
