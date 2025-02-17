import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class Case2Page extends StatefulWidget {
  const Case2Page({super.key});

  @override
  State<Case2Page> createState() => _Case2PageState();
}

class _Case2PageState extends State<Case2Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Case_2_Page",
      style: TextStyle(fontSize: 32, color: colorsApp.blue50),
    ));
  }
}
