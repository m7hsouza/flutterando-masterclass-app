import 'package:design_pattern/src/ibge/repository/datasource.dart';
import 'package:uno/uno.dart';

class RemoteDatasource implements Datasource {
  final _uno = Uno();

  @override
  Future<List> getStates() async {
    var response = await _uno.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados');

    return response.data;
  }

  @override
  Future<List> getCitiesByUf(String uf) async {
    var response = await _uno.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/municipios');

    return response.data;
  }
}
