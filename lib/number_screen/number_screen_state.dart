import 'package:flutter/cupertino.dart';
import 'package:number_screen/models/country_model.dart';

@immutable
class NumberScreenState {
  final CountryModel currentCountry;
  final List<CountryModel> countries;
  final List<CountryModel>? filteredCountries;
  final bool isSearching;
  final String? currentNumber;

  const NumberScreenState({
    required this.currentCountry,
    required this.countries,
    this.filteredCountries,
    this.isSearching = false,
    this.currentNumber,
  });

  NumberScreenState copyWith({
    CountryModel? currentCountry,
    List<CountryModel>? countries,
    List<CountryModel>? filteredCountries,
    bool? isSearching,
    String? currentNumber,
  }) {
    return NumberScreenState(
      currentCountry: currentCountry ?? this.currentCountry,
      countries: countries ?? this.countries,
      filteredCountries: filteredCountries ?? this.filteredCountries,
      isSearching: isSearching ?? this.isSearching,
      currentNumber: currentNumber ?? this.currentNumber,
    );
  }
}