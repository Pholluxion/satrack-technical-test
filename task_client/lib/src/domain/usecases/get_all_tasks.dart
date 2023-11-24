import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class GetAllTasks implements UseCase<DataState, void> {
  final TaskRepository repository;

  GetAllTasks(this.repository);

  @override
  Future<DataState> call(void params) {
    return repository.getAllTasks();
  }
}
