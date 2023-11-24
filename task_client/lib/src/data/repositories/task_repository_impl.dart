import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/data/data.dart';
import 'package:task_client/src/domain/domain.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskService _taskService;

  TaskRepositoryImpl({required TaskService taskService})
      : _taskService = taskService;

  @override
  Future<DataState> createTask(TaskEntity task) async {
    try {
      final response = await _taskService.createTask(
        TaskModel.fromEntity(task).toJson(),
      );

      if (response.statusCode != 201) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<bool>(response.isSuccessful);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> deleteTask(int id) async {
    try {
      final response = await _taskService.deleteTask(id);

      if (response.statusCode != 204) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<bool>(response.isSuccessful);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> getAllTasks() async {
    try {
      final response = await _taskService.getAllTasks();

      if (response.statusCode != 200) {
        return DataFailed<String>(response.toString());
      }

      final tasks = List<TaskEntity>.from(
        response.body.map((x) => TaskModel.fromJson(x)),
      );

      return DataSuccess<List<TaskEntity>>(tasks);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> getTaskById(int id) async {
    try {
      final response = await _taskService.getTaskById(id);

      if (response.statusCode != 200) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<TaskEntity>(TaskModel.fromJson(response.body));
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> updateTask(TaskEntity task) async {
    try {
      final response = await _taskService.updateTask(
        task.id,
        TaskModel.fromEntity(task).toJson(),
      );

      if (response.statusCode != 200) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<bool>(response.isSuccessful);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }
}
