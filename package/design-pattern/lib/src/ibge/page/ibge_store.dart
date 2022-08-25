import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:design_pattern/src/ibge/model/city_model.dart';
import 'package:design_pattern/src/ibge/model/uf_model.dart';
import 'package:design_pattern/src/ibge/repository/ibge_repository.dart';

enum IBGEStates { idle, loading, success, error }

class IBGEStore extends ChangeNotifier {
  IBGEStore(this._repository);

  final IBGERepository _repository;

  IBGEStates _state = IBGEStates.idle;
  IBGEStates get state => _state;

  final List<UfModel> _ufs = [];
  UnmodifiableListView<UfModel> get ufs => UnmodifiableListView(_ufs);

  final List<CityModel> _cities = [];
  UnmodifiableListView<CityModel> get cities => UnmodifiableListView(_cities);

  Future<void> loadAllUfs() async {
    try {
      _state = IBGEStates.loading;
      notifyListeners();
      _ufs.clear();

      var ufs = await _repository.findAllUfs();

      _ufs.addAll(ufs);
      _state = IBGEStates.idle;
      notifyListeners();
    } catch (e) {
      _state = IBGEStates.error;
      notifyListeners();
    }
  }

  Future<void> findCitiesByUf(String uf) async {
    try {
      _state = IBGEStates.loading;
      notifyListeners();
      _cities.clear();

      var cities = await _repository.findCitiesByUf(uf);

      _cities.addAll(cities);
      _state = IBGEStates.success;
      notifyListeners();
    } catch (e) {
      _state = IBGEStates.error;
      notifyListeners();
    }
  }
}
