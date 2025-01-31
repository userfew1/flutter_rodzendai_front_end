import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_rodzendai_front_end/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isExpanded = false;
  int selectedIndex = -1;
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> menuItems = [
    {"icon": "assets/icon_setting/car.svg", "label": "ประเภทการ\nเดินทางเอกชน"},
    {"icon": "assets/icon_setting/person1.svg", "label": "ผู้ใช้งาน"},
    {"icon": "assets/icon_setting/carAL.svg", "label": "รถพยาบาล\nเส้นด้าย"},
    {"icon": "assets/icon_setting/person2.svg", "label": "ผู้ขับรถ\nพยาบาล"},
    {
      "icon": "assets/icon_setting/googlesheet.svg",
      "label": "การเชื่อมต่อ google sheet"
    },
  ];
  @override
  void dispose() {
    _controller.dispose(); // ✅ ล้าง Controller เมื่อ Widget ถูกทำลาย
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ กล่องเมนู
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "การตั้งค่า",
                  style: ThemeTextStyles().head16_18(
                      fontWeight: FontWeight.w700,
                      color: ThemeColors().lightBlue60),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16, // ระยะห่างระหว่างกล่องแนวนอน
                  runSpacing: 16, // ระยะห่างระหว่างกล่องแนวตั้ง
                  children: menuItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, String> item = entry.value;
                    return _buildMenuItem(index, item["icon"]!, item["label"]!);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),

        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: isExpanded ? 551 : 0,
          color: ThemeColors().white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      width: 487,
                      height: 872,
                      decoration: BoxDecoration(
                        color: ThemeColors().background,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.05), // สีเงา (ปรับความเข้มได้)
                            blurRadius: 10, // ความเบลอของเงา
                            spreadRadius: 0, // การกระจายของเงา
                            offset: const Offset(0, 2), // ตำแหน่งเงา (X, Y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icon_setting/links.svg',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  // ✅ ห่อด้วย Expanded เพื่อป้องกันล้นแนวนอน
                                  child: Text(
                                    "การเชื่อมต่อ google sheet",
                                    overflow: TextOverflow
                                        .ellipsis, // ป้องกันข้อความล้น
                                    softWrap: false,
                                    style: ThemeTextStyles().body16_18(
                                      fontWeight: FontWeight.w700,
                                      color: ThemeColors().lightBlue60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icon_setting/id_crad.svg',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  // ✅ ห่อด้วย Expanded เพื่อป้องกันล้นแนวนอน
                                  child: Text(
                                    "ID หรือ Key ของ google sheet",
                                    overflow: TextOverflow
                                        .ellipsis, // ป้องกันข้อความล้น
                                    softWrap: false,
                                    style: ThemeTextStyles().body16_18(
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColors().lightBlue60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // ✅ TextField พร้อม TextEditingController
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8), // ขอบมน
                                color: ThemeColors().white,
                              ),
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "กรอก ID หรือ Key",
                                  hintStyle: TextStyle(
                                    color: ThemeColors()
                                        .gray70, // ✅ สีที่อ่านง่ายขึ้น
                                    fontSize: 14,
                                  ),
                                  filled: true,
                                  fillColor: ThemeColors().white,
                                ),
                                onChanged: (value) {
                                  print("Input: $value"); // ✅ ดักจับข้อความใหม่
                                },
                              ),
                            ),],),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = false;
                                });
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
                                    "เชื่อมต่อ",
                                    style: TextStyle(
                                      color: ThemeColors().white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMenuItem(int index, String iconPath, String label) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedIndex == index) {
            selectedIndex = -1;
            isExpanded = false;
          } else {
            selectedIndex = index;
            isExpanded = true;
          }
        });
      },
      child: Container(
        width: 176,
        height: 72,
        decoration: BoxDecoration(
          color: isSelected ? ThemeColors().green90 : ThemeColors().white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? ThemeColors().green30 : Colors.transparent,
            width: isSelected ? 1 : 0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 0,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: ThemeColors().gray20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // ✅ ใช้ Expanded เพื่อให้ Text มีพื้นที่ขึ้นบรรทัดใหม่
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors().green30),

                softWrap: true, // ✅ ให้ขึ้นบรรทัดใหม่เมื่อจำเป็น
                overflow: TextOverflow.visible, // ✅ ป้องกันการตัดข้อความ
                maxLines: 2, // ✅ จำกัดสูงสุด 2 บรรทัด
                textAlign: TextAlign.start, // ✅ จัดให้ข้อความอยู่ตรงกลาง
              ),
            ),
          ],
        ),
      ),
    );
  }
}
