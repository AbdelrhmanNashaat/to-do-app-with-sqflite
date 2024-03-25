import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app2/core/widget/text.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_state.dart';
import '../manager/task_cubit/task_cubit.dart';
import 'widgets/date_picker.dart';
import 'widgets/image.dart';
import 'widgets/to_do_item.dart';

DateTime dateTime = DateTime.now();
var formattedDate = DateFormat('MMMM d, y').format(dateTime);

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<TaskCubit>(context).getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blocProviderObject = BlocProvider.of<TaskCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              TextWidget(
                  text: formattedDate, size: 24, fontWeight: FontWeight.w700),
              SizedBox(height: 20.h),
              const TextWidget(
                  text: 'Today', size: 24, fontWeight: FontWeight.w700),
              SizedBox(height: 10.h),
              const DatePickerWidget(),
              SizedBox(height: 20.h),
              if (blocProviderObject.listOfTaskModel.isEmpty)
                const ImageWidget(),
              if (blocProviderObject.listOfTaskModel.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: blocProviderObject.listOfTaskModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ToDoItem(
                          addTaskModel:
                              blocProviderObject.listOfTaskModel[index],
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
