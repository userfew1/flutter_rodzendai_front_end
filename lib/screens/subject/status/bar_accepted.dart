import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarAccepted extends StatelessWidget {
  const BarAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 551,
      color: ThemeColors().white,
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
                  color: ThemeColors().background,
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
                    _buildHeader(),
                    _buildCaseDetails(),
                    _buildCurrentStatus(),
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
            color: ThemeColors().lightBlue60,
          ),
          const SizedBox(width: 8),
          Text("ผลการประเมินเคส",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors().lightBlue60)),
        ],
      );

  Widget _buildCaseDetails() => Column(
        children: [
          _buildDetailRow("วันที่บันทึก :", "16/11/2024"),
          _buildDetailRow("ผู้บันทึก :", "สุขสันต์ วงค์สว่าง"),
          _buildStatusBox("สามารถเดินทางได้"),
          _buildDetailRow("เบิกงบประมาณ :", "กองทุนท้องถิ่น (กปท.)"),
          _buildDetailRow("ประเภทรถรับส่ง :", "รถแท็กซี่"),
          _buildDetailRow("ชื่อหน่วยบริการรับส่ง :", "Bolt"),
          _buildDetailRow("รูปแบบการเดินทาง :", "แบบต่อเดียว"),
          _buildDetailRow("ลิงก์กูเกิลแมป :", "-"),
          _buildDetailRow("วันที่ให้บริการ :", "12/02/2568"),
          _buildDetailRow("ระยะทาง (กม.) :", "12 กม."),
          _buildDetailRow("เวลาออกจากจุดรับผู้ป่วย :", "10.00 น."),
          _buildDetailRow("เวลาถึงจุดส่งผู้ป่วย :", "13.00 น."),
          Divider(color: ThemeColors().lightBlue65, thickness: 1),
        ],
      );

  Widget _buildCurrentStatus() => Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons_detali/status.svg',
                  height: 24, width: 24, color: ThemeColors().lightBlue60),
              const SizedBox(width: 8),
              Text("สถานะการดำเนินงานปัจจุบัน",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ThemeColors().lightBlue60)),
            ],
          ),
          const SizedBox(height: 16),
          _buildStatusRow("ขาไป :", "รอมอบหมาย", ThemeColors().lightBlue70),
          _buildStatusRow("ขากลับ :", "ยังไม่มีข้อมูล", ThemeColors().gray70),
        ],
      );

  Widget _buildActionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton("ยกเลิกการดำเนินการ", ThemeColors().white,
              ThemeColors().lightBlue70, true),
          _buildButton("ดำเนินการ", ThemeColors().lightBlue65,
              ThemeColors().white, false),
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
                    color: ThemeColors().lightBlue60)),
            Text(value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors().gray30)),
          ],
        ),
      );

  Widget _buildStatusBox(String text) => Container(
        height: 80,
        width: 439,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ThemeColors().green50),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: ThemeColors().white)),
        ),
      );

  Widget _buildStatusRow(String label, String status, Color color) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors().lightBlue60)),
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
                      color: ThemeColors().white)),
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
