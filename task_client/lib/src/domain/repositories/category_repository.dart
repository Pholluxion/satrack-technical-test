import 'package:task_client/src/core/core.dart' show DataState;
import 'package:task_client/src/domain/domain.dart' show CategoryEntity;

abstract class CategoryRepository {
  Future<DataState> getAllCategories();
  Future<DataState> getCategoryById(int id);
  Future<DataState> updateCategory(CategoryEntity category);
  Future<DataState> createCategory(CategoryEntity category);
  Future<DataState> deleteCategory(int id);
}
