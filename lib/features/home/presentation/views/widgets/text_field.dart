import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class CustomTextFiled extends StatelessWidget {
  final bool needIcon;
  final bool readOnly;
  final String hint;
  final bool autofocus;
  final double height;
  final double width;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;
  final IconData? icon;
  final TextEditingController? textEditingController;
  const CustomTextFiled({
    super.key,
    required this.hint,
    this.validator,
    this.autofocus = false,
    this.height = 44,
    this.width = 327,
    this.needIcon = false,
    this.readOnly = false,
    this.onPressed,
    this.icon,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: TextFormField(
        autofocus: autofocus,
        validator: validator,
        readOnly: readOnly,
        controller: textEditingController,
        cursorColor: kWhiteColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.r),
          suffixIcon: needIcon
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    color: kWhiteColor,
                  ),
                )
              : null,
          fillColor: kFillColor,
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: kWhiteColor),
          enabledBorder: borderMethod(),
          focusedBorder: borderMethod(),
        ),
      ),
    );
  }

  OutlineInputBorder borderMethod() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: kBorderColor,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(4.r),
    );
  }
}
