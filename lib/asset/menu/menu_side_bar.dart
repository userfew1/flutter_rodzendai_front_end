import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_rodzendai_front_end/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MenuSideBar extends StatefulWidget {
  final Function(int) onMenuSelected;
  bool isExpanded;
  MenuSideBar(
      {super.key, required this.onMenuSelected, this.isExpanded = true});

  @override
  State<MenuSideBar> createState() => _MenuSideBarState();
}

class _MenuSideBarState extends State<MenuSideBar> {
  bool isExpanded = true;
  int selectedMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isExpanded ? 280 : 80,
      color: colorsApp.lightBlue60,
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 28),
          ..._menuItems
              .asMap()
              .entries
              .map((entry) => _buildMenuItem(entry.key, entry.value)),
        ],
      ),
    );
  }

Widget _buildHeader() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final shouldShowIcon = constraints.maxWidth >= 280;
      final shouldPadding = constraints.maxWidth >= 90;

      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: shouldPadding ? 16 : 0),
        child: SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildLogo(),
              ),
              if (shouldShowIcon)
                GestureDetector(
                  onTap: () => setState(() => isExpanded = !isExpanded),
                  child: SvgPicture.asset(
                    'assets/icons_menu/sidebar_menu.svg',
                    height: 28,
                    width: 28,
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}
  Widget _buildLogo() {
  return isExpanded
      ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _logoContainer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isExpanded ? 16 : 0,
            ),
            Flexible(
              child: Text(
                "รถเส้นด้าย",
                style: ThemeTextStyles().body16_22(
                    fontWeight: FontWeight.w400, color: colorsApp.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      : Center(child: _logoContainer());
}

  Widget _logoContainer() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(shape: BoxShape.circle, color: colorsApp.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset('assets/icons/Logo.svg', height: 24, width: 24),
      ),
    );
  }

  Widget _buildMenuItem(int index, Map<String, String> menu) {
    bool isSelected = index == selectedMenuIndex;
    return LayoutBuilder(builder: (context, constraints) {
      final shouldPadding = constraints.maxWidth >= 90;
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedMenuIndex = index;
            if (!isExpanded) {
              isExpanded = true;
            }
          });
          widget.onMenuSelected(index);
        },
        child: Container(
          height: 60,
          color:
              isExpanded && isSelected ? colorsApp.white : Colors.transparent,
          padding: EdgeInsets.symmetric(
              vertical: isExpanded ? 8 : 0, horizontal: shouldPadding ? 24 : 0),
          child: Row(
            children: [
              _buildIcon(menu['iconPath']!, isSelected),
              if (isExpanded) ...[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isExpanded ? 16 : 0,
                ),
                Expanded(
                  child: Text(
                    menu['label']!,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeTextStyles().body16_22(
                      fontWeight: FontWeight.w400,
                      color:
                          isSelected ? colorsApp.lightBlue60 : colorsApp.white,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      );
    });
  }

  Widget _buildIcon(String iconPath, bool isSelected) {
    return isExpanded
        ? SvgPicture.asset(iconPath,
            height: 24,
            width: 24,
            color: isSelected ? colorsApp.lightBlue60 : colorsApp.white)
        : Expanded(
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? colorsApp.white : Colors.transparent),
                child: Center(
                  child: SvgPicture.asset(iconPath,
                      height: 24,
                      width: 24,
                      color:
                          isSelected ? colorsApp.lightBlue60 : colorsApp.white),
                ),
              ),
            ),
          );
  }

  final List<Map<String, String>> _menuItems = [
    {'label': 'ภาพรวมและสถิติ', 'iconPath': 'assets/icons_menu/overview.svg'},
    {'label': 'เคสรายการใหม่', 'iconPath': 'assets/icons_menu/new.svg'},
    {
      'label': 'เคสโครงการ 1',
      'iconPath': 'assets/icons_menu/project case 1.svg'
    },
    {
      'label': 'เคสโครงการ 2',
      'iconPath': 'assets/icons_menu/project case 2.svg'
    },
    {
      'label': 'ตารางเดินรถเส้นด้าย',
      'iconPath': 'assets/icons_menu/schedule.svg'
    },
    {'label': 'รายงานการปิดเคส', 'iconPath': 'assets/icons_menu/list.svg'},
    {'label': 'รายงานค่าเดินทาง', 'iconPath': 'assets/icons_menu/money.svg'},
    {'label': 'การตั้งค่า', 'iconPath': 'assets/icons_menu/setting.svg'},
  ];
}
