import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_state.dart';

import 'text_field.dart';

class RowOfTextFields extends StatelessWidget {
  const RowOfTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    final blocProviderObject = BlocProvider.of<TaskCubit>(context);
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Row(
          children: [
            CustomTextFiled(
              hint: blocProviderObject.startTime,
              readOnly: true,
              width: 150,
              needIcon: true,
              icon: Icons.timer,
              onPressed: () async {
                TimeOfDay? pickedStartTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    DateTime.now(),
                  ),
                );
                if (pickedStartTime != null && context.mounted) {
                  final String formattedTime = pickedStartTime.format(context);
                  blocProviderObject.pickStartTime(
                    pickedStartTime: formattedTime,
                  );
                }
              },
            ),
            SizedBox(width: 27.w),
            CustomTextFiled(
              hint: blocProviderObject.endTime,
              width: 150,
              readOnly: true,
              needIcon: true,
              icon: Icons.timer,
              onPressed: () async {
                TimeOfDay? pickedEndTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    DateTime.now(),
                  ),
                );
                if (pickedEndTime != null && context.mounted) {
                  final String formattedTime = pickedEndTime.format(context);
                  blocProviderObject.pickEndTime(
                    pickedEndTime: formattedTime,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
