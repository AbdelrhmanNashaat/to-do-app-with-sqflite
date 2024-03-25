import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app2/core/widget/text.dart';

class CustomDivider extends StatelessWidget {
  final bool isCompleted;
  const CustomDivider({
    super.key,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 22,
      right: MediaQuery.of(context).size.width / 90,
      child: Row(
        children: [
          Container(
            height: 85.h,
            width: 0.8,
            color: Colors.white.withOpacity(0.7),
            margin: const EdgeInsets.only(left: 6, right: 6),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: TextWidget(
                text: isCompleted ? 'Completed' : 'TODO',
                size: 18,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
