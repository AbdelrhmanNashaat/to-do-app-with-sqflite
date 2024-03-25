class AddTaskModel {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final int color;
  final int isCompleted;

  AddTaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.isCompleted,
  });
  factory AddTaskModel.fromjson(Map<String, dynamic> jsonData) {
    return AddTaskModel(
      title: jsonData['title'],
      note: jsonData['note'],
      date: jsonData['date'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      color: jsonData['color'],
      isCompleted: jsonData['isCompleted'],
      id: jsonData['id'],
    );
  }
}
