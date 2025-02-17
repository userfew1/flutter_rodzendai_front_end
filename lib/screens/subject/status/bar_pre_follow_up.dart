import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarPreFollowUp extends StatefulWidget {
  const BarPreFollowUp({super.key});

  @override
  State<BarPreFollowUp> createState() => _BarPreFollowUpState();
}

class _BarPreFollowUpState extends State<BarPreFollowUp> {
  String? _selectedValue;
  String _selectedTextValue = "";

  final List<String> _items = [
    "เบอร์โทร",
    "ที่อยู่",
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 551,
      color: colorsApp.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 487,
              constraints: const BoxConstraints(minHeight: 902),
              decoration: BoxDecoration(
                color: colorsApp.background,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 8),
                        _buildStatusBox(),
                        const SizedBox(height: 24),
                        _buildContainer(),
                      ],
                    ),
                    _buildButton("ดำเนินการ", ThemeColors().lightBlue65,
                        ThemeColors().white, false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      width: 439,
      height: 214,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons_detali/money.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text("ข้อมูลการติดต่อ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors().lightBlue60,
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 408,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: BoxDecoration(
                color: ThemeColors().background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedTextValue.isEmpty ? null : _selectedTextValue,
                  hint: Text(
                    "เลือกข้อมูลการติดต่อ",
                    style: TextStyle(
                      color: ThemeColors().gray70,
                      fontSize: 16,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons_detali/drop.svg',
                    height: 24,
                    width: 24,
                  ),
                  dropdownColor: ThemeColors().background,
                  style: TextStyle(
                    color: ThemeColors().lightBlue60,
                    fontSize: 16,
                  ),
                  items: _items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: ThemeColors().lightBlue60,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTextValue = newValue!;
                    });
                  },
                ),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons_detali/inspection.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "ผลการนัดหมาย",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors().lightBlue60),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: "ยืนยันนัดหมาย",
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                      ),
                      Text(
                        "ยืนยันนัดหมาย",
                        style: TextStyle(
                          fontSize: 16,
                          color: "ยืนยันนัดหมาย" == _selectedValue
                              ? ThemeColors().lightBlue60
                              : ThemeColors().gray70,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: "ยกเลิกนัดหมาย",
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                      ),
                      Text(
                        "ยกเลิกนัดหมาย",
                        style: TextStyle(
                          fontSize: 16,
                          color: "ยกเลิกนัดหมาย" == _selectedValue
                              ? ThemeColors().lightBlue60
                              : ThemeColors().gray70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons_detali/inspection.svg',
          height: 24,
          width: 24,
          // ignore: deprecated_member_use
          color: colorsApp.lightBlue60,
        ),
        const SizedBox(width: 8),
        Text(
          "การติดตามนัดหมายล่วงหน้า 1 วัน",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colorsApp.lightBlue60,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBox() {
    return Container(
      height: 80,
      width: 439,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorsApp.blue50,
      ),
      child: Center(
        child: Text(
          "ติดตามล่วงหน้า",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: colorsApp.white,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
          String text, Color bgColor, Color textColor, bool isOutlined) =>
      GestureDetector(
        onTap: () {},
        child: Container(
          width: 439,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bgColor,
            border: isOutlined
                ? Border.all(color: ThemeColors().lightBlue70, width: 1)
                : null,
          ),
          child: Center(
            child: Text(text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: textColor)),
          ),
        ),
      );
}
