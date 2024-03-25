import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:to_do_app2/constant.dart';

import '../../../../../core/widget/text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 40.h,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: TextWidget(
            text: text,
            size: 16,
            fontWeight: FontWeight.w400,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
