import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class ExpenseReportPage extends StatefulWidget {
  const ExpenseReportPage({super.key});

  @override
  State<ExpenseReportPage> createState() => _ExpenseReportPageState();
}

class _ExpenseReportPageState extends State<ExpenseReportPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "ExpenseReportPage",
      style: TextStyle(fontSize: 32, color: colorsApp.blue50),
    ));
  }
}
