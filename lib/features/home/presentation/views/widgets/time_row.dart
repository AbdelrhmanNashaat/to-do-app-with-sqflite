import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/text.dart';

class RowOfItemTime extends StatelessWidget {
  final String text;
  final IconData? icon;
  const RowOfItemTime({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10.w),
        TextWidget(text: text, size: 18, fontWeight: FontWeight.w400),
      ],
    );
  }
}
