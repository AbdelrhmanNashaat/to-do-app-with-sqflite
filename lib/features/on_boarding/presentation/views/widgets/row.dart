import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/common/functions.dart';
import '../on_boarding_view_body.dart';
import 'custom_button.dart';
import 'text_button.dart';

class RowOf2ButtonsWidget extends StatelessWidget {
  const RowOf2ButtonsWidget({
    super.key,
    required this.showBackButton,
    required this.showSkipButton,
    required this.showGetStartedButton,
  });

  final bool showBackButton;
  final bool showSkipButton;
  final bool showGetStartedButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showBackButton)
          CustomTextButton(
            text: 'Back',
            onPressed: () {
              if (OnBoardingViewBodyState.pageController.page != 0) {
                OnBoardingViewBodyState.pageController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            color: kWhiteColorWithOpacity44,
          ),
        const Spacer(),
        if (showSkipButton)
          CustomButton(
            text: 'NEXT',
            width: 80.w,
            onTap: () {
              if (OnBoardingViewBodyState.pageController.page != 2) {
                OnBoardingViewBodyState.pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        if (showGetStartedButton)
          CustomButton(
            text: 'GET STARTED',
            width: 120.w,
            onTap: () => Functions.visitOnBoarding(context),
          ),
      ],
    );
  }
}
