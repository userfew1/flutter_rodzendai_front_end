import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rodzendai_front_end/screens/details/widget/build_sidebar_wait.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_rodzendai_front_end/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

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
  Map<String, String>? selectedRowData; // เก็บข้อมูลที่ดึงจาก Google Sheets
  bool isLoading = true; // แสดงสถานะ Loading

  @override
  void initState() {
    super.initState();
    fetchRowDataFromColumn("B", widget.jobNumber); // ค้นหาข้อมูลเมื่อเปิดหน้า
  }

  Future<void> fetchRowDataFromColumn(
      String columnName, String valueToSearch) async {
    final url = Uri.parse(
        'https://docs.google.com/spreadsheets/d/1Po1EqeHklF4skRfn_Mm6nc88883P-BST-a6_nDN8qCU/gviz/tq?tqx=out:json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonString =
            response.body.substring(47, response.body.length - 2);
        final jsonData = json.decode(jsonString);

        final rows = jsonData['table']['rows']; // ดึงข้อมูลแถวทั้งหมด
        final columns = jsonData['table']['cols']; // ดึงข้อมูลคอลัมน์ทั้งหมด

        // คำนวณ index ของ column ที่ต้องการค้นหา
        Map<String, int> columnIndices = {
          "B": 1, // ตัวอย่าง: Column B = index 1
          "I": 8, // ตัวอย่าง: Column I = index 8
          "J": 9, // ตัวอย่าง: Column J = index 9
        };

        int columnIndex = columnIndices[columnName] ?? -1;

        if (columnIndex == -1) {
          print("❌ Invalid column name: $columnName");
          return;
        }

        bool found = false; // เช็คว่าพบข้อมูลหรือไม่

        for (int rowIndex = 0; rowIndex < rows.length; rowIndex++) {
          final row = rows[rowIndex]['c'];

          // ตรวจสอบว่าค่าของ column นั้นตรงกับค่าที่ต้องการค้นหาหรือไม่
          if (row[columnIndex] != null &&
              row[columnIndex]['v'].toString() == valueToSearch) {
            found = true;
            print("✅ Found matching row at index: $rowIndex");

            // แสดงข้อมูลของแถวที่พบ
            for (int colIndex = 0; colIndex < columns.length; colIndex++) {
              final columnName = columns[colIndex]['label'] ??
                  "Column $colIndex"; // ชื่อ Column
              final cellValue = row[colIndex] != null
                  ? row[colIndex]['v']
                  : "null"; // ค่าของ Cell

              print("  $columnName: $cellValue");
            }
            String convertJavaScriptDate(String date) {
              try {
                final regex = RegExp(r'Date\((\d+),(\d+),(\d+)\)');
                final match = regex.firstMatch(date);

                if (match != null) {
                  int year =
                      int.parse(match.group(1)!) + 543; // แปลง ค.ศ. → พ.ศ.
                  int month =
                      int.parse(match.group(2)!) + 1; // เดือน (เริ่มที่ 0)
                  int day = int.parse(match.group(3)!);

                  return "$day/${month.toString().padLeft(2, '0')}/$year";
                } else {
                  return date;
                }
              } catch (e) {
                return date;
              }
            }

            String convertJavaScriptTime(String time) {
              try {
                final regex = RegExp(r'Date\(\d+,\d+,\d+,(\d+),(\d+),\d+\)');
                final match = regex.firstMatch(time);

                if (match != null) {
                  int hour = int.parse(match.group(1)!);
                  int minute = int.parse(match.group(2)!);

                  return "${hour.toString().padLeft(2, '0')}.${minute.toString().padLeft(2, '0')} น.";
                } else {
                  return time;
                }
              } catch (e) {
                return time;
              }
            }

            print("---------------------------------------------------");
            selectedRowData = {
              //! วันที่นัดหมาย เวลานัดหมาย
              "date": row[8] != null
                  ? convertJavaScriptDate(row[8]['v'].toString())
                  : "ไม่ระบุ", // วันที่นัดหมาย
              "time": row[9] != null
                  ? convertJavaScriptTime(row[9]['v'].toString())
                  : "ไม่ระบุ",
              //! ==========================
              //! ชื่อ ประเภท เบอร์ ความสามารถ วินิจฉัยโรค
              "nameUser": row[3] != null ? row[3]['v'].toString() : "ไม่ระบุ",
              "patientType":
                  row[5] != null ? row[5]['v'].toString() : "ไม่ระบุ",
              "serviceType":
                  row[2] != null ? row[2]['v'].toString() : "ไม่ระบุ",
              "abilityToTravel":
                  row[6] != null ? row[6]['v'].toString() : "ไม่ระบุ",
              "diagnosis": row[7] != null ? row[7]['v'].toString() : "ไม่ระบุ",
              "phoneUser": row[4] != null ? row[4]['v'].toString() : "ไม่ระบุ",
              //! ==========================
              //! ชื่อ ดรงบาล
              "hospital": row[10] != null ? row[10]['v'].toString() : "ไม่ระบุ",
              //! ==========================
              //! ชื่อผู้ตืดตาม1
              "nameSurname1":
                  row[20] != null ? row[20]['v'].toString() : "ไม่ระบุ",
              "patients1":
                  row[21] != null ? row[21]['v'].toString() : "ไม่ระบุ",
              "phoneNumber1":
                  row[22] != null ? row[22]['v'].toString() : "ไม่ระบุ",
              //! ==========================
              //! ชื่อผู้ตืดตาม2
              "nameSurname2":
                  row[23] != null ? row[23]['v'].toString() : "ไม่ระบุ",
              "patients2":
                  row[24] != null ? row[24]['v'].toString() : "ไม่ระบุ",
              "phoneNumber2":
                  row[25] != null ? row[25]['v'].toString() : "ไม่ระบุ",
              //! ==========================
              //! ข้อมูลการขอใช้รถ
              "requestInformation":
                  row[27] != null ? row[27]['v'].toString() : "ไม่ระบุ",

              //! ==========================
              //! จุดรับผู้ป่วย
              "locationStart":
                  row[11] != null ? row[11]['v'].toString() : "ไม่ระบุ",
              "provinceStart":
                  row[12] != null ? row[12]['v'].toString() : "ไม่ระบุ",
              "districtStart":
                  row[13] != null ? row[13]['v'].toString() : "ไม่ระบุ",
              "subdistrictStart":
                  row[14] != null ? row[14]['v'].toString() : "ไม่ระบุ",
              "landmarkStart":
                  row[15] != null ? row[15]['v'].toString() : "ไม่ระบุ",
              //! ==========================
              //! จุดนำส่งผู้ป่วย
              "locationEnd":
                  row[16] != null ? row[16]['v'].toString() : "ไม่ระบุ",
              "provinceEnd":
                  row[17] != null ? row[17]['v'].toString() : "ไม่ระบุ",
              "districtEnd":
                  row[18] != null ? row[18]['v'].toString() : "ไม่ระบุ",
              "subdistrictEnd":
                  row[19] != null ? row[19]['v'].toString() : "ไม่ระบุ",
            };

            break; // หยุด Loop เมื่อเจอข้อมูล
          }
        }

        if (!found) {
          print(
              "❌ No matching row found in column $columnName for value: $valueToSearch");
        }

        setState(() {
          isLoading = false; // ปิดสถานะ Loading
        });
      } else {
        print("❌ Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return selectedRowData == null
        ? Center(child: CircularProgressIndicator()) // กำลังโหลด
        : Row(
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
                                    "${selectedRowData?['date'] ?? 'ไม่ระบุ'} (${selectedRowData?['time'] ?? 'ไม่ระบุ'})"),
                                _buildDetailRow("ชื่อโรงพยาบาล : ",
                                    selectedRowData?['hospital'] ?? 'ไม่ระบุ'),
                                _buildDetailRow("แนบเอกสารใบนัด : ", "ดูข้อมูล",
                                    underline: true),
                              ],
                            ),
                            SizedBox(width: 16),
                            _buildInfoContainer(
                              title: "ข้อมูลผู้แจ้ง / ผู้ติดต่อ",
                              details: [
                                _buildDetailRow(
                                    "ชื่อ - นามสกุล : ",
                                    selectedRowData!['nameSurname1'] ??
                                        "ไม่ระบุ"),
                                _buildDetailRow("ความสัมพันธ์ : ",
                                    selectedRowData!['patients1'] ?? "ไม่ระบุ"),
                                _buildDetailRow(
                                    "เบอร์โทรติดต่อ : ",
                                    selectedRowData!['phoneNumber1'] ??
                                        "ไม่ระบุ"),
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
                                    "ชื่อ - นามสกุล : ",
                                    selectedRowData!['nameSurname1'] ??
                                        "ไม่ระบุ"),
                                _buildDetailRow("ความสัมพันธ์ : ",
                                    selectedRowData!['patients1'] ?? "ไม่ระบุ"),
                                _buildDetailRow(
                                    "เบอร์โทรติดต่อ : ",
                                    selectedRowData!['phoneNumber1'] ??
                                        "ไม่ระบุ"),
                              ],
                            ),
                            SizedBox(width: 16),
                            _buildInfoContainer(
                              title: "ข้อมูลผู้ติดตามลำดับที่ 2",
                              details: [
                                _buildDetailRow(
                                    "ชื่อ - นามสกุล : ",
                                    selectedRowData!['nameSurname2'] ??
                                        "ไม่ระบุ"),
                                _buildDetailRow("ความสัมพันธ์ : ",
                                    selectedRowData!['patients2'] ?? "ไม่ระบุ"),
                                _buildDetailRow(
                                    "เบอร์โทรติดต่อ : ",
                                    selectedRowData!['phoneNumber2'] ??
                                        "ไม่ระบุ"),
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
                  maxLines: 1, // แสดงเพียง 1 บรรทัด
                  overflow: TextOverflow.ellipsis,
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
        Expanded(
          // ✅ เพิ่ม Expanded เพื่อบังคับให้ Text ตัดข้อความได้
          child: Text(
            value,
            maxLines: 1, // แสดงเพียง 1 บรรทัด
            overflow: TextOverflow.ellipsis, // ตัดข้อความเกินด้วย "..."
            textAlign: TextAlign.right, // ชิดขวา
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color:
                  underline ? ThemeColors().lightBlue60 : ThemeColors().gray30,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
              decorationThickness: 1.5, // ความหนาของขีดเส้นใต้
              decorationColor: underline ? ThemeColors().lightBlue60 : null,
            ),
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
          child: Text(selectedRowData!['nameUser'] ?? "ไม่ระบุ",
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
          selectedRowData!['nameUser'] ?? "ไม่ระบุ",
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
        _buildLabeledText(
          "ประเภทผู้ป่วย : ",
          selectedRowData!['patientType'] ?? "ไม่ระบุ",
        ),
        SizedBox(width: 24),
        _buildLabeledText(
          "ประเภทการบริการ : ",
          selectedRowData!['serviceType'] ?? "ไม่ระบุ",
        ),
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
            _buildWhiteText(
              selectedRowData!['phoneUser'] ?? "ไม่ระบุ",
            ),
            _buildWhiteText(", ไม่ระบุ"),
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
          _buildLabeledText(
            "ความสามารถในการเดินทาง : ",
            selectedRowData!['abilityToTravel'] ?? "ไม่ระบุ",
          ),
          SizedBox(width: 16),
          _buildLabeledText(
            "การวินิจฉัยโรค : ",
            selectedRowData!['diagnosis'] ?? "ไม่ระบุ",
          ),
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
      constraints: BoxConstraints(minHeight: 314),
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
                  _buildInfoBox(title: "จุดรับผู้ป่วย"),
                  const SizedBox(width: 16),
                  _buildInfoBoxEnd(title: "จุดนำส่งผู้ป่วย", hasRemark: false),
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
              selectedRowData?['requestInformation'] ?? 'ไม่ระบุ',
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
      constraints: BoxConstraints(minHeight: 236),
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
          _buildRow(
              "สถานที่ :", selectedRowData!['locationStart'] ?? "ไม่ระบุ"),
          const SizedBox(height: 8),
          _buildRow(
              "จังหวัด :", selectedRowData!['provinceStart'] ?? "ไม่ระบุ"),
          _buildRow("อำเภอ :", selectedRowData!['districtStart'] ?? "ไม่ระบุ"),
          _buildRow(
              "แขวง :", selectedRowData!['subdistrictStart'] ?? "ไม่ระบุ"),
          if (hasRemark)
            Divider(
              thickness: 1,
              color: ThemeColors().green50,
            ),
          if (hasRemark)
            _buildRow(
                "จุดสังเกต :", selectedRowData!['landmarkStart'] ?? "ไม่ระบุ"),
        ],
      ),
    );
  }

  Widget _buildInfoBoxEnd({required String title, bool hasRemark = true}) {
    return Container(
      width: 340.5,
      constraints: BoxConstraints(minHeight: 236),
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
          _buildInfoContentEnd(hasRemark),
        ],
      ),
    );
  }

  Widget _buildInfoContentEnd(bool hasRemark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow("สถานที่ :", selectedRowData!['locationEnd'] ?? "ไม่ระบุ"),
          const SizedBox(height: 8),
          _buildRow("จังหวัด :", selectedRowData!['provinceEnd'] ?? "ไม่ระบุ"),
          _buildRow("อำเภอ :", selectedRowData!['districtEnd'] ?? "ไม่ระบุ"),
          _buildRow("แขวง :", selectedRowData!['subdistrictEnd'] ?? "ไม่ระบุ"),
          if (hasRemark)
            Divider(
              thickness: 1,
              color: ThemeColors().green50,
            ),
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
