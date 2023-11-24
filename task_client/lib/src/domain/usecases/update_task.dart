import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class UpdateTask implements UseCase<DataState, TaskEntity> {
  final TaskRepository repository;

  UpdateTask(this.repository);

  @override
  Future<DataState> call(TaskEntity params) {
    return repository.updateTask(params);
  }
}
