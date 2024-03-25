import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app2/constant.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55.w,
      height: 55.h,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/add'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          backgroundColor: kFaBColor,
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}
