abstract class TaskState {}

final class AddTaskInitial extends TaskState {}

final class AddTaskPickDate extends TaskState {}

final class AddTaskPickStartTime extends TaskState {}

final class AddTaskPickEndTime extends TaskState {}

final class AddTaskPickColorTime extends TaskState {}

final class AddTaskSuccess extends TaskState {}

final class AddTaskLoading extends TaskState {}

final class AddTaskFailure extends TaskState {
  final String errorMessage;

  AddTaskFailure({required this.errorMessage});
}

final class GetDataSuccess extends TaskState {}

final class GetDataLoading extends TaskState {}

final class GetDataFailure extends TaskState {
  final String errorMessage;

  GetDataFailure({required this.errorMessage});
}

final class UpdateTaskSuccess extends TaskState {}

final class UpdateTaskLoading extends TaskState {}

final class UpdateTaskFailure extends TaskState {
  final String errorMessage;

  UpdateTaskFailure({required this.errorMessage});
}

final class DeleteTaskSuccess extends TaskState {}

final class DeleteTaskLoading extends TaskState {}

final class DeleteTaskFailure extends TaskState {
  final String errorMessage;

  DeleteTaskFailure({required this.errorMessage});
}

final class GetTasksByDateSuccess extends TaskState {}

final class GetTasksByDateLoading extends TaskState {}

final class GetTasksByDateFailure extends TaskState {
  final String errorMessage;

  GetTasksByDateFailure({required this.errorMessage});
}

final class GetCurrentDate extends TaskState {}
