import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constant.dart';

class PageIndicatorsWidget extends StatelessWidget {
  final PageController pageController;
  const PageIndicatorsWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: WormEffect(
        activeDotColor: kWhiteColorWithOpacity87,
        dotColor: kGrayColor,
        dotHeight: 4.h,
        dotWidth: 24.w,
      ),
    );
  }
}
