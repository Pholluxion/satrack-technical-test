import 'package:chopper/chopper.dart';

part 'category_service.chopper.dart';

@ChopperApi(baseUrl: '/categories')
abstract class CategoryService extends ChopperService {
  @Get()
  Future<Response> getAllCategories();

  @Get(path: '/{id}')
  Future<Response> getCategoryById(@Path('id') int id);

  @Post()
  Future<Response> createCategory(@Body() Map<String, dynamic> body);

  @Put(path: '/{id}')
  Future<Response> updateCategory(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteCategory(@Path('id') int id);

  static CategoryService create({
    required String baseUrl,
    required String apiVersion,
  }) {
    final client = ChopperClient(
      baseUrl: Uri.parse('$baseUrl/$apiVersion'),
      services: [_$CategoryService()],
      converter: const JsonConverter(),
    );

    return _$CategoryService(client);
  }
}
