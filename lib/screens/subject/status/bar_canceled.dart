import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarCanceled extends StatefulWidget {
  const BarCanceled({super.key});

  @override
  State<BarCanceled> createState() => _BarCanceledState();
}

class _BarCanceledState extends State<BarCanceled> {

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
      height: 548,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        child: Column(
          children: [
            _buildDetailRow(
                "assets/icons/Logo.svg", "วันที่บันทึก :", "16/11/2024"),
            const SizedBox(height: 12),
            _buildDetailRow("assets/icons/Logo.svg", "ผู้บันทึกข้อมูล :",
                "สุขสันต์ วงค์สว่าง"),
            const SizedBox(height: 12),
            _buildDetailRow("assets/icons/Logo.svg", "หมายเหตุ :",
                "ไม่สามารถติดต่อผู้โดยสารได้"),
            const SizedBox(height: 12),
            _buildDetailRow(
                "assets/icons/Logo.svg", "ค่าใช้จ่ายทีเกิดขึ้น :", "659"),
            const SizedBox(height: 12),
            _buildDetailRow("assets/icons/Logo.svg", "หลักฐาน :", ""),
            const SizedBox(height: 12),
             Container(
              width: 439,
              height: 260,
              decoration: BoxDecoration(
                color: colorsApp.blue75,
                borderRadius: BorderRadius.circular(8)
              ),
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
        color: colorsApp.gray70,
      ),
      child: Center(
        child: Text(
          "ยกเลิก",
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
