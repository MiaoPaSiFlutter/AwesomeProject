import 'package:hzy_common_module/hzy_common_module.dart';

class Skateboards {
  Skateboards({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
  });

  String imagePath;
  String titleTxt;
  String subTxt;

  static List<Skateboards> hotelList = <Skateboards>[
    Skateboards(
      imagePath: NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong', name: 'assets/images/guide/reject.jpg'),
      titleTxt: 'Reject',
      subTxt:
          "The top of the deck has the same matching graphic in black outline and embodies an overall mellow concave.",
    ),
    Skateboards(
      imagePath: NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong',
          name: 'assets/images/guide/samurai.jpg'),
      titleTxt: 'Samurai',
      subTxt:
          "A durable deck featured with a menacing face of a samurai at the center of the underside accompanied with a large red sun motif.",
    ),
    Skateboards(
      imagePath: NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong', name: 'assets/images/guide/reject.jpg'),
      titleTxt: 'Reject',
      subTxt:
          "The top of the deck has the same matching graphic in black outline and embodies an overall mellow concave.",
    ),
    Skateboards(
      imagePath: NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong',
          name: 'assets/images/guide/greatwave.jpg'),
      titleTxt: 'Great Wave',
      subTxt:
          "You don’t have time to consider whether the graphic on your CCS board would be considered modernist.",
    ),
    Skateboards(
      imagePath: NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong',
          name: 'assets/images/guide/samurai.jpg'),
      titleTxt: 'Samurai',
      subTxt:
          "A durable deck featured with a menacing face of a samurai at the center of the underside accompanied with a large red sun motif.",
    ),
  ];
}
