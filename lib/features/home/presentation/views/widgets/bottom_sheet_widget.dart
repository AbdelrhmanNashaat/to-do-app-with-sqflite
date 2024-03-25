import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../manager/task_cubit/task_cubit.dart';
import 'item_button.dart';

class BottomSheetWidget extends StatelessWidget {
  final bool isCompleted;
  final int index;
  const BottomSheetWidget({
    super.key,
    required this.isCompleted,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final blocProviderObject = BlocProvider.of<TaskCubit>(context);
    return Container(
      height: isCompleted ? 180.h : 244.h,
      width: double.infinity.sw,
      color: const Color(0xff424242),
      child: Column(
        children: [
          if (!isCompleted) SizedBox(height: 25.h),
          if (!isCompleted)
            CustomItemButton(
              text: 'Task Completed',
              color: kAddButtonColor,
              onPressed: () {
                blocProviderObject.updateTask(
                    id: blocProviderObject.listOfTaskModel[index].id);
                Navigator.pop(context);
              },
            ),
          SizedBox(height: 25.h),
          CustomItemButton(
            text: 'Delete Task',
            color: kDeleteButtonColor,
            onPressed: () {
              blocProviderObject.deleteTask(
                  id: blocProviderObject.listOfTaskModel[index].id);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 25.h),
          CustomItemButton(
            text: 'Cancel',
            color: kAddButtonColor,
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
