import 'package:flutter/cupertino.dart';
import 'package:number_screen/domain/country_service.dart';
import 'package:number_screen/models/country_model.dart';
import 'package:number_screen/number_screen/number_screen_state.dart';

class SelectCountryViewModel extends ChangeNotifier {
  final BuildContext context;
  final CountryService _countryService = CountryService();
  final TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;
  final List<CountryModel> _countries = <CountryModel>[
    const CountryModel(countryFlag: '🇺🇦', countryCode: '+38', countryName: 'Ukraine'),
    const CountryModel(countryFlag: '🇺🇸', countryCode: '+10', countryName: 'United States of America'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
    const CountryModel(countryFlag: '🇨🇦', countryCode: '+1', countryName: 'Canada'),
  ];

  NumberScreenState _state = const NumberScreenState(
      currentCountry: CountryModel(countryFlag: '🇺🇦', countryCode: '+38', countryName: 'Ukraine'), countries: []);

  NumberScreenState get state => _state;

  SelectCountryViewModel({required this.context}) {
    _state = _state.copyWith(isSearching: false, countries: _countries);
    notifyListeners();
  }

  void search({required String searchedValue}) {
    if (searchedValue.isEmpty) {
      _searchController.clear();
      _state = _state.copyWith(filteredCountries: _state.countries);
      return notifyListeners();
    }

    List<CountryModel> filtered = _countries.where((c) {
      bool byCode = c.countryCode.contains(RegExp(searchedValue, caseSensitive: false));
      bool byName = c.countryName.toString().toUpperCase().contains(searchedValue.toUpperCase());
      if (byCode || byName) return true;
      return false;
    }).toList();
    _state = _state.copyWith(isSearching: true, filteredCountries: filtered);
    notifyListeners();
  }

  void cancelSearchWidgets() {
    _searchController.text = '';
    _state = _state.copyWith(isSearching: false, filteredCountries: []);
    notifyListeners();
  }

  void onTap({required CountryModel country}) {
    _countryService.setCurrentCountry = country;
    Navigator.of(context).pop();
  }
}
