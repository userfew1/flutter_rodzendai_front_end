import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarPendingScreening extends StatefulWidget {
  const BarPendingScreening({super.key});

  @override
  State<BarPendingScreening> createState() => _BarPendingScreeningState();
}

class _BarPendingScreeningState extends State<BarPendingScreening> {
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerDistance = TextEditingController();
  final TextEditingController _dateofservice = TextEditingController();
  final TextEditingController _timefromleaving = TextEditingController();
  final TextEditingController _timetoreach = TextEditingController();
  final TextEditingController _controllerMap = TextEditingController();
  String? _selectedValue;
  bool _selectedValueCK = true;
  late bool _selectedTravelValue = true;
  List<Map<String, TextEditingController>> travelList = [];



  Map<String, dynamic> loadSelected = {};

  @override
void initState() {
  super.initState();
  addNewTravel();
  _generateMockData();
}

void _generateMockData() {
  setState(() {
    _controllerDate.text = "2025-02-15";
    _controllerDistance.text = "12.5";
    _dateofservice.text = "2025-02-15";
    _timefromleaving.text = "08:30";
    _timetoreach.text = "09:15";
    _controllerMap.text = "https://maps.google.com/?q=13.7563,100.5018";

    _selectedValue = "สามารถเดินทางได้";
    _selectedValueCK = true;
    _selectedTravelValue = true;
    _selectedTextValue = "กองทุนหลักประกันสุขภาพแห่งชาติ";
    shuttleType = "รถแท็กซี่";
    nameoftransfer = "ศูนย์รถแท็กซี่";

    travelList = List.generate(2, (index) {
      return {
        'map': TextEditingController(text: "https://maps.google.com/?q=13.7$index,100.5$index"),
        'date': TextEditingController(text: "2025-02-${15 + index}"),
        'distance': TextEditingController(text: "${(index + 1) * 10}"),
        'time': TextEditingController(text: "${(index + 8)}:00"),
      };
    });
  });
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


  String _selectedTextValue = "";
  String shuttleType = "";
  String nameoftransfer = "";
  final List<String> _items = [
    "กองทุนหลักประกันสุขภาพท้องถิ่น (กทม.)",
    "กองทุนหลักประกันสุขภาพแห่งชาติ",
  ];

  final List<String> _shuttleType = [
    "รถแท็กซี่",
    "รถทัวร์",
    "รถท้องถิ่น",
    "รถไฟ",
    "เครื่องบิน",
    "รถเส้นด้าย"
  ];
  final List<String> _nameoftransfer = [
    "ศูนย์รถแท็กซี่",
    "ศูนย์รถทัวร์",
    "ศูนย์รถท้องถิ่น",
    "ศูนย์รถไฟ",
    "ศูนย์เครื่องบิน",
    "ศูนย์รถเส้นด้าย",
    "Bolt"
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
                  constraints: const BoxConstraints(minHeight: 0),
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
                        const SizedBox(
                          height: 24,
                        ),
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
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: "สามารถเดินทางได้",
                                            groupValue: _selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedValue = value!;
                                                _selectedValueCK = true;
                                            
                       
                                              });
                                            },
                                          ),
                                          Text(
                                            "สามารถเดินทางได้",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: "สามารถเดินทางได้" ==
                                                      _selectedValue
                                                  ? ThemeColors().lightBlue60
                                                  : ThemeColors().gray70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: "ไม่สามารถเดินทางได้",
                                            groupValue: _selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedValue = value!;
                                                _selectedValueCK = false;
                        
        
                                              });
                                            },
                                          ),
                                          Text(
                                            "ไม่สามารถเดินทางได้",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: "ไม่สามารถเดินทางได้" ==
                                                      _selectedValue
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
                                _selectedValueCK
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
                                                color: ThemeColors().background,
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
                                                    "เบิกงบประมาณ",
                                                    style: TextStyle(
                                                      color:
                                                          ThemeColors().gray70,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons_detali/drop.svg',
                                                    height: 24,
                                                    width: 24,
                                                  ),
                                                  dropdownColor:
                                                      ThemeColors().background,
                                                  style: TextStyle(
                                                    color: ThemeColors()
                                                        .lightBlue60,
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
                                                              .lightBlue60,
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
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Radio<bool>(
                                                        value: true,
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
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Radio<bool>(
                                                        value: false,
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
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/icons_detali/category.svg',
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
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child:
                                                                      DropdownButtonHideUnderline(
                                                                    child: DropdownButton<
                                                                        String>(
                                                                      value: shuttleType
                                                                              .isEmpty
                                                                          ? null
                                                                          : shuttleType,
                                                                      hint:
                                                                          Text(
                                                                        "ประเภทรถรับส่ง",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ThemeColors().gray70,
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                      ),
                                                                      icon:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                8),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/icons_detali/drop.svg',
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      isDense:
                                                                          true,
                                                                      isExpanded:
                                                                          true,
                                                                      dropdownColor:
                                                                          ThemeColors()
                                                                              .background,
                                                                      style:
                                                                          TextStyle(
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                      items: _shuttleType.map(
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
                                                                          shuttleType =
                                                                              newValue!;
                                                                        
                                                                        });
                                                                      },
                                                                    ),
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
                                                                      'assets/icons_detali/company.svg',
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
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child:
                                                                      DropdownButtonHideUnderline(
                                                                    child: DropdownButton<
                                                                        String>(
                                                                      value: nameoftransfer
                                                                              .isEmpty
                                                                          ? null
                                                                          : nameoftransfer,
                                                                      hint:
                                                                          Text(
                                                                        "ชื่อหน่วยบริการ",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ThemeColors().gray70,
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                      ),
                                                                      icon:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                8),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/icons_detali/drop.svg',
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      isDense:
                                                                          true,
                                                                      isExpanded:
                                                                          true,
                                                                      dropdownColor:
                                                                          ThemeColors()
                                                                              .background,
                                                                      style:
                                                                          TextStyle(
                                                                        color: ThemeColors()
                                                                            .lightBlue60,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                      items: _nameoftransfer.map(
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
                                                                          nameoftransfer =
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
                                                                .background,
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
                                                                            0),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    hintText:
                                                                        "ลิงก์กูเกิลแมป",
                                                                    hintStyle:
                                                                        TextStyle(
                                                                      color: ThemeColors()
                                                                          .gray70,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: ThemeColors()
                                                                        .lightBlue60,
                                                                  ),
                                                                  onChanged:
                                                                      (value) {
                                                                  
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
                                                                              _dateofservice,
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
                                                                        'assets/icons_detali/calendar.svg',
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
                                                                              _timefromleaving,
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
                                                                        'assets/icons_detali/time.svg',
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
                                                                      "เวลาถึงจุดส่งผู้ป่วย",
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
                                                                              _timetoreach,
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
                                                                        'assets/icons_detali/time.svg',
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
                                                : Column(
                                                    children: [
                                                      ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            travelList.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return buildTravelSection(
                                                              index);
                                                        },
                                                      ),
                                                      const SizedBox(height: 16),
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
                                              color: ThemeColors().background,
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
                                                  "เหตุผล",
                                                  style: TextStyle(
                                                    color: ThemeColors().gray70,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                icon: SvgPicture.asset(
                                                  'assets/icons_detali/drop.svg',
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                dropdownColor:
                                                    ThemeColors().background,
                                                style: TextStyle(
                                                  color:
                                                      ThemeColors().lightBlue60,
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
                                                            .lightBlue60,
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
                                          const SizedBox(
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
                                              color: ThemeColors().background,
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
                                                              horizontal: 0),
                                                      border: InputBorder.none,
                                                      hintText: "หมายเหตุ",
                                                      hintStyle: TextStyle(
                                                        color: ThemeColors()
                                                            .gray70,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: ThemeColors()
                                                          .lightBlue60,
                                                    ),
                                                    onChanged: (value) {
                                                      print("Input: $value");
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
                        _selectedValueCK
                            ? const SizedBox(
                                height: 24,
                              )
                            : const SizedBox(
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
      onTap: (){},
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
          const SizedBox(height: 24),
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
          const SizedBox(height: 24),
          buildLocationRow("จุดรับผู้ป่วย ต่อที่ ${index + 1} (ลิงก์กูเกิลแมป)",
              travelList[index]['map']!),
          const SizedBox(height: 24),
          buildLocationRow(
              "จุดรับส่งผู้ป่วย (ลิงก์กูเกิลแมป)", travelList[index]['map']!),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDropdown(),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          lowdow(),
          const SizedBox(
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
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
            const SizedBox(width: 4),
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
        const SizedBox(height: 8),
        Container(
          width: 408,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons_detali/category.svg',
                    height: 24,
                    width: 24,
                    color: ThemeColors().orange50,
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
                  color: ThemeColors().background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value:
                        _selectedTextValue.isEmpty ? null : _selectedTextValue,
                    hint: Text(
                      "ประเภทรถรับส่ง",
                      style: TextStyle(
                        color: ThemeColors().gray70,
                        fontSize: 16,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        'assets/icons_detali/drop.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    isDense: true,
                    isExpanded: true,
                    dropdownColor: ThemeColors().background,
                    style: TextStyle(
                      color: ThemeColors().lightBlue60,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons_detali/company.svg',
                    height: 24,
                    width: 24,
                    color: ThemeColors().orange50,
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
                  color: ThemeColors().background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value:
                        _selectedTextValue.isEmpty ? null : _selectedTextValue,
                    hint: Text(
                      "ชื่อหน่วยบริการ",
                      style: TextStyle(
                        color: ThemeColors().gray70,
                        fontSize: 16,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        'assets/icons_detali/drop.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    isDense: true,
                    isExpanded: true,
                    dropdownColor: ThemeColors().background,
                    style: TextStyle(
                      color: ThemeColors().lightBlue60,
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
                        'assets/icons_detali/calendar.svg',
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
                        'assets/icons_detali/time.svg',
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
                        'assets/icons_detali/time.svg',
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
