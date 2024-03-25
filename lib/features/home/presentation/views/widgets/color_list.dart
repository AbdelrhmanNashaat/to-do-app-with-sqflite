import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_state.dart';

import 'color_item.dart';

class ColorsList extends StatelessWidget {
  const ColorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocProviderObject = BlocProvider.of<TaskCubit>(context);
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: ListView.builder(
            itemCount: blocProviderObject.kColors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.r),
                child: GestureDetector(
                  onTap: () {
                    blocProviderObject.pickColor(index: index);
                  },
                  child: ColorItem(
                    color: blocProviderObject.kColors[index],
                    isSelected: blocProviderObject.currentIndex == index,
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
