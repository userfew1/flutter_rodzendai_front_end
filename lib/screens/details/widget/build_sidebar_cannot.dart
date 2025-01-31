import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class BuildSideBarCannot extends StatefulWidget {
  const BuildSideBarCannot({super.key});

  @override
  State<BuildSideBarCannot> createState() => _BuildSideBarCannotState();
}

class _BuildSideBarCannotState extends State<BuildSideBarCannot> {
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
                  constraints: BoxConstraints(minHeight: 902),
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
                              'assets/icons_detali/inspection.svg',
                              height: 24,
                              width: 24,
                              color: ThemeColors().lightBlue60,
                            ),
                            Text(
                              "ผลการประเมินเคส",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "วันที่บันทึก : 16/11/2024",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors().gray50),
                            ),
                            Text(
                              "ผู้บันทึก : สุขสันต์ วงค์สว่าง",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors().gray50),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 80,
                          width: 439,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ThemeColors().red70,
                          ),
                          child: Center(
                            child: Text(
                              "ไม่สามารถเดินทางได้",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: ThemeColors().white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "เหตุผล : ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors().lightBlue60),
                            ),
                            Text(
                              "ผู้ป่วยยกเลิกนัดหมาย",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors().gray30),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "เหตุผล : ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors().lightBlue60),
                            ),
                            Text(
                              "หมายเหตุ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors().gray30),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
