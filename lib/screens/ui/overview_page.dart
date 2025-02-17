import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Overview",
      style: TextStyle(fontSize: 32, color: colorsApp.blue50),
    ));
  }
}
