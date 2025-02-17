import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "SchedulePage",
      style: TextStyle(fontSize: 32, color: colorsApp.blue50),
    ));
  }
}
