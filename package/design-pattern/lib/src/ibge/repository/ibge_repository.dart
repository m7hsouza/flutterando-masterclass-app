import 'package:design_pattern/src/ibge/model/city_model.dart';
import 'package:design_pattern/src/ibge/model/uf_model.dart';
import 'package:design_pattern/src/ibge/repository/remote_datasource.dart';

class IBGERepository {
  IBGERepository(this._remoteDatasource);

  final RemoteDatasource _remoteDatasource;

  Future<List<UfModel>> findAllUfs() async {
    var listMap = await _remoteDatasource.getStates();

    return listMap.map((e) => UfModel.fromMap(e)).toList();
  }

  Future<List<CityModel>> findCitiesByUf(String uf) async {
    var listMap = await _remoteDatasource.getCitiesByUf(uf);

    return listMap.map((e) => CityModel.fromMap(e)).toList();
  }
}
