import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:to_do_app2/constant.dart';
import 'package:to_do_app2/features/on_boarding/data/on_boarding_model.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/widget/text.dart';
import 'page_indicators.dart';
import 'row.dart';
import 'text_button.dart';

class PageViewItem extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  final PageController pageController;
  const PageViewItem({
    super.key,
    required this.onBoardingModel,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 58.h),
          if (!onBoardingModel.showSkipButton) SizedBox(height: 37.h),
          if (onBoardingModel.showSkipButton)
            CustomTextButton(
              text: 'Skip',
              onPressed: () => Functions.visitOnBoarding(context),
              color: kWhiteColorWithOpacity44,
            ),
          SizedBox(height: 10.h),
          SvgPicture.asset(onBoardingModel.imagePath,
              width: 250.w, height: 250.h),
          SizedBox(height: 10.h),
          PageIndicatorsWidget(pageController: pageController),
          SizedBox(height: 40.h),
          TextWidget(
              text: onBoardingModel.text1,
              size: 32,
              fontWeight: FontWeight.w700,
              color: kWhiteColor),
          SizedBox(height: 40.h),
          TextWidget(
            text: onBoardingModel.text2,
            size: 16,
            fontWeight: FontWeight.w400,
            color: kWhiteColor,
          ),
          SizedBox(height: 90.h),
          RowOf2ButtonsWidget(
              showBackButton: onBoardingModel.showBackButton,
              showSkipButton: onBoardingModel.showSkipButton,
              showGetStartedButton: onBoardingModel.showGetStartedButton),
        ],
      ),
    );
  }
}
