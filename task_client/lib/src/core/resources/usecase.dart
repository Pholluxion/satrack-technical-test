abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

typedef NoParams = void;
