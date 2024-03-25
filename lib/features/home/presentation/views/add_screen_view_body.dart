import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app2/constant.dart';
import 'package:to_do_app2/core/utils/common/functions.dart';
import 'package:to_do_app2/features/home/presentation/manager/task_cubit/task_state.dart';
import 'package:to_do_app2/features/home/presentation/manager/validate_cubit/validate_cubit.dart';
import 'package:to_do_app2/features/home/presentation/manager/validate_cubit/validate_state.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text.dart';
import '../manager/task_cubit/task_cubit.dart';
import 'widgets/back_row.dart';
import 'widgets/color_list.dart';
import 'widgets/row_fields.dart';
import 'widgets/row_labels.dart';
import 'widgets/text_field.dart';

class AddBody extends StatelessWidget {
  const AddBody({super.key});
  @override
  Widget build(BuildContext context) {
    final blocProviderAddTaskObject = BlocProvider.of<TaskCubit>(context);
    final blocProviderValidateObject = BlocProvider.of<ValidateCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            if (state is AddTaskSuccess) {
              Functions.flutterToastMethod(msg: 'Task has Added Successfully');
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return BlocConsumer<ValidateCubit, ValidateState>(
              listener: (context, state) {
                if (state is ValidateFailure) {
                  blocProviderValidateObject.autovalidateMode =
                      AutovalidateMode.always;
                }
              },
              builder: (context, state) {
                return Form(
                  autovalidateMode: blocProviderValidateObject.autovalidateMode,
                  key: blocProviderValidateObject.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.h),
                      const CustomBackWidgetOnSheet(),
                      SizedBox(height: 40.h),
                      const TextWidget(
                          text: 'Title', size: 18, fontWeight: FontWeight.w400),
                      SizedBox(height: 10.h),
                      CustomTextFiled(
                        textEditingController:
                            blocProviderAddTaskObject.titleController,
                        hint: 'Enter title here',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title mustn\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      const TextWidget(
                          text: 'Note', size: 18, fontWeight: FontWeight.w400),
                      SizedBox(height: 10.h),
                      CustomTextFiled(
                        hint: 'Enter note here',
                        textEditingController:
                            blocProviderAddTaskObject.noteController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Note mustn\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      const TextWidget(
                          text: 'Date', size: 18, fontWeight: FontWeight.w400),
                      SizedBox(height: 10.h),
                      CustomTextFiled(
                        hint: DateFormat.yMd()
                            .format(blocProviderAddTaskObject.currentDate!),
                        needIcon: true,
                        icon: Icons.calendar_today_rounded,
                        readOnly: true,
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          blocProviderAddTaskObject.pickDate(
                              pickedDate: pickedDate);
                        },
                      ),
                      SizedBox(height: 25.h),
                      const RowOfLabels(),
                      SizedBox(height: 10.h),
                      const RowOfTextFields(),
                      SizedBox(height: 25.h),
                      const TextWidget(
                          text: 'Color', size: 18, fontWeight: FontWeight.w400),
                      SizedBox(height: 5.h),
                      const ColorsList(),
                      SizedBox(height: 35.h),
                      CustomButton(
                        text: 'CREATE TASK',
                        color: kAddButtonColor,
                        onPressed: () {
                          blocProviderValidateObject.validateForm();
                          if (state is ValidateSuccess) {
                            blocProviderAddTaskObject.addTask();
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
