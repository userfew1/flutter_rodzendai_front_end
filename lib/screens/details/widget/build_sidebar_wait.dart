import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BuildSideBarWait extends StatefulWidget {
  const BuildSideBarWait({super.key});

  @override
  State<BuildSideBarWait> createState() => _BuildSideBarWaitState();
}

class _BuildSideBarWaitState extends State<BuildSideBarWait> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerDistance = TextEditingController();

  late bool _selectedValue = true;
  late bool _selectedTravelValue = true;
  final TextEditingController _controllerMap = TextEditingController();
  List<Map<String, TextEditingController>> travelList = [];

  @override
  void initState() {
    super.initState();
    addNewTravel();
  }

  void addNewTravel() {
    setState(() {
      travelList.add({
        'map': TextEditingController(),
        'date': TextEditingController(),
        'distance': TextEditingController(),
        'time': TextEditingController(),
      });
    });
  }

  String _selectedTextValue = ""; // ค่าเริ่มต้นว่าง
  final List<String> _items = [
    "กองทุนหลักประกันสุขภาพท้องถิ่น (กทม.)",
    "กองทุนหลักประกันสุขภาพแห่งชาติ",
  ];
  final List<String> _itemstext = [
    "ผู้ป่วยยกเลิกนัดหมาย",
    "ไม่ระบุ",
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 551,
      color: ThemeColors().white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: 487,
                  constraints: BoxConstraints(minHeight: 0),
                  decoration: BoxDecoration(
                    color: ThemeColors().background,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons_detali/profile.svg',
                              height: 24,
                              width: 24,
                            ),
                            Text(
                              "คัดกรองข้อมูล",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: ThemeColors().lightBlue60),
                            )
                          ],
                        ),
                        SizedBox(height: 24,),
                        Container(
                          width: 439,
                          decoration: BoxDecoration(
                            color: ThemeColors().white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons_detali/inspection.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "การประเมินเคส",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColors().lightBlue60),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Radio 1 - เดินทางได้
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio<bool>(
                                            value:
                                                true, // ใช้ค่า true แทน "เดินทางได้"
                                            groupValue: _selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedValue = value ?? true;
                                              });
                                            },
                                          ),
                                          Text(
                                            "สามารถเดินทางได้",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: _selectedValue
                                                  ? ThemeColors().lightBlue60
                                                  : ThemeColors().gray70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Radio 2 - ไม่สามารถเดินทางได้
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio<bool>(
                                            value:
                                                false, // ใช้ค่า false แทน "ไม่เดินทางได้"
                                            groupValue: _selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedValue = value ?? false;
                                              });
                                            },
                                          ),
                                          Text(
                                            "ไม่สามารถเดินทางได้",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: !_selectedValue
                                                  ? ThemeColors().lightBlue60
                                                  : ThemeColors().gray70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                _selectedValue
                                    ? Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons_detali/money.svg',
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text("เบิกงบประมาณ",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: ThemeColors()
                                                          .lightBlue60,
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              width: 408,
                                              height: 48,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                color: ThemeColors()
                                                    .background, // สีพื้นหลังของ Dropdown
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value:
                                                      _selectedTextValue.isEmpty
                                                          ? null
                                                          : _selectedTextValue,
                                                  hint: Text(
                                                    "เบิกงบประมาณ", // ข้อความเริ่มต้น
                                                    style: TextStyle(
                                                      color: ThemeColors()
                                                          .gray70, // สีข้อความเริ่มต้น
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons_detali/drop.svg',
                                                    height: 24,
                                                    width: 24,
                                                  ),
                                                  dropdownColor: ThemeColors()
                                                      .background, // สีพื้นหลังของเมนู
                                                  style: TextStyle(
                                                    color: ThemeColors()
                                                        .lightBlue60, // สีข้อความเมื่อเลือกแล้ว
                                                    fontSize: 16,
                                                  ),
                                                  items: _items
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                          color: ThemeColors()
                                                              .lightBlue60, // สีของข้อความในรายการ
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      _selectedTextValue =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons_detali/ambulance.svg',
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text("รูปแบบการเดินทาง *",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: ThemeColors()
                                                          .lightBlue60,
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // Radio 1 - แบบต่อเดียว
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Radio<bool>(
                                                        value:
                                                            true, // ใช้ค่า true แทน "การเดินทาง"
                                                        groupValue:
                                                            _selectedTravelValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _selectedTravelValue =
                                                                value ?? true;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        "แบบต่อเดียว",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: _selectedTravelValue
                                                              ? ThemeColors()
                                                                  .lightBlue60
                                                              : ThemeColors()
                                                                  .gray70,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Radio 2 - แบบหลายต่อ
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Radio<bool>(
                                                        value:
                                                            false, // ใช้ค่า false แทน "ไม่เดินทางได้"
                                                        groupValue:
                                                            _selectedTravelValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _selectedTravelValue =
                                                                value ?? false;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        "แบบหลายต่อ",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: !_selectedTravelValue
                                                              ? ThemeColors()
                                                                  .lightBlue60
                                                              : ThemeColors()
                                                                  .gray70,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            _selectedTravelValue
                                                ? Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            // Dropdown แรก
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/icons_detali/category.svg', // ไอคอนของประเภทการรับส่ง
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                      color: ThemeColors()
                                                                          .orange50, // สีของไอคอน
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      "ประเภทการรับส่ง *",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Container(
                                                                  width: 195.5,
                                                                  height: 48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          24,
                                                                      vertical:
                                                                          4),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ThemeColors()
                                                                        .background, // สีพื้นหลังของ Dropdown
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child:
                                                                      DropdownButtonHideUnderline(
                                                                    child: DropdownButton<
                                                                        String>(
                                                                      value: _selectedTextValue
                                                                              .isEmpty
                                                                          ? null
                                                                          : _selectedTextValue,
                                                                      hint:
                                                                          Text(
                                                                        "ประเภทรถรับส่ง", // ข้อความเริ่มต้น
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ThemeColors().gray70, // สีข้อความเริ่มต้น
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                      ),
                                                                      icon:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                8), // ปรับตำแหน่งของไอคอน
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/icons_detali/drop.svg', // ไอคอน dropdown
                                                                          height:
                                                                              20, // ขนาดที่เล็กลง
                                                                          width:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      isDense:
                                                                          true, // ลดความสูงของ Dropdown ให้พอดีกับกล่อง
                                                                      isExpanded:
                                                                          true, // ให้ Dropdown ขยายเต็มกล่อง
                                                                      dropdownColor:
                                                                          ThemeColors()
                                                                              .background,
                                                                      style:
                                                                          TextStyle(
                                                                        color: ThemeColors()
                                                                            .lightBlue60, // สีข้อความเมื่อเลือกแล้ว
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                      items: _items.map(
                                                                          (String
                                                                              value) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              value,
                                                                          child:
                                                                              Text(
                                                                            value,
                                                                            style:
                                                                                TextStyle(
                                                                              color: ThemeColors().lightBlue60,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                      onChanged:
                                                                          (String?
                                                                              newValue) {
                                                                        setState(
                                                                            () {
                                                                          _selectedTextValue =
                                                                              newValue!;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dropdown ที่สอง
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/icons_detali/company.svg', // ไอคอนชื่อหน่วยบริการ
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                      color: ThemeColors()
                                                                          .orange50, // สีของไอคอน
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      "ชื่อหน่วยบริการรับส่ง *",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Container(
                                                                  width: 195.5,
                                                                  height: 48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          24,
                                                                      vertical:
                                                                          4),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ThemeColors()
                                                                        .background, // สีพื้นหลังของ Dropdown
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child:
                                                                      DropdownButtonHideUnderline(
                                                                    child: DropdownButton<
                                                                        String>(
                                                                      value: _selectedTextValue
                                                                              .isEmpty
                                                                          ? null
                                                                          : _selectedTextValue,
                                                                      hint:
                                                                          Text(
                                                                        "ชื่อหน่วยบริการ", // ข้อความเริ่มต้น
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ThemeColors().gray70, // สีข้อความเริ่มต้น
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                      ),
                                                                      icon:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                8), // ปรับตำแหน่งของไอคอน
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/icons_detali/drop.svg', // ไอคอน dropdown
                                                                          height:
                                                                              20, // ขนาดที่เล็กลง
                                                                          width:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      isDense:
                                                                          true, // ลดความสูงของ Dropdown ให้พอดีกับกล่อง
                                                                      isExpanded:
                                                                          true, // ให้ Dropdown ขยายเต็มกล่อง
                                                                      dropdownColor:
                                                                          ThemeColors()
                                                                              .background,
                                                                      style:
                                                                          TextStyle(
                                                                        color: ThemeColors()
                                                                            .lightBlue60, // สีข้อความเมื่อเลือกแล้ว
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                      items: _items.map(
                                                                          (String
                                                                              value) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              value,
                                                                          child:
                                                                              Text(
                                                                            value,
                                                                            style:
                                                                                TextStyle(
                                                                              color: ThemeColors().lightBlue60,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                      onChanged:
                                                                          (String?
                                                                              newValue) {
                                                                        setState(
                                                                            () {
                                                                          _selectedTextValue =
                                                                              newValue!;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 24,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons_detali/location.svg',
                                                              height: 24,
                                                              width: 24,
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                                "จุดรับส่งผู้ป่วย (ลิงก์กูเกิลแมป)",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: ThemeColors()
                                                                      .lightBlue60,
                                                                ))
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Container(
                                                          width: 408,
                                                          height: 48,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 24,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ThemeColors()
                                                                .background, // สีพื้นหลังของ TextField
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      _controllerMap,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            0), // ปรับให้ข้อความใน TextField อยู่ในตำแหน่งที่เหมาะสม
                                                                    border: InputBorder
                                                                        .none, // ซ่อนเส้นขอบ
                                                                    hintText:
                                                                        "ลิงก์กูเกิลแมป", // ข้อความเริ่มต้น
                                                                    hintStyle:
                                                                        TextStyle(
                                                                      color: ThemeColors()
                                                                          .gray70, // ✅ สีที่อ่านง่ายขึ้น
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: ThemeColors()
                                                                        .lightBlue60, // ✅ สีข้อความที่พิมพ์
                                                                  ),
                                                                  onChanged:
                                                                      (value) {
                                                                    print(
                                                                        "Input: $value"); // ✅ ดักจับข้อความใหม่
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 24,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/icons_detali/calendar.svg',
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                      color: ThemeColors()
                                                                          .orange50,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      "วันที่ให้บริการ *",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Container(
                                                                  width: 195.5,
                                                                  height: 48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ThemeColors()
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              _controllerDistance,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                "วันที่ให้บริการ",
                                                                            hintStyle:
                                                                                TextStyle(
                                                                              color: ThemeColors().gray70,
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                ThemeColors().lightBlue60,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SvgPicture
                                                                          .asset(
                                                                        'assets/icons_detali/calendar.svg', // ไอคอน Dropdown
                                                                        height:
                                                                            24,
                                                                        width:
                                                                            24,
                                                                        color: ThemeColors()
                                                                            .lightBlue70,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/icons_detali/km.svg',
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                      color: ThemeColors()
                                                                          .orange50,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      "ระยะทาง (กม.) ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Container(
                                                                  width: 195.5,
                                                                  height: 48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ThemeColors()
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              _controllerDate,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                "ระยะทาง (กม.) ",
                                                                            hintStyle:
                                                                                TextStyle(
                                                                              color: ThemeColors().gray70,
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                ThemeColors().lightBlue60,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        //!
                                                        const SizedBox(
                                                          height: 24,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/icons_detali/time.svg',
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                      color: ThemeColors()
                                                                          .orange50,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      "เวลาออกจากจุดรับผู้ป่วย",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Container(
                                                                  width: 195.5,
                                                                  height: 48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ThemeColors()
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              _controllerDistance,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                "เวลา",
                                                                            hintStyle:
                                                                                TextStyle(
                                                                              color: ThemeColors().gray70,
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                ThemeColors().lightBlue60,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SvgPicture
                                                                          .asset(
                                                                        'assets/icons_detali/time.svg', // ไอคอน Dropdown
                                                                        height:
                                                                            24,
                                                                        width:
                                                                            24,
                                                                        color: ThemeColors()
                                                                            .lightBlue70,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/icons_detali/time.svg',
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                      color: ThemeColors()
                                                                          .orange50,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    Text(
                                                                      "เวลาออกจากจุดรับผู้ป่วย",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Container(
                                                                  width: 195.5,
                                                                  height: 48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ThemeColors()
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              _controllerDistance,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                "เวลา",
                                                                            hintStyle:
                                                                                TextStyle(
                                                                              color: ThemeColors().gray70,
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                ThemeColors().lightBlue60,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SvgPicture
                                                                          .asset(
                                                                        'assets/icons_detali/time.svg', // ไอคอน Dropdown
                                                                        height:
                                                                            24,
                                                                        width:
                                                                            24,
                                                                        color: ThemeColors()
                                                                            .lightBlue70,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                :
                                                //!
                                                Column(
                                                    children: [
                                                      ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            travelList.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return buildTravelSection(
                                                              index);
                                                        },
                                                      ),
                                                      SizedBox(height: 16),
                                                      GestureDetector(
                                                        onTap: addNewTravel,
                                                        child: Container(
                                                          width: 439,
                                                          height: 48,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: ThemeColors()
                                                                    .lightBlue65),
                                                            color: ThemeColors()
                                                                .white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "เพิ่มจุดรับส่งผู้ป่วย ต่อถัดไป",
                                                              style: TextStyle(
                                                                color: ThemeColors()
                                                                    .lightBlue65,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                            //!
                                          ],
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons_detali/reason.svg',
                                                height: 24,
                                                width: 24,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text("เหตุผล *",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: ThemeColors()
                                                        .lightBlue60,
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            width: 408,
                                            height: 48,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: ThemeColors()
                                                  .background, // สีพื้นหลังของ Dropdown
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value:
                                                    _selectedTextValue.isEmpty
                                                        ? null
                                                        : _selectedTextValue,
                                                hint: Text(
                                                  "เหตุผล", // ข้อความเริ่มต้น
                                                  style: TextStyle(
                                                    color: ThemeColors()
                                                        .gray70, // สีข้อความเริ่มต้น
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                icon: SvgPicture.asset(
                                                  'assets/icons_detali/drop.svg',
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                dropdownColor: ThemeColors()
                                                    .background, // สีพื้นหลังของเมนู
                                                style: TextStyle(
                                                  color: ThemeColors()
                                                      .lightBlue60, // สีข้อความเมื่อเลือกแล้ว
                                                  fontSize: 16,
                                                ),
                                                items: _itemstext
                                                    .map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                        color: ThemeColors()
                                                            .lightBlue60, // สีของข้อความในรายการ
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _selectedTextValue =
                                                        newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons_detali/PS.svg',
                                                height: 24,
                                                width: 24,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text("หมายเหตุ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: ThemeColors()
                                                        .lightBlue60,
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            width: 408,
                                            height: 48,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ThemeColors()
                                                  .background, // สีพื้นหลังของ TextField
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    controller: _controllerMap,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              horizontal:
                                                                  0), // ปรับให้ข้อความใน TextField อยู่ในตำแหน่งที่เหมาะสม
                                                      border: InputBorder
                                                          .none, // ซ่อนเส้นขอบ
                                                      hintText:
                                                          "หมายเหตุ", // ข้อความเริ่มต้น
                                                      hintStyle: TextStyle(
                                                        color: ThemeColors()
                                                            .gray70, // ✅ สีที่อ่านง่ายขึ้น
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: ThemeColors()
                                                          .lightBlue60, // ✅ สีข้อความที่พิมพ์
                                                    ),
                                                    onChanged: (value) {
                                                      print(
                                                          "Input: $value"); // ✅ ดักจับข้อความใหม่
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                        _selectedValue
                            ? SizedBox(
                                height: 24,
                              )
                            : SizedBox(
                                height: 440,
                              ),
                        _buildConnectButton(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildConnectButton() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        width: 439,
        height: 48,
        decoration: BoxDecoration(
          color: ThemeColors().lightBlue65,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "บันทึกข้อมูล",
            style: TextStyle(
              color: ThemeColors().white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTravelSection(int index) {
    return Container(
      child: Column(
        children: [
          Divider(
            height: 1,
            color: ThemeColors().green50,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Text(
                "การเดินทาง ต่อที่ ${index + 1}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors().lightBlue60,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          buildLocationRow("จุดรับผู้ป่วย ต่อที่ ${index + 1} (ลิงก์กูเกิลแมป)",
              travelList[index]['map']!),
          SizedBox(height: 24),
          buildLocationRow(
              "จุดรับส่งผู้ป่วย (ลิงก์กูเกิลแมป)", travelList[index]['map']!),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDropdown(),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          lowdow(),
          SizedBox(
            height: 24,
          ),
          Divider(
            height: 1,
            color: ThemeColors().green50,
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hintText) {
    return Container(
      width: 408,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: ThemeColors().background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: ThemeColors().gray70,
                  fontSize: 14,
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: ThemeColors().lightBlue60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLocationRow(String text, TextEditingController controller) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons_detali/location.svg',
                height: 24, width: 24),
            SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ThemeColors().lightBlue60,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          width: 408,
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: ThemeColors().background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: text,
                    hintStyle: TextStyle(
                      color: ThemeColors().gray70,
                      fontSize: 14,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    color: ThemeColors().lightBlue60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDropdown() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dropdown แรก
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons_detali/category.svg', // ไอคอนของประเภทการรับส่ง
                    height: 24,
                    width: 24,
                    color: ThemeColors().orange50, // สีของไอคอน
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "ประเภทการรับส่ง *",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors().lightBlue60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: 195.5,
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  color: ThemeColors().background, // สีพื้นหลังของ Dropdown
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value:
                        _selectedTextValue.isEmpty ? null : _selectedTextValue,
                    hint: Text(
                      "ประเภทรถรับส่ง", // ข้อความเริ่มต้น
                      style: TextStyle(
                        color: ThemeColors().gray70, // สีข้อความเริ่มต้น
                        fontSize: 16,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(
                          right: 8), // ปรับตำแหน่งของไอคอน
                      child: SvgPicture.asset(
                        'assets/icons_detali/drop.svg', // ไอคอน dropdown
                        height: 20, // ขนาดที่เล็กลง
                        width: 20,
                      ),
                    ),
                    isDense: true, // ลดความสูงของ Dropdown ให้พอดีกับกล่อง
                    isExpanded: true, // ให้ Dropdown ขยายเต็มกล่อง
                    dropdownColor: ThemeColors().background,
                    style: TextStyle(
                      color:
                          ThemeColors().lightBlue60, // สีข้อความเมื่อเลือกแล้ว
                      fontSize: 16,
                    ),
                    items: _items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: ThemeColors().lightBlue60,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTextValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          // Dropdown ที่สอง
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons_detali/company.svg', // ไอคอนชื่อหน่วยบริการ
                    height: 24,
                    width: 24,
                    color: ThemeColors().orange50, // สีของไอคอน
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "ชื่อหน่วยบริการรับส่ง *",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors().lightBlue60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: 195.5,
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  color: ThemeColors().background, // สีพื้นหลังของ Dropdown
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value:
                        _selectedTextValue.isEmpty ? null : _selectedTextValue,
                    hint: Text(
                      "ชื่อหน่วยบริการ", // ข้อความเริ่มต้น
                      style: TextStyle(
                        color: ThemeColors().gray70, // สีข้อความเริ่มต้น
                        fontSize: 16,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(
                          right: 8), // ปรับตำแหน่งของไอคอน
                      child: SvgPicture.asset(
                        'assets/icons_detali/drop.svg', // ไอคอน dropdown
                        height: 20, // ขนาดที่เล็กลง
                        width: 20,
                      ),
                    ),
                    isDense: true, // ลดความสูงของ Dropdown ให้พอดีกับกล่อง
                    isExpanded: true, // ให้ Dropdown ขยายเต็มกล่อง
                    dropdownColor: ThemeColors().background,
                    style: TextStyle(
                      color:
                          ThemeColors().lightBlue60, // สีข้อความเมื่อเลือกแล้ว
                      fontSize: 16,
                    ),
                    items: _items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: ThemeColors().lightBlue60,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTextValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget lowdow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons_detali/calendar.svg',
                      height: 24,
                      width: 24,
                      color: ThemeColors().orange50,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "วันที่ให้บริการ *",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors().lightBlue60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: 195.5,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: ThemeColors().background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controllerDistance,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "วันที่ให้บริการ",
                            hintStyle: TextStyle(
                              color: ThemeColors().gray70,
                              fontSize: 14,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: ThemeColors().lightBlue60,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons_detali/calendar.svg', // ไอคอน Dropdown
                        height: 24,
                        width: 24,
                        color: ThemeColors().lightBlue70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons_detali/km.svg',
                      height: 24,
                      width: 24,
                      color: ThemeColors().orange50,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "ระยะทาง (กม.) ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors().lightBlue60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: 195.5,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: ThemeColors().background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controllerDate,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "ระยะทาง (กม.) ",
                            hintStyle: TextStyle(
                              color: ThemeColors().gray70,
                              fontSize: 14,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: ThemeColors().lightBlue60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        //!
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons_detali/time.svg',
                      height: 24,
                      width: 24,
                      color: ThemeColors().orange50,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "เวลาออกจากจุดรับผู้ป่วย",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors().lightBlue60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: 195.5,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: ThemeColors().background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controllerDistance,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "เวลา",
                            hintStyle: TextStyle(
                              color: ThemeColors().gray70,
                              fontSize: 14,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: ThemeColors().lightBlue60,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons_detali/time.svg', // ไอคอน Dropdown
                        height: 24,
                        width: 24,
                        color: ThemeColors().lightBlue70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons_detali/time.svg',
                      height: 24,
                      width: 24,
                      color: ThemeColors().orange50,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "เวลาออกจากจุดรับผู้ป่วย",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors().lightBlue60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: 195.5,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: ThemeColors().background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controllerDistance,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "เวลา",
                            hintStyle: TextStyle(
                              color: ThemeColors().gray70,
                              fontSize: 14,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: ThemeColors().lightBlue60,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons_detali/time.svg', // ไอคอน Dropdown
                        height: 24,
                        width: 24,
                        color: ThemeColors().lightBlue70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
