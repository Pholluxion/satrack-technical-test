import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class GetCategoryById implements UseCase<DataState, int> {
  final CategoryRepository repository;

  GetCategoryById(this.repository);

  @override
  Future<DataState> call(int params) {
    return repository.getCategoryById(params);
  }
}
