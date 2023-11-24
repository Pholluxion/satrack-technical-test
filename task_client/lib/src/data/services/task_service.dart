import 'package:chopper/chopper.dart';

part 'task_service.chopper.dart';

@ChopperApi(baseUrl: '/tasks')
abstract class TaskService extends ChopperService {
  @Get()
  Future<Response> getAllTasks();

  @Get(path: '/{id}')
  Future<Response> getTaskById(@Path('id') int id);

  @Post()
  Future<Response> createTask(@Body() Map<String, dynamic> body);

  @Put(path: '/{id}')
  Future<Response> updateTask(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteTask(@Path('id') int id);

  static TaskService create({
    required String baseUrl,
    required String apiVersion,
  }) {
    final client = ChopperClient(
      baseUrl: Uri.parse('$baseUrl/$apiVersion'),
      services: [_$TaskService()],
      converter: const JsonConverter(),
    );

    return _$TaskService(client);
  }
}
