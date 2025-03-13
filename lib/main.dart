import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/screens/main_screens_page.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// >
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansThai',
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return colorsApp.lightBlue60;
            }
            return colorsApp.gray70;
          }),
        ),
      ),
      home: const MainScreensPage(),
      navigatorObservers: [routeObserver],
    );
  }
}
