import 'package:flutter/material.dart';

import 'package:design_pattern/src/correios/model/address_model.dart';
import 'package:design_pattern/src/correios/service/address_service.dart';

enum StoreState { idle, success, loading, error }

class AddressStore extends ChangeNotifier {
  AddressStore(this._service);

  final AddressService _service;

  StoreState _state = StoreState.idle;
  StoreState get state => _state;

  String _zipCode = '';
  String get zipcode => _zipCode;

  AddressModel? _address;
  AddressModel? get address => _address;

  void changeZipCode(String zipcCode) => _zipCode = zipcCode;

  Future<void> findAddressByZipCode() async {
    if (_zipCode.isEmpty || _zipCode.length < 8) return;

    try {
      _state = StoreState.loading;
      notifyListeners();

      _address = await _service.findByZipCode(_zipCode);
      _state = StoreState.success;
      notifyListeners();
    } catch (e) {
      _state = StoreState.error;
      notifyListeners();
    }
  }
}
