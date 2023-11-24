import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class CreateCategory implements UseCase<DataState, CategoryEntity> {
  final CategoryRepository repository;

  CreateCategory(this.repository);

  @override
  Future<DataState> call(CategoryEntity params) {
    return repository.createCategory(params);
  }
}
