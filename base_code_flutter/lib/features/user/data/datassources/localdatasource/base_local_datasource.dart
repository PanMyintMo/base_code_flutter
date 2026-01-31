abstract class BaseLocalDatasource <T>{
  Future<void> save(String key,dynamic data);
  Future<T?> get(String key);
  Future<void> delete(String key);
}