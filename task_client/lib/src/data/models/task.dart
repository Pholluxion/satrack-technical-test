import 'package:task_client/src/domain/domain.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required int id,
    required String title,
    required String description,
    required bool isTaskCompleted,
    required List<int> categories,
    required String priority,
    required List<int> endDate,
  }) : super(
          id: id,
          title: title,
          description: description,
          isTaskCompleted: isTaskCompleted,
          categories: categories,
          priority: priority,
          endDate: endDate,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isTaskCompleted: json['isTaskCompleted'],
      priority: json['priority'],
      categories: List<int>.from(json["categories"].map((x) => x)),
      endDate: List<int>.from(json["endDate"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isTaskCompleted': isTaskCompleted,
      'priority': priority,
      "categories": categories,
      "endDate": endDate.join('-'),
    };
  }

  TaskModel.fromEntity(TaskEntity entity)
      : this(
          id: entity.id,
          title: entity.title,
          description: entity.description,
          isTaskCompleted: entity.isTaskCompleted,
          categories: entity.categories,
          priority: entity.priority,
          endDate: entity.endDate,
        );
}
