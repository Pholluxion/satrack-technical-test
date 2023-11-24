import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class UpdateCategory implements UseCase<DataState, CategoryEntity> {
  final CategoryRepository repository;

  UpdateCategory(this.repository);

  @override
  Future<DataState> call(CategoryEntity params) {
    return repository.updateCategory(params);
  }
}
