// ✅ แยก Sidebar
import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_rodzendai_front_end/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';

class Sidebar extends StatefulWidget {
  final Function(int) onMenuSelected; // ✅ รับ callback จาก parent
  bool isExpanded;
  Sidebar({super.key, required this.onMenuSelected, this.isExpanded = true});
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isExpanded = true; // ตัวแปรสถานะ เปิด/ปิด Sidebar
  int selectedMenuIndex = 0; // ตัวแปรสำหรับเมนูที่ถูกเลือก

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      clipBehavior: Clip.antiAlias,
      width: isExpanded ? 280 : 80, // เปลี่ยนขนาดตามสถานะ
      color: ThemeColors().lightBlue60,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 4, horizontal: isExpanded ? 16 : 0),
            child: SizedBox(
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isExpanded
                      ? Row(
                          mainAxisSize: MainAxisSize
                              .min, // ทำให้ขนาดของ Row พอดีกับเนื้อหา
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ThemeColors().white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/icons/Logo.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // ✅ ใช้ Flexible แทน Expanded เพื่อป้องกัน Overflow
                            Flexible(
                              child: Text(
                                "รถเส้นด้าย",
                                style: ThemeTextStyles().body16_22(
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColors().white),
                                overflow:
                                    TextOverflow.ellipsis, // ป้องกันข้อความล้น
                                softWrap: false,
                              ),
                            ),
                          ],
                        )
                      : Expanded(
                          child: Center(
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ThemeColors().white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/icons/Logo.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                  if (isExpanded)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded; // สลับสถานะ
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons_menu/sidebar_menu.svg',
                        height: 28,
                        width: 28,
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          _buildMenuItem(0, 'ภาพรวมและสถิติ', 'assets/icons_menu/overview.svg'),
          _buildMenuItem(1, 'เคสรายการใหม่', 'assets/icons_menu/new.svg'),
          _buildMenuItem(
              2, 'เคสโครงการ 1', 'assets/icons_menu/project case 1.svg'),
          _buildMenuItem(
              3, 'เคสโครงการ 2', 'assets/icons_menu/project case 2.svg'),
          _buildMenuItem(
              4, 'ตารางเดินรถเส้นด้าย', 'assets/icons_menu/schedule.svg'),
          _buildMenuItem(5, 'รายงานการปิดเคส', 'assets/icons_menu/list.svg'),
          _buildMenuItem(6, 'รายงานค่าเดินทาง', 'assets/icons_menu/money.svg'),
          _buildMenuItem(7, 'การตั้งค่า', 'assets/icons_menu/setting.svg'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int index, String label, String iconPath) {
    bool isSelected =
        index == selectedMenuIndex; // ตรวจสอบว่าเมนูถูกเลือกหรือไม่
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMenuIndex = index; // เปลี่ยนเมนูที่เลือก
          if (!isExpanded) {
            isExpanded = true; // เปิด Sidebar ถ้ามันปิดอยู่
          }
        });
        widget.onMenuSelected(index); // ✅ ส่งค่า index ไปยัง parent
      },
      child: Container(
        height: 60,
        color: isExpanded && isSelected
            ? ThemeColors().white
            : Colors.transparent, // ไฮไลต์เมนูที่เลือกในโหมดขยาย
        padding: EdgeInsets.symmetric(
          vertical: isExpanded ? 8 : 0,
          horizontal: isExpanded ? 24 : 0,
        ),
        child: Row(
          children: [
            isExpanded
                ? SvgPicture.asset(
                    iconPath,
                    height: 24,
                    width: 24,
                    color: isSelected
                        ? ThemeColors().lightBlue60
                        : ThemeColors().white,
                  )
                : Expanded(
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? ThemeColors().white
                              : Colors.transparent,
                        ),
                        child: Center(
                          // ให้ไอคอนอยู่ตรงกลางแน่นอน
                          child: SvgPicture.asset(
                            iconPath,
                            height: 24, // ขยายขนาดขึ้นเล็กน้อย
                            width: 24,
                            color: isSelected
                                ? ThemeColors().lightBlue60
                                : ThemeColors().white,
                          ),
                        ),
                      ),
                    ),
                  ),
            if (isExpanded) const SizedBox(width: 16),
            if (isExpanded)
              Expanded(
                // ป้องกัน overflow
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis, // ป้องกันข้อความล้น
                  softWrap: false,

                  style: ThemeTextStyles().body16_22(
                      fontWeight: FontWeight.w400,
                      color: isSelected
                          ? ThemeColors().lightBlue60
                          : ThemeColors().white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
