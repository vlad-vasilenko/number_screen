import 'package:flutter/cupertino.dart';
import 'package:number_screen/number_screen/number_screen_state.dart';
import 'package:number_screen/number_screen/number_view_model.dart';
import 'package:number_screen/select_country/select_country.dart';
import 'package:provider/provider.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  static Widget render() {
    return ChangeNotifierProvider(
      create: (context) => NumberScreenViewModel(),
      child: const NumberScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NumberScreenViewModel viewModel = context.read<NumberScreenViewModel>();
    final NumberScreenState state = context.select((NumberScreenViewModel viewModel) => viewModel.state);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemIndigo,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              Text(
                'Get started',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navLargeTitleTextStyle
                    .merge(const TextStyle(color: CupertinoColors.white)),
              ),
              const Spacer(),
              Center(
                child: Row(
                  children: [
                    CupertinoButton(
                      color: CupertinoColors.white.withOpacity(.4),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            state.currentCountry.countryFlag,
                            style: CupertinoTheme.of(context).textTheme.pickerTextStyle,
                          ),
                          const SizedBox(width: 8),
                          Text(state.currentCountry.countryCode),
                        ],
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                          useRootNavigator: true,
                          routeSettings: const RouteSettings(),
                          context: context,
                          builder: (builder) => SelectCountry.render(),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CupertinoTextField(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: CupertinoColors.white.withOpacity(.4),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onChanged: (value) => viewModel.onNumberPrint(value: value),
                        controller: viewModel.textController,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  color: CupertinoColors.white.withOpacity(.4),
                  onPressed: state.currentNumber!.isEmpty ? null : () {},
                  child: const Icon(CupertinoIcons.arrow_right),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
