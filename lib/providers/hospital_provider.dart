import 'package:flutter/material.dart';
import 'package:nearby_health_service/models/hospital_model.dart';
import 'package:nearby_health_service/services/api_service.dart';

enum ResultState {
  none,
  loading,
  error,
}

class HospitalProvider extends ChangeNotifier {
  ApiService apiService = ApiService();

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  List<HospitalModel> _hospital = [];
  List<HospitalModel> get hospital => _hospital;

  void getNearbyHospitals() async {
    _state = ResultState.loading;
    try {
      final response = await apiService.hospitalList();
      _hospital = response;
      notifyListeners();
      _state = ResultState.none;
    } catch (e) {
      _state = ResultState.error;
    }
  }
}
