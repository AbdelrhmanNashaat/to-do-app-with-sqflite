import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_state.dart';
import '../../../../../core/widget/text.dart';
import '../../../data/task_model.dart';
import 'bottom_sheet_widget.dart';
import 'divider.dart';
import 'time_row.dart';

class ToDoItem extends StatelessWidget {
  final AddTaskModel addTaskModel;
  final int index;
  const ToDoItem({super.key, required this.addTaskModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheetWidget(
                isCompleted: addTaskModel.isCompleted == 0 ? false : true,
                index: index,
              );
            },
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 327.w,
            decoration: BoxDecoration(
              color: Color(addTaskModel.color),
              borderRadius: BorderRadius.circular(16).r,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    TextWidget(
                        text: addTaskModel.title,
                        size: 28,
                        fontWeight: FontWeight.w700),
                    SizedBox(height: 5.h),
                    RowOfItemTime(
                      text: addTaskModel.date,
                      icon: Icons.date_range,
                    ),
                    SizedBox(height: 5.h),
                    RowOfItemTime(
                      text:
                          '${addTaskModel.startTime} - ${addTaskModel.endTime}',
                      icon: Icons.timer,
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.only(right: 56),
                      child: TextWidget(
                        text: addTaskModel.note,
                        size: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
                CustomDivider(
                  isCompleted: addTaskModel.isCompleted == 0 ? false : true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
