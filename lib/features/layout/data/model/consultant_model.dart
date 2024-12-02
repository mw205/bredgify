import 'package:bridgefy/core/model/socail_auth_model.dart';

class ConsultantModel {
  String image;
  String name;
  String job;
  List<SocailWaysModel> socailMedia;
  ConsultantModel({
    required this.image,
    required this.name,
    required this.job,
    required this.socailMedia,
  });
}
