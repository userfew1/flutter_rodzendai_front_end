import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMenuSection(),
        _buildSettingsPanel(),
      ],
    );
  }

  Widget _buildMenuSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "การตั้งค่า",
              style: ThemeTextStyles().head16_18(
                  fontWeight: FontWeight.w700, color: colorsApp.lightBlue60),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: menuItems.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> item = entry.value;
                return _buildMenuItem(index, item["icon"]!, item["label"]!);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsPanel() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: isExpanded ? 551 : 0,
      color: colorsApp.white,
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
                  color: colorsApp.background,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildGoogleSheetConnectionSection(),
                      _buildConnectButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogleSheetConnectionSection() {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icon_setting/links.svg',
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                "การเชื่อมต่อ google sheet",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: ThemeTextStyles().body16_18(
                  fontWeight: FontWeight.w700,
                  color: colorsApp.lightBlue60,
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
              child: Text(
                "ID หรือ Key ของ google sheet",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: ThemeTextStyles().body16_18(
                  fontWeight: FontWeight.w400,
                  color: colorsApp.lightBlue60,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorsApp.white,
          ),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "กรอก ID หรือ Key",
              hintStyle: TextStyle(
                color: colorsApp.gray70,
                fontSize: 14,
              ),
              filled: true,
              fillColor: colorsApp.white,
            ),
            onChanged: (value) {
              print("Input: $value");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConnectButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = false;
        });
      },
      child: Container(
        width: 439,
        height: 48,
        decoration: BoxDecoration(
          color: colorsApp.lightBlue65,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "เชื่อมต่อ",
            style: TextStyle(
              color: colorsApp.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

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
          color: isSelected ? colorsApp.green90 : colorsApp.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? colorsApp.green30 : Colors.transparent,
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
                color: colorsApp.gray20,
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
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: colorsApp.green30),
                softWrap: true,
                overflow: TextOverflow.visible,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
