import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarDeclined extends StatefulWidget {
  const BarDeclined({super.key});

  @override
  State<BarDeclined> createState() => _BarDeclinedState();
}

class _BarDeclinedState extends State<BarDeclined> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 551,
      color: ThemeColors().white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      width: 487,
      constraints: const BoxConstraints(minHeight: 902),
      decoration: BoxDecoration(
        color: ThemeColors().background,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildRecordInfo(),
            const SizedBox(height: 8),
            _buildStatusBox(),
            const SizedBox(height: 24),
            _buildReasonRow("เหตุผล : ", "ผู้ป่วยยกเลิกนัดหมาย"),
            const SizedBox(height: 8),
            _buildReasonRow("เหตุผล : ", "หมายเหตุ"),
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
          color: ThemeColors().lightBlue60,
        ),
        const SizedBox(width: 8),
        Text(
          "ผลการประเมินเคส",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ThemeColors().lightBlue60,
          ),
        ),
      ],
    );
  }

  Widget _buildRecordInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "วันที่บันทึก : 16/11/2024",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ThemeColors().gray50,
          ),
        ),
        Text(
          "ผู้บันทึก : สุขสันต์ วงค์สว่าง",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ThemeColors().gray50,
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
        color: ThemeColors().red70,
      ),
      child: Center(
        child: Text(
          "ไม่สามารถเดินทางได้",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: ThemeColors().white,
          ),
        ),
      ),
    );
  }

  Widget _buildReasonRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ThemeColors().lightBlue60,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ThemeColors().gray30,
          ),
        ),
      ],
    );
  }
}