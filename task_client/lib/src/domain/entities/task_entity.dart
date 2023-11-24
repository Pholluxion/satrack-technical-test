import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isTaskCompleted;
  final List<int> categories;
  final List<int> endDate;
  final String priority;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.isTaskCompleted,
    required this.categories,
    required this.priority,
    required this.endDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isTaskCompleted,
        categories,
        priority,
        endDate,
      ];

  TaskEntity copyWith({
    int? id,
    String? title,
    String? description,
    bool? isTaskCompleted,
    List<int>? categories,
    String? priority,
    List<int>? endDate,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isTaskCompleted: isTaskCompleted ?? this.isTaskCompleted,
      categories: categories ?? this.categories,
      priority: priority ?? this.priority,
      endDate: endDate ?? this.endDate,
    );
  }
}
