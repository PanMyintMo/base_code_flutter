abstract class BaseUsecase <Types, Params>{
  Future<Type> call(Params params);

}