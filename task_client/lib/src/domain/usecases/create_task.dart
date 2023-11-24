import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class CreateTask implements UseCase<DataState, TaskEntity> {
  final TaskRepository repository;

  CreateTask(this.repository);

  @override
  Future<DataState> call(TaskEntity params) {
    return repository.createTask(params);
  }
}
