import '../../../core/utils/assets.dart';

class OnBoardingModel {
  final bool showSkipButton;
  final bool showBackButton;
  final bool showGetStartedButton;
  final String imagePath;
  final String text1;
  final String text2;
  const OnBoardingModel({
    required this.showSkipButton,
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.showBackButton,
    required this.showGetStartedButton,
  });
  static final List<OnBoardingModel> list = [
    OnBoardingModel(
      showSkipButton: true,
      imagePath: AssetData.onBoardingImage1,
      text1: 'Manage your tasks',
      text2: 'You can easily manage all of your daily\ntasks in DoMe for free',
      showBackButton: false,
      showGetStartedButton: false,
    ),
    OnBoardingModel(
      showSkipButton: true,
      imagePath: AssetData.onBoardingImage2,
      text1: 'Create daily routine',
      text2:
          'In Up to do  you can create your\npersonalized routine to stay productive',
      showBackButton: true,
      showGetStartedButton: false,
    ),
    OnBoardingModel(
      showSkipButton: false,
      imagePath: AssetData.onBoardingImage3,
      text1: 'Organize your tasks',
      text2:
          'You can organize your daily tasks by\nadding your tasks into separate categories',
      showBackButton: true,
      showGetStartedButton: true,
    ),
  ];
}
