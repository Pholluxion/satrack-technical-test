import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(
    this._getAllTasksUseCase,
    this._createTaskUseCase,
    this._updateTaskUseCase,
    this._deleteTaskUseCase,
    this._getTaskUseCase,
  ) : super(TaskInitial());

  final GetAllTasks _getAllTasksUseCase;
  final CreateTask _createTaskUseCase;
  final UpdateTask _updateTaskUseCase;
  final DeleteTask _deleteTaskUseCase;
  final GetTaskById _getTaskUseCase;

  void loadTasks() async {
    emit(TaskLoading());
    try {
      final dataState = await _getAllTasksUseCase(NoParams);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<List<TaskEntity>>;
        emit(TaskLoaded(tasks: response.data));
      } else {
        final response = dataState as DataFailed<String>;
        emit(TaskError(message: response.error));
      }
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  Future<bool> addTask(TaskEntity task) async {
    emit(TaskLoading());
    try {
      final dataState = await _createTaskUseCase(task);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<bool>;
        emit(TaskCreated());
        return response.data;
      } else {
        final response = dataState as DataFailed<String>;
        emit(TaskError(message: response.error));
        return false;
      }
    } catch (e) {
      emit(TaskError(message: e.toString()));
      return false;
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    try {
      final dataState = await _updateTaskUseCase(task);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<bool>;
        if (response.data) {
          loadTasks();
        }
        emit(TaskUpdated());
      } else {
        final response = dataState as DataFailed<String>;
        emit(TaskError(message: response.error));
      }
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      final dataState = await _deleteTaskUseCase(id);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<bool>;
        if (response.data) {
          loadTasks();
        }
      } else {
        final response = dataState as DataFailed<String>;
        emit(TaskError(message: response.error));
      }
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  Future<TaskEntity?> getTaskById(int id) async {
    try {
      final dataState = await _getTaskUseCase(id);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<TaskEntity>;
        return response.data;
      } else {
        final response = dataState as DataFailed<String>;
        emit(TaskError(message: response.error));
        return null;
      }
    } catch (e) {
      emit(TaskError(message: e.toString()));
      return null;
    }
  }

  void loadTasksByCategory(int categoryId) async {
    if (categoryId == 0) {
      loadTasks();
      return;
    }
    emit(TaskLoading());
    try {
      final dataState = await _getAllTasksUseCase(NoParams);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<List<TaskEntity>>;

        final filter = response.data
            .where((element) => element.categories.contains(categoryId))
            .toList();

        emit(TaskLoaded(tasks: filter));
      } else {
        final response = dataState as DataFailed<String>;
        emit(TaskError(message: response.error));
      }
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }
}
