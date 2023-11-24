import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class GetTaskById implements UseCase<DataState, int> {
  final TaskRepository repository;

  GetTaskById(this.repository);

  @override
  Future<DataState> call(int params) {
    return repository.getTaskById(params);
  }
}
