import 'package:flutter/cupertino.dart';

@immutable
class CountryModel {
  final String countryFlag;
  final String countryCode;
  final String countryName;

  const CountryModel({
    required this.countryFlag,
    required this.countryCode,
    required this.countryName,
  });

  @override
  String toString() {
    return 'CountryModel{countryFlag: $countryFlag, countryCode: $countryCode, countryName: $countryName}';
  }
}
