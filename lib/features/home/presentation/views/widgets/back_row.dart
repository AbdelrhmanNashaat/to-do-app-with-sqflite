import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/text.dart';

class CustomBackWidgetOnSheet extends StatelessWidget {
  const CustomBackWidgetOnSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        SizedBox(width: 15.w),
        const TextWidget(
            text: 'Add Task', size: 32, fontWeight: FontWeight.w700),
      ],
    );
  }
}
