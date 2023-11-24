import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart' show TaskEntity;

abstract class TaskRepository {
  Future<DataState> getAllTasks();
  Future<DataState> getTaskById(int id);
  Future<DataState> updateTask(TaskEntity task);
  Future<DataState> createTask(TaskEntity task);
  Future<DataState> deleteTask(int id);
}
