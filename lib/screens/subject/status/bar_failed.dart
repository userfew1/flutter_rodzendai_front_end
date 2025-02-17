import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarFailed extends StatefulWidget {
  const BarFailed({super.key});

  @override
  State<BarFailed> createState() => _BarFailedState();
}

class _BarFailedState extends State<BarFailed> {
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
                        const SizedBox(height: 24),
                        _buildStatusBox(),
                        const SizedBox(height: 24),
                        _buildContainerOne(),
                        const SizedBox(height: 24),
                        _buildContainer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContainerOne() {
    return Container(
      width: 439,
      height: 168,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        child: Column(
          children: [
            _buildDetailRow(
                "assets/icons/Logo.svg", "ข้อมูลทะเบียนรถ", "ขส 1234"),
            const SizedBox(height: 12),
            _buildDetailRow("assets/icons/Logo.svg",
                "ชื่อ-นามสกุล (ผู้ให้บริการขับรถ)", "ทดสอบ จิตแจ่มใส"),
            const SizedBox(height: 12),
            _buildDetailRow(
                "assets/icons/Logo.svg", "ค่าใช้จ่ายในการเดินทาง", "-"),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      width: 439,
      height: 500,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        child: Column(
          children: [
            _buildDetailRow(
                "assets/icons/Logo.svg", "ข้อมูลทะเบียนรถ", "ขส 1234"),
            const SizedBox(height: 12),
            _buildDetailRow("assets/icons/Logo.svg",
                "ชื่อ-นามสกุล (ผู้ให้บริการขับรถ)", "ทดสอบ จิตแจ่มใส"),
            const SizedBox(height: 12),
            _buildDetailRow(
                "assets/icons/Logo.svg", "ค่าใช้จ่ายในการเดินทาง", "-"),
            const SizedBox(height: 12),
            _buildDetailRow("assets/icons/Logo.svg", "หลักฐาน :", ""),
            const SizedBox(height: 12),
            Container(
              width: 439,
              height: 260,
              decoration: BoxDecoration(
                  color: colorsApp.blue75,
                  borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String img, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  img,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(label,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors().lightBlue60)),
              ],
            ),
            Text(value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors().gray30)),
          ],
        ),
      );

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
          "ข้อมูลการดำเนินการ",
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
        color: colorsApp.red80,
      ),
      child: Center(
        child: Text(
          "ไม่สำเร็จ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: colorsApp.white,
          ),
        ),
      ),
    );
  }
}
