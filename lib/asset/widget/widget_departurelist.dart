import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class DepartureList extends StatefulWidget {
   final Function(String) onCaseSelected; // เปลี่ยน VoidCallback เป็น Function(String)
  const DepartureList({super.key,required this.onCaseSelected});

  @override
  State<DepartureList> createState() => _DepartureListState();
}

class _DepartureListState extends State<DepartureList> {
  int selectedIndex = 0;
  int selectedTypeIndex = 0;

  int selectedTabIndex = 0;
  int currentPage = 1;
  final int rowsPerPage = 7;
  bool showOverlayPage = true;
  Map<String, String>? selectedCase;
  int hoveredIndex = -1;
  List<Map<String, String>> caseDataList = [];
  final List<Map<String, dynamic>> selectedStatusItems = [
    {"title": "รอมอบหมาย", "count": "(10)", "img": "assets/icons/Logo.svg"},
    {"title": "รอดำเนินการ", "count": "(5)", "img": "assets/icons/Logo.svg"},
    {
      "title": "ติดตามนัดหมายล่วงหน้า",
      "count": "(5)",
      "img": "assets/icons/Logo.svg"
    },
    {"title": "กำลังดำเนินการ", "count": "(8)", "img": "assets/icons/Logo.svg"},
    {"title": "สำเร็จ", "count": "(12)", "img": "assets/icons/Logo.svg"},
    {"title": "ไม่สำเร็จ", "count": "(20)", "img": "assets/icons/Logo.svg"},
    {"title": "ยกเลิก", "count": "(3)", "img": "assets/icons/Logo.svg"},
  ];

