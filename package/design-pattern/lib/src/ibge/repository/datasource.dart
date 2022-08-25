abstract class Datasource {
  Future<List<dynamic>> getStates();
  Future<List<dynamic>> getCitiesByUf(String uf);
}
