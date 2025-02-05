import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/api/get_google_sheet.dart';
import 'package:flutter_rodzendai_front_end/screens/closecasereport_page.dart';
import 'package:flutter_rodzendai_front_end/screens/dashboard_page.dart';
import 'package:flutter_rodzendai_front_end/screens/menu/header_at.dart';
import 'package:flutter_rodzendai_front_end/screens/menu/sidebar_at.dart';
import 'package:flutter_rodzendai_front_end/screens/newcase_page.dart';
import 'package:flutter_rodzendai_front_end/screens/projectcase1_page.dart';
import 'package:flutter_rodzendai_front_end/screens/projectcase2_page.dart';
import 'package:flutter_rodzendai_front_end/screens/schedule_page.dart';
import 'package:flutter_rodzendai_front_end/screens/settings_page.dart';
import 'package:flutter_rodzendai_front_end/screens/travelreport_page.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class ScreensPage extends StatefulWidget {
  const ScreensPage({super.key});

  @override
  State<ScreensPage> createState() => _ScreensPageState();
}

class _ScreensPageState extends State<ScreensPage> {
  final themeColors = ThemeColors();
  int selectedPageIndex = 0;
  bool isSidebarOpen = true; // ✅ ตัวแปรควบคุม Sidebar

  // ✅ ฟังก์ชันเปลี่ยนหน้าและปิด Sidebar
  void onMenuItemSelected(int index) {
    setState(() {
      selectedPageIndex = index;
      isSidebarOpen = false; // ✅ ปิด Sidebar ทันทีที่เปลี่ยนหน้า
    });
  }

  // ✅ ฟังก์ชันเปิด/ปิด Sidebar
  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  // ✅ รายการหน้าต่างๆ ที่จะเปลี่ยนไป
  final List<Widget> pages = [
    const DashboardPage(),
    KeyedSubtree(
        key: UniqueKey(),
        child: NewCasePage()), // ✅ Use KeyedSubtree with UniqueKey()
    const ProjectCase1Page(),
    const ProjectCase2Page(),
    const SchedulePage(),
    const CloseCaseReportPage(),
    const TravelReportPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1440, maxHeight: 1024),
          child: Row(
            children: [
              // ✅ ส่ง callback ไปที่ Sidebar เพื่อให้เปลี่ยนหน้าได้
              Sidebar(onMenuSelected: onMenuItemSelected),

              Expanded(
                child: Container(
                  color: themeColors.lightBlue100,
                  child: Stack(
                    children: [
                      // ✅ Wrapper for content pages (ensures layout stability)
                      Positioned.fill(
                        top: 72,
                        child: Stack(
                          children: [
                            for (int i = 0; i < pages.length; i++)
                              Visibility(
                                visible: selectedPageIndex == i,
                                maintainState:
                                    false, // ✅ Disable state retention for reset effect
                                child: pages[i],
                              ),
                          ],
                        ),
                      ),

                      // ✅ Header stays on top
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Header(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
