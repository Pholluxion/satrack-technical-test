import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class DeleteCategory implements UseCase<DataState, int> {
  final CategoryRepository repository;

  DeleteCategory(this.repository);

  @override
  Future<DataState> call(int params) {
    return repository.deleteCategory(params);
  }
}
