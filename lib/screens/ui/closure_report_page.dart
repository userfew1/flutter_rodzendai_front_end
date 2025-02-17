import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class ClosureReportPage extends StatefulWidget {
  const ClosureReportPage({super.key});

  @override
  State<ClosureReportPage> createState() => _ClosureReportPageState();
}

class _ClosureReportPageState extends State<ClosureReportPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "ClosureReportPage",
      style: TextStyle(fontSize: 32, color: colorsApp.blue50),
    ));
  }
}
