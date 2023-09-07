import 'package:chatapp/core/utils/app_assests.dart';

import '../../../../core/utils/app_strings.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String pra;
  OnBoardingModel(
      {required this.imgPath, required this.title, required this.pra});
  static List<OnBoardingModel> OnBoardingScreen = [
    OnBoardingModel(
        imgPath: AppImages.image1,
        title: AppStrings.title1,
        pra: AppStrings.subTitle1),
    OnBoardingModel(
        imgPath: AppImages.image2,
        title: AppStrings.title2,
        pra: AppStrings.subTitle2),
    OnBoardingModel(
        imgPath: AppImages.image3,
        title: AppStrings.title3,
        pra: AppStrings.subTitle3),
  ];
}
