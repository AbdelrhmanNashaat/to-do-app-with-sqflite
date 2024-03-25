import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22.r,
      backgroundColor: color,
      child: isSelected
          ? const Center(
              child: Icon(
                Icons.done,
                size: 30,
              ),
            )
          : const Center(),
    );
  }
}
