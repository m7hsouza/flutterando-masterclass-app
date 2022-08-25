import 'package:design_pattern/src/correios/model/address_model.dart';
import 'package:uno/uno.dart';

class AddressService {
  AddressService(this._uno);

  final Uno _uno;

  Future<AddressModel> findByZipCode(String zipcode) async {
    final response = await _uno.get('https://viacep.com.br/ws/$zipcode/json/');

    return AddressModel.fromMap(response.data);
  }
}
