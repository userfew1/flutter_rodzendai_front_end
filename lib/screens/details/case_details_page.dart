import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rodzendai_front_end/screens/details/widget/build_sidebar_wait.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_rodzendai_front_end/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';

class CaseDataListPState extends StatefulWidget {
  final String jobNumber;
  final VoidCallback onBackPressed; // เพิ่ม Callback สำหรับปุ่ม "กลับ"

  CaseDataListPState({
    Key? key,
    required this.jobNumber,
    required this.onBackPressed, // ต้องรับค่ามาด้วย
  }) : super(key: key);

  @override
  State<CaseDataListPState> createState() => _CaseDataListPStateState();
}

class _CaseDataListPStateState extends State<CaseDataListPState> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ กล่องเมนูหลัก (เลื่อนได้)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              // ✅ เพิ่ม Scroll ให้กับ Column
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildTitleRow(),
                  const SizedBox(height: 16),
                  _buildMainContainer(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInfoContainer(
                        title: "ข้อมูลนัดหมาย",
                        details: [
                          _buildDetailRow("วันที่และเวลานัดหมาย : ",
                              "12/02/2568 (13.00 น.)"),
                          _buildDetailRow("ชื่อโรงพยาบาล : ", "092 3565412"),
                          _buildDetailRow("แนบเอกสารใบนัด : ", "ดูข้อมูล",
                              underline: true),
                        ],
                      ),
                      SizedBox(width: 16),
                      _buildInfoContainer(
                        title: "ข้อมูลผู้แจ้ง / ผู้ติดต่อ",
                        details: [
                          _buildDetailRow(
                              "ชื่อ - นามสกุล : ", "ธิดาพร ยิ่งงาม"),
                          _buildDetailRow("ความสัมพันธ์ : ", "ญาติ"),
                          _buildDetailRow("เบอร์โทรติดต่อ : ", "092 3565412"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInfoContainer(
                        title: "ข้อมูลผู้ติดตามลำดับที่ 1",
                        details: [
                          _buildDetailRow(
                              "ชื่อ - นามสกุล : ", "ธิดาพร ยิ่งงาม"),
                          _buildDetailRow("ความสัมพันธ์ : ", "ญาติ"),
                          _buildDetailRow("เบอร์โทรติดต่อ : ", "092 3565412"),
                        ],
                      ),
                      SizedBox(width: 16),
                      _buildInfoContainer(
                        title: "ข้อมูลผู้ติดตามลำดับที่ 2",
                        details: [
                          _buildDetailRow(
                              "ชื่อ - นามสกุล : ", "ธิดาพร ยิ่งงาม"),
                          _buildDetailRow("ความสัมพันธ์ : ", "ญาติ"),
                          _buildDetailRow("เบอร์โทรติดต่อ : ", "092 3565412"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildLargeContainer(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),

        // ✅ Sidebar (ด้านขวา)
        BuildSideBarWait(),
      ],
    );
  }

  Widget _buildInfoContainer(
      {required String title, required List<Widget> details}) {
    return Container(
      width: 364.5,
      height: 156,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        border: Border.all(
          color: ThemeColors().lightBlue70,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors().lightBlue60,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ...details,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool underline = false}) {
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
            color: underline ? ThemeColors().lightBlue60 : ThemeColors().gray30,
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
            decorationColor: underline ? ThemeColors().lightBlue60 : null,
          ),
        ),
      ],
    );
  }

  // ✅ ฟังก์ชันแยก Widget
  Widget _buildTitleRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onBackPressed, // ✅ เรียกใช้ Callback โดยตรง
          child: SvgPicture.asset(
            'assets/icons/dropdown.svg',
            height: 32,
            width: 32,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text("ปิยะพัทธ์ ยิ่งงาม",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ThemeColors().lightBlue60,
              )),
        ),
        Row(
          children: [
            Text("วันที่บันทึก : 16/11/2024",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors().gray50,
                )),
            Text("ผู้บันทึก : สุขสันต์ วงค์สว่าง",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors().gray50,
                )),
            Text("เลขที่ : ${widget.jobNumber}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors().gray50,
                )),
          ],
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _buildMainContainer() {
    return Container(
      width: 745,
      height: 218,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        border: Border.all(
          color: ThemeColors().lightBlue70,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileRow(),
            SizedBox(height: 5),
            _buildPatientInfoRow(),
            SizedBox(height: 8),
            _buildContactInfo(),
            SizedBox(height: 16),
            _buildIDAndBirthdayRow(),
            SizedBox(height: 16),
            _buildDivider(),
            SizedBox(height: 8),
            _buildMedicalInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons_detali/man.svg', height: 24, width: 24),
        Text(
          "ปิยะพัทธ์ ยิ่งงาม",
          style: TextStyle(
            color: ThemeColors().gray30,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildPatientInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLabeledText("ประเภทผู้ป่วย : ", "ผู้พิการ"),
        SizedBox(width: 24),
        _buildLabeledText("ประเภทการบริการ : ", "กองทุนท้องถิ่น (กปท.)"),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Container(
      width: 319,
      height: 22,
      decoration: BoxDecoration(
        color: ThemeColors().orange60,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWhiteText("092 3333333 (หลัก) ,"),
            _buildWhiteText(" 092 3333333 (รอง)"),
          ],
        ),
      ),
    );
  }

  Widget _buildIDAndBirthdayRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIconWithText(
            'assets/icons_detali/id_crad.svg', "1 21 2234 23456 1"),
        SizedBox(width: 8),
        _buildIconWithText(
            'assets/icons_detali/birthday.svg', "16/11/2000 (24 ปี)"),
        SizedBox(width: 8),
        _buildUnderlinedIconWithText(
            'assets/icons_detali/birthday.svg', "ดูเอกสารบัตรประชาชน"),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Divider(
        color: ThemeColors().lightBlue70,
        thickness: 1,
      ),
    );
  }

  Widget _buildMedicalInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLabeledText("ความสามารถในการเดินทาง : ", "ช่วยเหลือตัวเองได้"),
          SizedBox(width: 16),
          _buildLabeledText("การวินิจฉัยโรค : ", "ปวดหัว ตัวร้อน"),
        ],
      ),
    );
  }

  Widget _buildLabeledText(String label, String text) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: ThemeColors().lightBlue60,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: ThemeColors().gray30,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildWhiteText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: ThemeColors().white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildIconWithText(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, height: 24, width: 24),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: ThemeColors().gray30,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildUnderlinedIconWithText(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, height: 24, width: 24),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: ThemeColors().lightBlue65,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationColor: ThemeColors().lightBlue65,
          ),
        ),
      ],
    );
  }

  Widget _buildLargeContainer() {
    return Container(
      width: 745,
      height: 314,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        border: Border.all(
          color: ThemeColors().lightBlue70,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInfoBox(title: "จุดนำส่งผู้ป่วย"),
                  const SizedBox(width: 16),
                  _buildInfoBox(title: "จุดรับผู้ป่วย", hasRemark: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "ข้อมูลการขอใช้รถ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ThemeColors().lightBlue60,
          ),
        ),
        Container(
          width: 131,
          height: 30,
          decoration: BoxDecoration(
            color: ThemeColors().orange50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              "ขาไปและขากลับ",
              style: TextStyle(
                color: ThemeColors().white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBox({required String title, bool hasRemark = true}) {
    return Container(
      width: 340.5,
      height: 236,
      decoration: BoxDecoration(
        color: ThemeColors().green100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeColors().green50,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeColors().green50,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: ThemeColors().green50,
          ),
          const SizedBox(height: 8),
          _buildInfoContent(hasRemark),
        ],
      ),
    );
  }

  Widget _buildInfoContent(bool hasRemark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow("สถานที่ :",
              "เลขที่ 123/1, หมู่ 1, หมู่บ้านน้ำเค็ม,\nซอย 12/1, ถนน กุดจับ"),
          const SizedBox(height: 8),
          _buildRow("จังหวัด :", "อุดรธานี"),
          _buildRow("อำเภอ :", "เมืองอุดรธานี"),
          _buildRow("แขวง :", "เชียงพิณ"),
          if (hasRemark)
            Divider(
              thickness: 1,
              color: ThemeColors().green50,
            ),
          if (hasRemark)
            _buildRow("จุดสังเกต :", "บ้านสีขาว หลังคาสีฟ้า\nหน้าบ้านมีสามแยก"),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70, // กำหนดความกว้างของ title ให้เท่ากันทุกตัว
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ThemeColors().green50,
            ),
          ),
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(color: ThemeColors().gray30),
          ),
        ),
      ],
    );
  }
}
