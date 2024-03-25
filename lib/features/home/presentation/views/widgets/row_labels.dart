import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/text.dart';

class RowOfLabels extends StatelessWidget {
  const RowOfLabels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TextWidget(
            text: 'Start Time', size: 18, fontWeight: FontWeight.w400),
        SizedBox(
          width: 103.w,
        ),
        const TextWidget(
            text: 'End Time', size: 18, fontWeight: FontWeight.w400),
      ],
    );
  }
}
