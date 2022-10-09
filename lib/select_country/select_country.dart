import 'package:flutter/cupertino.dart';
import 'package:number_screen/models/country_model.dart';
import 'package:number_screen/number_screen/number_screen_state.dart';
import 'package:number_screen/select_country/select_country_view_model.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({Key? key}) : super(key: key);

  static Widget render() {
    return ChangeNotifierProvider(
      create: (context) => SelectCountryViewModel(context: context),
      child: const SelectCountry(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SelectCountryViewModel viewModel = context.read<SelectCountryViewModel>();
    final NumberScreenState state = context.select((SelectCountryViewModel viewModel) => viewModel.state);
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(103, 101, 204, 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Text(
                'Country code',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navLargeTitleTextStyle
                    .merge(const TextStyle(color: CupertinoColors.white)),
              ),
              const Spacer(),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.clear_thick_circled, color: CupertinoColors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          CupertinoSearchTextField(
            decoration: BoxDecoration(
              color: CupertinoColors.white.withOpacity(.4),
              borderRadius: BorderRadius.circular(8.0),
            ),
            controller: viewModel.searchController,
            onChanged: (searchedValue) => viewModel.search(searchedValue: searchedValue),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  state.isSearching ? state.filteredCountries!.length : state.countries.length,
                  (index) {
                    CountryModel country = state.isSearching ? state.filteredCountries![index] : state.countries[index];
                    return CupertinoButton(
                      onPressed: () => viewModel.onTap(country: country),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              country.countryFlag,
                              style: CupertinoTheme.of(context).textTheme.pickerTextStyle,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              country.countryCode,
                              style: const TextStyle(color: CupertinoColors.black),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              country.countryName,
                              style: const TextStyle(color: CupertinoColors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
