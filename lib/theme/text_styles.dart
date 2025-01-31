import 'package:flutter/material.dart';

class ThemeTextStyles {
  // Body Text
  TextStyle body12_14({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black, // เพิ่ม default color
  }) =>
      TextStyle(
        fontSize: 12,
        height: 14 / 12,
        fontWeight: fontWeight,
        color: color, // ใช้ color
        decoration: TextDecoration.none,
      );

  TextStyle body14_18({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 14,
        height: 18 / 14,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle body16_18({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 16,
        height: 18 / 16,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle body16_22({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 16,
        height: 22 / 16,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle body16_32({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 16,
        height: 32 / 16,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  // Headings
  TextStyle head12({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 12,
        height: 18 / 12,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle head14({
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 14,
        height: 18 / 14,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle head16_18({
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 16,
        height: 18 / 16,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle head20_24({
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 20,
        height: 24 / 20,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle head24_32({
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );

  TextStyle head32_40({
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none,
      );
}
