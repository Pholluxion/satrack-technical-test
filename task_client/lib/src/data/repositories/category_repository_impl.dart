import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/data/data.dart';
import 'package:task_client/src/domain/domain.dart';

class CategoryRepositopryImpl extends CategoryRepository {
  final CategoryService _categoryService;

  CategoryRepositopryImpl({required CategoryService categoryService})
      : _categoryService = categoryService;

  @override
  Future<DataState> createCategory(CategoryEntity category) async {
    try {
      final response = await _categoryService.createCategory(
        CategoryModel.fromEntity(category).toJson(),
      );

      if (response.statusCode != 201) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<bool>(response.isSuccessful);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> deleteCategory(int id) async {
    try {
      final response = await _categoryService.deleteCategory(id);

      if (response.statusCode != 204) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<bool>(response.isSuccessful);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> getAllCategories() async {
    try {
      final response = await _categoryService.getAllCategories();

      if (response.statusCode != 200) {
        return DataFailed<String>(response.toString());
      }

      final categories = List<CategoryEntity>.from(
        response.body.map((x) => CategoryModel.fromJson(x)),
      );

      return DataSuccess<List<CategoryEntity>>(categories);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> getCategoryById(int id) async {
    try {
      final response = await _categoryService.getCategoryById(id);

      if (response.statusCode != 200) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<CategoryEntity>(CategoryModel.fromJson(response.body));
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }

  @override
  Future<DataState> updateCategory(
    CategoryEntity category,
  ) async {
    try {
      final response = await _categoryService.updateCategory(
        category.id,
        CategoryModel.fromEntity(category).toJson(),
      );

      if (response.statusCode != 200) {
        return DataFailed<String>(response.toString());
      }

      return DataSuccess<bool>(response.isSuccessful);
    } catch (e) {
      return DataFailed<String>(e.toString());
    }
  }
}
