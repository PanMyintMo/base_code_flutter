abstract class RemoteDatasource<T> {
  Future<T> get(String path);
  Future<List<T>> getAll(String path);
}