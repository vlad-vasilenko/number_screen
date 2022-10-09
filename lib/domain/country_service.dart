import 'dart:async';

import 'package:number_screen/models/country_model.dart';

class CountryService {
  CountryService.privateConstructor();

  static final CountryService _instance = CountryService.privateConstructor();

  factory CountryService() {
    return _instance;
  }

  final StreamController _pendingActionStream = StreamController.broadcast();

  /// Initialize initial current country value
  CountryModel _currentCountry = const CountryModel(countryFlag: '🇺🇦', countryCode: '+38', countryName: 'Ukraine');

  /// Returned active action stream
  Stream get actionStream => _pendingActionStream.stream;

  /// Returned selected country
  CountryModel get getCurrentCountry => _currentCountry;

  /// Set new country to common storage and add new event to stream
  set setCurrentCountry(CountryModel currentCountry) {
    _pendingActionStream.add(currentCountry);
    _currentCountry = currentCountry;
  }

  /// Close active stream
  void dispose() {
    _pendingActionStream.close();
  }
}
