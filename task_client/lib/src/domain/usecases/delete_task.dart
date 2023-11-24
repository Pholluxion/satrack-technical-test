import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class DeleteTask implements UseCase<DataState, int> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<DataState> call(int params) {
    return repository.deleteTask(params);
  }
}
