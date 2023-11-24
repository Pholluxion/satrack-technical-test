import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

class GetAllCategories implements UseCase<DataState, void> {
  final CategoryRepository repository;

  GetAllCategories(this.repository);

  @override
  Future<DataState> call(void params) {
    return repository.getAllCategories();
  }
}
