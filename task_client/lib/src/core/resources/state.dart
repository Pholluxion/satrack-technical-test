abstract class DataState<T> {}

final class DataSuccess<T> extends DataState<T> {
  final T data;
  DataSuccess(this.data);
}

final class DataFailed<T> extends DataState<T> {
  final String error;
  DataFailed(this.error);
}
