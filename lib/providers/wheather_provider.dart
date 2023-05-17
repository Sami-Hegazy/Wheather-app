import 'package:flutter/material.dart';
import 'package:whether_app/models/wheather_model.dart';

class WheatherProvider extends ChangeNotifier {
  WheatherModel? _wheatherData;
  String? cityName;
  WheatherModel? get wheatherData => _wheatherData;

  set wheatherData(WheatherModel? value) {
    _wheatherData = value;
    notifyListeners();
  }
}
