import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app2/core/database/sqflite_helper.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../data/task_model.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(AddTaskInitial());
  DateTime? currentDate = DateTime.now();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(DateTime.now());
  int currentIndex = 0;
  List<Color> kColors = const [
    Color(0xffFF4666),
    Color(0xff66CC41),
    Color(0xff41CCA7),
    Color(0xff4181CC),
    Color(0xffCC8441),
    Color(0xff9741CC),
  ];
  List<AddTaskModel> listOfTaskModel = [];
  void pickDate({required DateTime? pickedDate}) {
    if (pickedDate != null) {
      currentDate = pickedDate;
    }
    emit(AddTaskPickDate());
  }

  void pickStartTime({required String pickedStartTime}) {
    startTime = pickedStartTime;
    emit(AddTaskPickStartTime());
  }

  void pickEndTime({required String pickedEndTime}) {
    endTime = pickedEndTime;
    emit(AddTaskPickEndTime());
  }

  void pickColor({required int index}) {
    currentIndex = index;
    emit(AddTaskPickColorTime());
  }

  void addTask() {
    emit(AddTaskLoading());
    try {
      getIt<SqfLiteHelper>().insertIntoDb(
        model: AddTaskModel(
          title: titleController.text,
          note: noteController.text,
          date: Functions.formatDateWithoutTime(pickedDate: currentDate),
          startTime: startTime,
          endTime: endTime,
          color: kColors[currentIndex].value,
          isCompleted: 0,
        ),
      );
      titleController.clear();
      noteController.clear();
      emit(AddTaskSuccess());
      getTasks();
    } catch (ex) {
      log(ex.toString());
      emit(
        AddTaskFailure(errorMessage: ex.toString()),
      );
    }
  }

  void getTasks() async {
    emit(GetDataLoading());
    try {
      await getIt<SqfLiteHelper>().getFromDb().then(
        (value) {
          listOfTaskModel = value
              .map((e) => AddTaskModel.fromjson(e))
              .toList()
              .where((element) =>
                  element.date ==
                  Functions.formatDateWithoutTime(pickedDate: currentDate))
              .toList();
        },
      );
      emit(GetDataSuccess());
    } catch (ex) {
      emit(GetDataFailure(errorMessage: ex.toString()));
    }
  }

  void updateTask({required id}) async {
    emit(UpdateTaskLoading());
    try {
      await getIt<SqfLiteHelper>().updateDb(id: id);
      emit(UpdateTaskSuccess());
      getTasks();
    } catch (ex) {
      emit(UpdateTaskFailure(errorMessage: ex.toString()));
    }
  }

  void deleteTask({required id}) async {
    emit(DeleteTaskLoading());
    try {
      await getIt<SqfLiteHelper>().deleteFromDb(id: id);
      emit(DeleteTaskSuccess());
      getTasks();
    } catch (ex) {
      emit(DeleteTaskFailure(errorMessage: ex.toString()));
    }
  }

  void getSelectedDate({required date}) {
    currentDate = date;
    emit(GetCurrentDate());
    getTasks();
  }
}
