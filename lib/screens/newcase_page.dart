import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rodzendai_front_end/screens/details/case_details_page.dart';
import 'package:flutter_rodzendai_front_end/screens/menu/sidebar_at.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class NewCasePage extends StatefulWidget {
  const NewCasePage({super.key});

  @override
  State<NewCasePage> createState() => _NewCasePageState();
}

class _NewCasePageState extends State<NewCasePage> {
  int selectedTabIndex = 0;
  int currentPage = 1;
  final int rowsPerPage = 7;
  bool showOverlayPage = true;
  Map<String, String>? selectedCase;
  int hoveredIndex = -1;
  List<Map<String, String>> caseDataList = [];
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  void initState() {
    super.initState();
    fetchGoogleSheetsData();
  }

  Future<void> fetchGoogleSheetsData() async {
    final url = Uri.parse(
        'https://docs.google.com/spreadsheets/d/1Po1EqeHklF4skRfn_Mm6nc88883P-BST-a6_nDN8qCU/gviz/tq?tqx=out:json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonString = response.body.substring(47, response.body.length - 2);
      final jsonData = json.decode(jsonString);

      List<Map<String, String>> extractedData = [];
      for (var i = 1; i < jsonData['table']['rows'].length; i++) {
        var row = jsonData['table']['rows'][i]['c'];
        String convertDateFormat(String date) {
          try {
            DateTime parsedDate = DateTime.parse(date);
            int buddhistYear = parsedDate.year + 543; // แปลง ค.ศ. → พ.ศ.
            return "${parsedDate.day.toString().padLeft(2, '0')}/"
                "${parsedDate.month.toString().padLeft(2, '0')}/"
                "$buddhistYear";
          } catch (e) {
            return date; // ถ้าแปลงไม่ได้ให้คืนค่าเดิม
          }
        }

        String convertTimeFormat(String time) {
          try {
            List<String> parts = time.split(":");
            String hour = parts[0].padLeft(2, '0'); // ทำให้เป็น 2 หลัก เช่น 08
            String minute = parts[1]; // เอาเฉพาะนาที
            return "$hour.$minute น.";
          } catch (e) {
            return time; // ถ้าแปลงไม่ได้ให้คืนค่าเดิม
          }
        }

        String convertJavaScriptDate(String date) {
          try {
            final regex = RegExp(r'Date\((\d+),(\d+),(\d+)\)');
            final match = regex.firstMatch(date);

            if (match != null) {
              int year = int.parse(match.group(1)!); // ดึงปี
              int month = int.parse(match.group(2)!) + 1; // ดึงเดือน (บวก 1)
              int day = int.parse(match.group(3)!); // ดึงวัน

              int buddhistYear = year + 543; // แปลง ค.ศ. → พ.ศ.
              return "${day.toString().padLeft(2, '0')}/"
                  "${month.toString().padLeft(2, '0')}/"
                  "$buddhistYear";
            } else {
              return date; // คืนค่าเดิมถ้าไม่ match
            }
          } catch (e) {
            return date; // คืนค่าเดิมถ้าแปลงไม่ได้
          }
        }

        String convertTimeFromJavaScriptDate(String date) {
          try {
            final regex =
                RegExp(r'Date\((\d+),(\d+),(\d+),(\d+),(\d+),(\d+)\)');
            final match = regex.firstMatch(date);

            if (match != null) {
              int hour = int.parse(match.group(4)!); // ดึงชั่วโมง
              int minute = int.parse(match.group(5)!); // ดึงนาที

              // แปลงเวลาเป็นรูปแบบ HH.MM น.
              return "${hour.toString().padLeft(2, '0')}.${minute.toString().padLeft(2, '0')} น.";
            } else {
              return date; // คืนค่าเดิมถ้าไม่ match
            }
          } catch (e) {
            return date; // คืนค่าเดิมถ้าแปลงไม่ได้
          }
        }

        extractedData.add({
          "date": row[8] != null
              ? convertJavaScriptDate(row[8]['v'].toString())
              : "", // I
          "time": row[9] != null
              ? convertTimeFromJavaScriptDate(row[9]['v'].toString())
              : "", // J
          "name": row[3] != null ? row[3]['v'].toString() : "", // D
          "phone": row[4] != null ? row[4]['v'].toString() : "", // E
          "location": row[16] != null ? row[16]['v'].toString() : "", // Q
          "jobNumber": row[1] != null ? row[1]['v'].toString() : "", // B
          "status": "ไม่ได้", // ค่าเริ่มต้น
        });
      }

      setState(() {
        caseDataList = extractedData;
      });
    } else {
      throw Exception('Failed to load data from Google Sheets');
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "ทั้งหมด",
      "รอคัดกรอง",
      "สามารถเดินทางได้",
      "ไม่สามารถเดินทางได้"
    ];

    int totalPages = (caseDataList.length / rowsPerPage).ceil();

    // ✅ คำนวณข้อมูลที่จะแสดงในหน้าปัจจุบัน
    List<Map<String, String>> displayedData = caseDataList
        .where((data) =>
            data["date"] != null &&
            data["date"]!.isNotEmpty && // ตรวจสอบ date
            data["name"] != null &&
            data["name"]!.isNotEmpty) // ตรวจสอบ name
        .skip((currentPage - 1) *
            rowsPerPage) // ข้ามข้อมูลที่ไม่อยู่ในหน้าปัจจุบัน
        .take(rowsPerPage) // ดึงข้อมูลเฉพาะแถวในหน้าปัจจุบัน
        .toList();

    return Padding(
      padding: showOverlayPage
          ? const EdgeInsets.all(30.0)
          : const EdgeInsets.all(0.0),
      child: showOverlayPage
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "เคสรายการใหม่",
                      style: TextStyle(
                          fontSize: 24,
                          color: ThemeColors().lightBlue65,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 408,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24), // ขอบมน
                            border: Border.all(
                              color: Colors.blue, // เส้นขอบสีน้ำเงิน
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.blue, // ไอคอนแว่นขยาย
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "ค้นหา",
                                    hintStyle: TextStyle(
                                      color: Colors.grey, // สีข้อความคำใบ้
                                      fontSize: 16,
                                    ),
                                    border: InputBorder
                                        .none, // ไม่มีเส้นขอบของ TextField
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black, // สีข้อความที่พิมพ์
                                  ),
                                  onChanged: (value) {
                                    print(
                                        "Search: $value"); // ดักข้อความที่พิมพ์
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icon_setting/filter.svg',
                            height: 48,
                            width: 48,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icon_setting/Ep.svg',
                            height: 48,
                            width: 48,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: tabs.asMap().entries.map((entry) {
                        int index = entry.key;
                        String label = entry.value;

                        bool isSelected = index ==
                            selectedTabIndex; // ตรวจสอบว่า Tab นี้ถูกเลือกหรือไม่

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTabIndex = index; // อัปเดต Tab ที่เลือก
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 12), // ระยะห่างระหว่าง Tab
                            padding: const EdgeInsets.only(
                                bottom: 4), // เพิ่มพื้นที่สำหรับเส้นใต้
                            decoration: isSelected
                                ? BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: ThemeColors().green30,
                                          width: 2), // เส้นใต้
                                    ),
                                  )
                                : null,
                            child: Text(
                              label,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w400, // น้ำหนักข้อความ
                                color: isSelected
                                    ? ThemeColors().green30
                                    : ThemeColors().gray50, // สีข้อความ
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 113,
                            height: 38,
                            decoration: BoxDecoration(
                              color: ThemeColors().red70,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "อัปเดตข้อมูล",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ThemeColors().white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 46,
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          color: ThemeColors().green70,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            ...[
                              "วันที่นัดหมาย",
                              "เวลานัดหมาย",
                              "ชื่อ - นามสกุลผู้ป่วย",
                              "เบอร์โทรศัพท์",
                              "จุดนำส่งผู้ป่วย",
                              "เลขที่ใบงาน",
                              "สถานะ"
                            ].map((text) => Expanded(
                                  child: SizedBox(
                                    width: 130,
                                    child: Text(
                                      text,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeColors().white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(), // ✅ ปิดการเลื่อนลง
                    itemCount: displayedData.length,
                    itemBuilder: (context, index) {
                      final caseData = displayedData[index];

                      return MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            hoveredIndex = index;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            hoveredIndex = -1;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedCase = caseData;
                              showOverlayPage = false;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            height: 78,
                            decoration: BoxDecoration(
                              color: hoveredIndex == index
                                  ? ThemeColors().green100
                                  : ThemeColors().white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: hoveredIndex == index
                                    ? ThemeColors().green50
                                    : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildTextCell(
                                      caseData["date"] ?? "ไม่ระบุ", 130),
                                  _buildTextCell(
                                      caseData["time"] ?? "ไม่ระบุ", 130),
                                  _buildTextCell(
                                      caseData["name"] ?? "ไม่ระบุ", 130),
                                  _buildTextCell(
                                      caseData["phone"] ?? "ไม่ระบุ", 130),
                                  _buildTextCell(
                                      caseData["location"] ?? "ไม่ระบุ", 130),
                                  _buildTextCell(
                                      caseData["jobNumber"] ?? "ไม่ระบุ", 130),
                                  _buildStatusButton(
                                      caseData["status"] ?? "ไม่ระบุ"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _buildPagination(totalPages),
              ],
            )
          : CaseDataListPState(
              jobNumber: selectedCase?["jobNumber"] ?? "",
              onBackPressed: () {
                setState(() {
                  showOverlayPage = true; // กลับมาที่หน้าแรก
                });
              },
            ),
    );
  }

  Widget _buildTextCell(String text, double width,
      {Map<String, String>? caseData}) {
    return InkWell(
      onTap: caseData != null
          ? () {
              setState(() {
                selectedCase = caseData; // อัปเดตค่า case ที่ถูกเลือก
                showOverlayPage = false; // ซ่อนหน้า Overlay
              });
            }
          : null,
      child: SizedBox(
        width: width,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ThemeColors().gray30,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildPagination(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // แสดงข้อมูลจำนวนแถว
        Text(
          "แสดงข้อมูล ${(currentPage - 1) * rowsPerPage + 1} "
          "ถึง ${(currentPage * rowsPerPage).clamp(0, caseDataList.length)} "
          "จาก ${caseDataList.length} แถว",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      setState(() {
                        currentPage--; // ✅ ย้อนกลับหน้าก่อนหน้า
                      });
                    }
                  : null,
              child: Icon(
                Icons.chevron_left,
                size: 24,
                color: currentPage > 1 ? Colors.black : Colors.grey,
              ),
            ),
            ...List.generate(totalPages > 0 ? totalPages : 1, (index) {
              int pageIndex = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = pageIndex; // ✅ อัปเดตหน้าปัจจุบัน
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: currentPage == pageIndex
                        ? Colors.blue
                        : Colors.transparent,
                    border: currentPage == pageIndex
                        ? null
                        : Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "$pageIndex",
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          currentPage == pageIndex ? Colors.white : Colors.blue,
                      fontWeight: currentPage == pageIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }),
            GestureDetector(
              onTap: currentPage < totalPages
                  ? () {
                      setState(() {
                        currentPage++; // ✅ ไปหน้าถัดไป
                      });
                    }
                  : null,
              child: Icon(
                Icons.chevron_right,
                size: 24,
                color: currentPage < totalPages ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusButton(String status) {
    return Container(
      width: 104,
      height: 30,
      decoration: BoxDecoration(
        color: status == "ไม่ได้" ? ThemeColors().red80 : Colors.green,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ThemeColors().white,
          ),
        ),
      ),
    );
  }
}
