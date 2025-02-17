import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarPendingProcess extends StatelessWidget {
  const BarPendingProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 551,
      color: colorsApp.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: 487,
                constraints: const BoxConstraints(minHeight: 902),
                decoration: BoxDecoration(
                  color: colorsApp.background,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _buildHeader(),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildStatusBox("รอดำเนินการ"),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: 439,
                          height: 336,
                          decoration: BoxDecoration(
                              color: colorsApp.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  width: 1, color: colorsApp.lightBlue70)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: _buildCaseDetails(),
                          ),
                        ),
                      ],
                    ),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() => Row(
        children: [
          SvgPicture.asset(
            'assets/icons_detali/inspection.svg',
            height: 24,
            width: 24,
            color: colorsApp.lightBlue60,
          ),
          const SizedBox(width: 8),
          Text("ข้อมูลการมอบหมายงาน",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colorsApp.lightBlue60)),
        ],
      );

  Widget _buildCaseDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ข้อมูลคัดกรองเคส",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: colorsApp.lightBlue60),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "วันที่บันทึก : 16/11/2024      ผู้บันทึก : สุขสันต์ วงค์สว่าง",
            style: TextStyle(fontSize: 14, color: colorsApp.gray50),
          ),
          _buildDetailRow("เบิกงบประมาณ :", "กองทุนท้องถิ่น (กปท.)"),
          _buildDetailRow("ประเภทรถรับส่ง :", "รถแท็กซี่"),
          _buildDetailRow("ชื่อหน่วยบริการรับส่ง :", "Bolt"),
          _buildDetailRow("รูปแบบการเดินทาง :", "แบบต่อเดียว"),
          _buildDetailRow("ลิงก์กูเกิลแมป :", "-"),
          _buildDetailRow("วันที่ให้บริการ :", "12/02/2568"),
          _buildDetailRow(
              "เวลาออกจากจุดรับ - ถึงจุดส่ง :", "10.00 น. 13.00 น."),
          _buildDetailRow("ระยะทาง (กม.) :", "12 กม."),
        ],
      );
  Widget _buildDetailRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: colorsApp.lightBlue60)),
            Text(value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: colorsApp.gray30)),
          ],
        ),
      );

  Widget _buildActionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton("ยกเลิกการดำเนินการ", colorsApp.white,
              colorsApp.lightBlue70, true),
          _buildButton(
              "แก้ไขข้อมูล", colorsApp.lightBlue65, colorsApp.white, false),
        ],
      );

  Widget _buildStatusBox(String text) => Container(
        height: 80,
        width: 439,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: colorsApp.orange60),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: colorsApp.white)),
        ),
      );

  Widget _buildStatusRow(String label, String status, Color color) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: colorsApp.lightBlue60)),
          Container(
            width: 113,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), color: color),
            child: Center(
              child: Text(status,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: colorsApp.white)),
            ),
          ),
        ],
      );

  Widget _buildButton(
          String text, Color bgColor, Color textColor, bool isOutlined) =>
      GestureDetector(
        onTap: () {},
        child: Container(
          width: isOutlined ? 219 : 196,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bgColor,
            border: isOutlined
                ? Border.all(color: colorsApp.lightBlue70, width: 1)
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