  final List<Map<String, dynamic>> sceleTypeItems = [
    {"title": "การเดินทางเอกชน (ต่อเดียว)", "img": "assets/icons/Logo.svg"},
    {"title": "รถพยาบาลเส้นด้าย", "img": "assets/icons/Logo.svg"},
    {"title": "การเดินทางหลายต่อ", "img": "assets/icons/Logo.svg"},
  ];
  final List<Map<String, String>> mockData = [
    {
      "date": "15/01/2567",
      "time": "14:00 น.",
      "name": "นาย สมชาย ใจดี",
      "phone": "081-234-5678",
      "location": "โรงพยาบาล A",
      "typeCar": "Bolt",
      "status": "รอมอบหมาย",
    },
    {
      "date": "16/01/2567",
      "time": "10:00 น.",
      "name": "นางสาว สมใจ ดีใจ",
      "phone": "082-345-6789",
      "location": "โรงพยาบาล B",
      "typeCar": "Van",
      "status": "รอดำเนินการ",
    },
    {
      "date": "17/01/2567",
      "time": "09:00 น.",
      "name": "นาย ดีใจ สมใจ",
      "phone": "083-456-7890",
      "location": "โรงพยาบาล C",
      "typeCar": "SUV",
      "status": "ติดตามนัดหมายล่วงหน้า",
    },
    {
      "date": "18/01/2567",
      "time": "13:00 น.",
      "name": "นาง ใจดี สมชาย",
      "phone": "084-567-8901",
      "location": "โรงพยาบาล D",
      "typeCar": "Sedan",
      "status": "กำลังดำเนินการ",
    },
    {
      "date": "19/01/2567",
      "time": "15:00 น.",
      "name": "นาย ดี สม",
      "phone": "085-678-9012",
      "location": "โรงพยาบาล E",
      "typeCar": "Pickup",
      "status": "สำเร็จ",
    },
    {
      "date": "20/01/2567",
      "time": "11:00 น.",
      "name": "นางสาว สม สุดใจ",
      "phone": "086-789-0123",
      "location": "โรงพยาบาล F",
      "typeCar": "Truck",
      "status": "ไม่สำเร็จ",
    },
    {
      "date": "21/01/2567",
      "time": "16:00 น.",
      "name": "นาย สุดใจ ดีสุด",
      "phone": "087-890-1234",
      "location": "โรงพยาบาล G",
      "typeCar": "Motorcycle",
      "status": "ยกเลิก",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredData = mockData
        .where((data) =>
            data["status"] == selectedStatusItems[selectedIndex]["title"])
        .toList();
    return Column(
      children: [
        MenuBar(),
        const SizedBox(
          height: 16,
        ),
        BarSearch(),
        const SizedBox(
          height: 16,
        ),
        TypeBar(),
        const SizedBox(
          height: 16,
        ),
        rowTypeText(),
        ...filteredData.map((caseData) {
          int index = filteredData.indexOf(caseData);
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
                   widget.onCaseSelected(caseData["status"] ?? "");
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 92,
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
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTextCell(caseData["date"] ?? "ไม่ระบุ", 2),
                      _buildTextCell(caseData["time"] ?? "ไม่ระบุ", 2),
                      _buildTextCell(caseData["name"] ?? "ไม่ระบุ", 2),
                      _buildTextCell(caseData["phone"] ?? "ไม่ระบุ", 2),
                      _buildCardGo(
                        4,
                        caseData["location"] ?? "ไม่ระบุ",
                        caseData["typeCar"] ?? "ไม่ระบุ",
                        caseData["status"] ?? "ไม่ระบุ",
                      ),
                      _buildCardBack(
                          caseData["jobNumber"] ?? "เดินทางขากลับ", 2),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTextCell(String text, int flex,
      {Map<String, String>? caseData}) {
    return Flexible(
      flex: flex,
      child: InkWell(
        onTap: caseData != null
            ? () {
                setState(() {
                  selectedCase = caseData;
                  showOverlayPage = false;
                });
              }
            : null,
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

  Widget _buildCardGo(
      int flex, String textNamelocation, String typeCar, String status,
      {Map<String, String>? caseData}) {
    return Flexible(
      flex: flex,
      child: InkWell(
        onTap: caseData != null
            ? () {
                setState(() {
                  selectedCase = caseData;
                  showOverlayPage = false;
                });
              }
            : null,
        child: Container(
          width: 280,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorsApp.green100,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "เดินทางขาไป",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: colorsApp.gray30,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 94,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: colorsApp.orange60,
                        ),
                        child: Center(
                          child: Text(
                            status,
                            style: TextStyle(color: colorsApp.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "สถานที่ : $textNamelocation",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: colorsApp.gray30,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "ประเภทรถ : $typeCar",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: colorsApp.gray30,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardBack(String text, int flex,
      {Map<String, String>? caseData}) {
    return Flexible(
      flex: flex,
      child: InkWell(
        onTap: caseData != null
            ? () {
                setState(() {
                  selectedCase = caseData;
                  showOverlayPage = false;
                });
              }
            : null,
        child: Container(
          width: 116,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorsApp.green100,
          ),
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: colorsApp.gray70,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                width: 92,
                height: 22,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colorsApp.gray70),
                child: Center(
                  child: Text(
                    "ยังไม่มีข้อมูล",
                    style: TextStyle(fontSize: 12, color: colorsApp.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row rowTypeText() {
    final List<Map<String, dynamic>> headers = [
      {"text": "วันที่นัดหมาย", "flex": 2},
      {"text": "เวลานัดหมาย", "flex": 2},
      {"text": "ชื่อ - นามสกุลผู้ป่วย", "flex": 2},
      {"text": "เบอร์โทรศัพท์", "flex": 2},
      {"text": "ข้อมูลขาไป", "flex": 4},
      {"text": "ข้อมูลขากลับ", "flex": 2},
    ];

    return Row(
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
              children: headers
                  .map((header) => Flexible(
                        flex: header["flex"],
                        child: Center(
                          child: _buildHeaderText(header["text"]),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ThemeColors().white,
      ),
      textAlign: TextAlign.center,
    );
  }

  // ignore: non_constant_identifier_names
  Row BarSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "การเดินทางเอกชน (ต่อเดียว)",
              style: TextStyle(
                  fontSize: 24,
                  color: colorsApp.lightBlue65,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              "ทั้งหมด 10 รายการ",
              style: TextStyle(
                  fontSize: 16,
                  color: colorsApp.lightBlue65,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 408,
              height: 48,
              decoration: BoxDecoration(
                color: colorsApp.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: colorsApp.lightBlue60,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.search,
                      color: colorsApp.lightBlue60,
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "ค้นหา",
                          hintStyle: TextStyle(
                            color: colorsApp.gray70,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        onChanged: (value) {},
                      ),
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
    );
  }

  // ignore: non_constant_identifier_names
  Row MenuBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(selectedStatusItems.length, (index) {
              bool isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? colorsApp.lightBlue65 : colorsApp.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          selectedStatusItems[index]["img"],
                          height: 24,
                          width: 24,
                        ),
                        Text(
                          selectedStatusItems[index]["title"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isSelected
                                  ? colorsApp.white
                                  : colorsApp.lightBlue65),
                        ),
                        Text(
                          selectedStatusItems[index]["count"],
                          style: TextStyle(
                              color: isSelected
                                  ? colorsApp.white
                                  : colorsApp.lightBlue65),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Row TypeBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(sceleTypeItems.length, (index) {
              bool isSelected = index == selectedTypeIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTypeIndex = index;
                  });
                },
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? colorsApp.lightBlue65 : colorsApp.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            sceleTypeItems[index]["img"],
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            sceleTypeItems[index]["title"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: isSelected
                                    ? colorsApp.white
                                    : colorsApp.lightBlue65),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
