import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/data/data.dart';
import 'package:task_client/src/data/repositories/task_repository_impl.dart';
import 'package:task_client/src/domain/domain.dart';
import 'package:task_client/src/presentation/features/features.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Dependencies
  getIt.registerSingleton<TaskService>(
    TaskService.create(
      baseUrl: Env.baseUrl,
      apiVersion: Env.apiVersion,
    ),
  );

  getIt.registerSingleton<CategoryService>(
    CategoryService.create(
      baseUrl: Env.baseUrl,
      apiVersion: Env.apiVersion,
    ),
  );

  getIt.registerSingleton<TaskRepository>(
    TaskRepositoryImpl(
      taskService: getIt(),
    ),
  );

  getIt.registerSingleton<CategoryRepository>(
    CategoryRepositopryImpl(
      categoryService: getIt(),
    ),
  );

  // SharedPreferences
  getIt.registerLazySingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  await getIt.isReady<SharedPreferences>();
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(getIt()),
  );

  //UseCases
  getIt.registerSingleton<GetAllCategories>(GetAllCategories(getIt()));
  getIt.registerSingleton<GetCategoryById>(GetCategoryById(getIt()));
  getIt.registerSingleton<CreateCategory>(CreateCategory(getIt()));
  getIt.registerSingleton<UpdateCategory>(UpdateCategory(getIt()));
  getIt.registerSingleton<DeleteCategory>(DeleteCategory(getIt()));

  getIt.registerSingleton<GetAllTasks>(GetAllTasks(getIt()));
  getIt.registerSingleton<GetTaskById>(GetTaskById(getIt()));
  getIt.registerSingleton<CreateTask>(CreateTask(getIt()));
  getIt.registerSingleton<UpdateTask>(UpdateTask(getIt()));
  getIt.registerSingleton<DeleteTask>(DeleteTask(getIt()));

  // Blocs
  getIt.registerFactory<TaskCubit>(
    () => TaskCubit(
      getIt.get(),
      getIt.get(),
      getIt.get(),
      getIt.get(),
      getIt.get(),
    ),
  );

  getIt.registerFactory<CategoryCubit>(
    () => CategoryCubit(
      getIt.get(),
      getIt.get(),
      getIt.get(),
      getIt.get(),
      getIt.get(),
    ),
  );
}
