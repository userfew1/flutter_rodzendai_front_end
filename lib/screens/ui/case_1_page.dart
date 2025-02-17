import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/asset/widget/widget_departurelist.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/details_information.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';

class Case1Page extends StatefulWidget {
  const Case1Page({super.key});

  @override
  State<Case1Page> createState() => _Case1PageState();
}

class _Case1PageState extends State<Case1Page>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showDepartureList = true;
  String selectedCaseStatus = ""; // เพิ่มตัวแปรเพื่อเก็บค่า Status ที่ถูกกด

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: showDepartureList
            ? const EdgeInsets.all(32.0)
            : const EdgeInsets.all(0),
        child: showDepartureList
            ? Column(
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: colorsApp.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: colorsApp.orange50,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: EdgeInsets.zero,
                      labelColor: colorsApp.white,
                      unselectedLabelColor: colorsApp.orange60,
                      tabs: [
                        Container(
                          height: 48,
                          alignment: Alignment.center,
                          child: const Text('รายการขาไป'),
                        ),
                        Container(
                          height: 48,
                          alignment: Alignment.center,
                          child: const Text('รายการขากลับ'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        DepartureList(
                          onCaseSelected: (String selectedStatus) {
                            // รับค่า Status จาก DepartureList
                            setState(() {
                              showDepartureList = false; // เปลี่ยนหน้า
                              selectedCaseStatus =
                                  selectedStatus; // เก็บค่า Status ที่ถูกกด
                            });
                          },
                        ),
                        Center(
                          child: Container(
                            width: 548,
                            height: 48,
                            decoration: BoxDecoration(
                              color: colorsApp.red60,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(child: Text("Hi Me User Text")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : DetailsInformation(
                jobNumber: "",
                status: selectedCaseStatus,
                onBackPressed: () {
                  setState(() {
                    showDepartureList = true;
                  });
                },
              ));
  }
}
