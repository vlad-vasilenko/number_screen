import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:number_screen/domain/country_service.dart';
import 'package:number_screen/models/country_model.dart';
import 'package:number_screen/number_screen/number_screen_state.dart';

class NumberScreenViewModel extends ChangeNotifier {
  final CountryService _countryService = CountryService();
  final TextEditingController _textEditingController = TextEditingController();

  TextEditingController get textController => _textEditingController;

  String get currentNumber => _textEditingController.text;

  NumberScreenState _state = const NumberScreenState(
    currentCountry: CountryModel(countryFlag: '🇺🇦', countryCode: '+38', countryName: 'Ukraine'),
    countries: [],
  );

  NumberScreenState get state => _state;

  late StreamSubscription _actionStreamSubscription;

  NumberScreenViewModel() {
    _actionStreamSubscription = _countryService.actionStream.listen((event) => initialize());
    initialize();
  }

  void initialize() {
    _state = _state.copyWith(isSearching: false, currentCountry: _countryService.getCurrentCountry, currentNumber: '');
    notifyListeners();
  }

  void onNumberPrint({required String value}) {
    _state = _state.copyWith(currentNumber: value);
    notifyListeners();
  }

  @override
  void dispose() {
    _actionStreamSubscription.cancel();
    super.dispose();
  }
}
