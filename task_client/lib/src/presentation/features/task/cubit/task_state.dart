part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskLoaded extends TaskState {
  const TaskLoaded({
    required this.tasks,
  });

  final List<TaskEntity> tasks;

  @override
  List<Object> get props => [tasks];
}

final class TaskError extends TaskState {
  const TaskError({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

final class TaskCreated extends TaskState {}

final class TaskUpdated extends TaskState {}
