import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app2/features/on_boarding/data/on_boarding_model.dart';

import 'widgets/page_view_item.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => OnBoardingViewBodyState();
}

class OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  static final PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: OnBoardingModel.list.length,
      controller: pageController,
      itemBuilder: (BuildContext context, int index) {
        return PageViewItem(
            onBoardingModel: OnBoardingModel.list[index],
            pageController: pageController);
      },
    );
  }
}
