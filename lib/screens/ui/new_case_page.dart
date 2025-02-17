import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/details_information.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

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
    _generateMockData();
  }

  void _generateMockData() {
    caseDataList = List.generate(50, (index) {
      return {
        "date": "2025-02-${(index % 28) + 1}".padLeft(2, '0'),
        "time": "${(index % 12) + 8}:00",
        "name": "ผู้ป่วย ${index + 1}",
        "phone": "089-123-45${(index % 10)}",
        "location": "โรงพยาบาล ${index % 5 + 1}",
        "jobNumber": "JOB-${1000 + index}",
        "status": (index % 3 == 0)
            ? "รอคัดกรอง"
            : (index % 3 == 1)
                ? "ได้"
                : "ไม่ได้",
      };
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

    List<Map<String, String>> filteredData = caseDataList.where((data) {
      String? status = data["status"];
      if (selectedTabIndex == 0) return true;
      if (selectedTabIndex == 2) return status == "ได้";
      if (selectedTabIndex == 3) return status == "ไม่ได้";

      return status == "รอคัดกรอง";
    }).toList();

    List<Map<String, String>> displayedData = filteredData
        .where((data) =>
            data["date"] != null &&
            data["date"]!.isNotEmpty &&
            data["name"] != null &&
            data["name"]!.isNotEmpty)
        .skip((currentPage - 1) * rowsPerPage)
        .take(rowsPerPage)
        .toList();

    int totalPages = (filteredData.length / rowsPerPage).ceil();
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
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.blue,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: "ค้นหา",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    onChanged: (value) {
                                      print("Search: $value");
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

                          bool isSelected = index == selectedTabIndex;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTabIndex = index;
                                currentPage = 1;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.only(bottom: 4),
                              decoration: isSelected
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: ThemeColors().green30,
                                            width: 2),
                                      ),
                                    )
                                  : null,
                              child: Text(
                                label,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? ThemeColors().green30
                                      : ThemeColors().gray50,
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
                          padding: const EdgeInsets.symmetric(horizontal: 0),
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
                      physics: const NeverScrollableScrollPhysics(),
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
                                        caseData["jobNumber"] ?? "ไม่ระบุ",
                                        130),
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
                  _buildPagination(totalPages, filteredData.length)
                ],
              )
            :  DetailsInformation(
              jobNumber: selectedCase?["jobNumber"] ?? "",
              status: selectedCase?["status"] ?? "",
              onBackPressed: () {
                setState(() {
                  showOverlayPage = true;
                });
              },
            ));
  }

  Widget _buildTextCell(String text, double width,
      {Map<String, String>? caseData}) {
    return InkWell(
      onTap: caseData != null
          ? () {
              setState(() {
                selectedCase = caseData;
                showOverlayPage = false;
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

  Widget _buildPagination(int totalPages, int totalData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "แสดงข้อมูล ${(currentPage - 1) * rowsPerPage + 1} "
          "ถึง ${(currentPage * rowsPerPage).clamp(0, totalData)} "
          "จาก $totalData แถว",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: currentPage > 1
                  ? () {
                      setState(() {
                        currentPage--;
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
            GestureDetector(
              onTap: currentPage < totalPages
                  ? () {
                      setState(() {
                        currentPage++;
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
        color: status == "รอคัดกรอง"
            ? ThemeColors().lightBlue70
            : status == "ไม่ได้"
                ? ThemeColors().red80
                : ThemeColors().green70,
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
