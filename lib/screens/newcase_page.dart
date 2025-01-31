import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rodzendai_front_end/screens/details/case_details_page.dart';
import 'package:flutter_rodzendai_front_end/screens/menu/sidebar_at.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class NewCasePage extends StatefulWidget {
  const NewCasePage({super.key});

  @override
  State<NewCasePage> createState() => _NewCasePageState();
}

class _NewCasePageState extends State<NewCasePage> with RouteAware {
  int selectedTabIndex = 0; // เก็บค่า Tab ที่เลือก
  int currentPage = 1; // เก็บหน้าปัจจุบัน
  final int rowsPerPage = 7; // จำนวนแถวต่อหน้า
  bool showOverlayPage = true; // ค่าเริ่มต้นให้แสดง OverlayPage
  Map<String, String>? selectedCase; // เก็บข้อมูลเคสที่เลือก
  int hoveredIndex = -1; // เก็บ index ที่เมาส์ชี้อยู่
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // ✅ เมื่อกลับมาที่ NewCasePage ให้แสดงหน้าแรกใหม่
    setState(() {
      showOverlayPage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "ทั้งหมด",
      "รอคัดกรอง",
      "สามารถเดินทางได้",
      "ไม่สามารถเดินทางได้"
    ];
    final List<Map<String, String>> caseDataList = [
      {
        "date": "09/02/2568",
        "time": "13.00 น.",
        "name": "จิรวัฒน์ แสนธารา",
        "phone": "092 2725242",
        "location": "โรงพยาบาลพญาไท 3",
        "jobNumber": "1234567",
        "status": "ไม่ได้",
      },
      {
        "date": "10/02/2568",
        "time": "14.00 น.",
        "name": "สมชาย ใจดี",
        "phone": "093 1234567",
        "location": "โรงพยาบาลกรุงเทพ",
        "jobNumber": "7654321",
        "status": "เสร็จสิ้น",
      },
      {
        "date": "10/02/2568",
        "time": "14.00 น.",
        "name": "สมชาย ใจดี",
        "phone": "093 1234567",
        "location": "โรงพยาบาลกรุงเทพ",
        "jobNumber": "7654321",
        "status": "เสร็จสิ้น",
      },
    ];
    // คำนวณจำนวนหน้าทั้งหมด
    int totalPages = (caseDataList.length / rowsPerPage).ceil();

    // ข้อมูลที่จะแสดงในหน้าปัจจุบัน
    List<Map<String, String>> displayedData = caseDataList
        .skip((currentPage - 1) * rowsPerPage)
        .take(rowsPerPage)
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
                                    width: 104,
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
                    itemCount: caseDataList.length,
                    itemBuilder: (context, index) {
                      final caseData = caseDataList[index];

                      return MouseRegion(
                        // ✅ เพิ่ม MouseRegion เพื่อจับ Hover
                        onEnter: (_) {
                          setState(() {
                            hoveredIndex = index; // เก็บ index ที่เมาส์ชี้อยู่
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            hoveredIndex = -1; // ลบค่าเมื่อเมาส์ออก
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
                                    : Colors
                                        .transparent, // ✅ เปลี่ยนขอบเมื่อ Hover
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
                                      caseData["date"] ?? "ไม่ระบุ", 104),
                                  _buildTextCell(
                                      caseData["time"] ?? "ไม่ระบุ", 104),
                                  _buildTextCell(
                                      caseData["name"] ?? "ไม่ระบุ", 104),
                                  _buildTextCell(
                                      caseData["phone"] ?? "ไม่ระบุ", 104),
                                  _buildTextCell(
                                      caseData["location"] ?? "ไม่ระบุ", 104),
                                  _buildTextCell(
                                      caseData["jobNumber"] ?? "ไม่ระบุ", 104),
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
                _buildPagination(totalPages, currentPage, caseDataList),
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
      {String? jobNumber, Map<String, String>? caseData}) {
    return InkWell(
      onTap: jobNumber != null
          ? () {
              setState(() {
                selectedCase = caseData; // อัปเดตค่า case ที่ถูกเลือก
                showOverlayPage =
                    false; // ซ่อนหน้า Overlay และแสดง CaseDataListPState
              });
            }
          : null,
      child: Container(
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

  Widget _buildPagination(
      int totalPages, int currentPage, List<Map<String, String>> caseDataList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // แสดงข้อมูลจำนวนแถว
        Text(
          "แสดงข้อมูล ${(currentPage - 1) * rowsPerPage + 1} ถึง ${(currentPage * rowsPerPage).clamp(0, caseDataList.length)} จาก ${caseDataList.length} แถว",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        // แสดงปุ่ม Pagination
        Row(
          children: [
            // ปุ่มก่อนหน้า
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      setState(() {
                        currentPage--;
                      });
                    }
                  : null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.chevron_left,
                  size: 24,
                  color: currentPage > 1 ? Colors.black : Colors.grey,
                ),
              ),
            ),
            // หมายเลขหน้า
            ...List.generate(totalPages, (index) {
              int pageIndex = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = pageIndex;
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
            // ปุ่มถัดไป
            GestureDetector(
              onTap: currentPage < totalPages
                  ? () {
                      setState(() {
                        currentPage++;
                      });
                    }
                  : null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.chevron_right,
                  size: 24,
                  color: currentPage < totalPages ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
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
