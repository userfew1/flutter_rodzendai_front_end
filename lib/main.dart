import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/screens/screens_page.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansThai', // กำหนดฟอนต์ให้ทั้งแอป
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return ThemeColors().lightBlue60; // สีเมื่อเลือกแล้ว
            }
            return ThemeColors().gray70; // สีเมื่อยังไม่ได้เลือก
          }),
        ),
      ),
      home: ScreensPage(),
      navigatorObservers: [routeObserver], // ✅ เพิ่ม observer
    );
  }
}
