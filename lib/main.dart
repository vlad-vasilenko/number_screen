import 'package:flutter/cupertino.dart';
import 'package:number_screen/number_screen/number_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(debugShowCheckedModeBanner: false, home: NumberScreen.render());
  }
}
