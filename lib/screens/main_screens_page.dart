import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/asset/menu/menu_header_bar.dart';
import 'package:flutter_rodzendai_front_end/asset/menu/menu_side_bar.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/case_1_page.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/case_2_page.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/closure_report_page.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/expense_report_page.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/new_case_page.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/overview_page.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/schedule_page.dart';
import 'package:flutter_rodzendai_front_end/screens/ui/settings_page.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class MainScreensPage extends StatefulWidget {
  const MainScreensPage({super.key});

  @override
  State<MainScreensPage> createState() => _MainScreensPageState();
}

class _MainScreensPageState extends State<MainScreensPage> {
  int selectedPageIndex = 0;
  bool isSidebarOpen = true;
  final List<Widget> pages = [
    //! หน้าที่จะเลือกเพื่อแสดง
    const OverviewPage(),
    const NewCasePage(),
    const Case1Page(),
    const Case2Page(),
    const SchedulePage(),
    const ClosureReportPage(),
    const ExpenseReportPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1440, maxHeight: 1024),
          child: Row(
            children: [
              MenuSideBar(onMenuSelected: onMenuItemSelected),
              Expanded(
                child: Container(
                  color: colorsApp.lightBlue100,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 72,
                        child: Stack(
                          children: [
                            for (int i = 0; i < pages.length; i++)
                              Visibility(
                                visible: selectedPageIndex == i,
                                maintainState: false,
                                child: pages[i],
                              ),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: MenuHeaderBar(),
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

  //! การทำงาน
  void onMenuItemSelected(int index) {
    setState(() {
      selectedPageIndex = index;
      isSidebarOpen = false;
    });
  }

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }
}
