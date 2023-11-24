import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(
    this._getAllCategories,
    this._createCategory,
    this._updateCategory,
    this._deleteCategory,
    this._getCategoryById,
  ) : super(CategoryInitial());

  final GetAllCategories _getAllCategories;
  final CreateCategory _createCategory;
  final UpdateCategory _updateCategory;
  final DeleteCategory _deleteCategory;
  final GetCategoryById _getCategoryById;

  Future<void> loadCategories() async {
    emit(CategoryLoading());
    try {
      final dataState = await _getAllCategories(NoParams);
      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<List<CategoryEntity>>;
        emit(CategoryLoaded(categories: response.data));
      } else {
        final response = dataState as DataFailed<String>;
        emit(CategoryError(message: response.error));
      }
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  Future<void> addCategory(CategoryEntity category) async {
    emit(CategoryLoading());
    try {
      final dataState = await _createCategory(category);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<bool>;
        if (response.data) {
          loadCategories();
        }
      } else {
        final response = dataState as DataFailed<String>;
        emit(CategoryError(message: response.error));
      }
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  Future<void> updateCategory(CategoryEntity category) async {
    emit(CategoryLoading());
    try {
      final dataState = await _updateCategory(category);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<bool>;
        if (response.data) {
          loadCategories();
        }
      } else {
        final response = dataState as DataFailed<String>;
        emit(CategoryError(message: response.error));
      }
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  Future<void> deleteCategory(int id) async {
    emit(CategoryLoading());
    try {
      final dataState = await _deleteCategory(id);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<bool>;
        if (response.data) {
          loadCategories();
        }
      } else {
        final response = dataState as DataFailed<String>;
        emit(CategoryError(message: response.error));
      }
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  Future<void> getCategoryById(int id) async {
    emit(CategoryLoading());
    try {
      final dataState = await _getCategoryById(id);

      if (dataState is DataSuccess) {
        final response = dataState as DataSuccess<CategoryEntity>;
        emit(CategoryLoaded(categories: [response.data]));
      } else {
        final response = dataState as DataFailed<String>;
        emit(CategoryError(message: response.error));
      }
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
