import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_cubit.dart';

import '../../../../../constant.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
  });
  final TextStyle textStyle = const TextStyle(
    color: kWhiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      height: 85.h,
      width: 50.w,
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: kDateColor,
      dateTextStyle: textStyle,
      monthTextStyle: textStyle,
      dayTextStyle: textStyle,
      onDateChange: (date) {
        BlocProvider.of<TaskCubit>(context).getSelectedDate(date: date);
      },
    );
  }
}
