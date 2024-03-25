import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app2/core/database/cache_helper.dart';
import 'package:to_do_app2/core/services/service_locator.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widget/text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateMethod();
    super.initState();
  }

  Future<Null> navigateMethod() {
    bool isVisited = getIt<CacheHelper>().getData(key: 'onBoarding') ?? false;
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(
            context, isVisited ? '/home' : '/onBoarding');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetData.splashIcon,
            width: 95.w,
            height: 80.h,
          ),
          SizedBox(height: 25.h),
          const TextWidget(
              text: 'UpTodo', size: 40, fontWeight: FontWeight.w700),
        ],
      ),
    );
  }
}
