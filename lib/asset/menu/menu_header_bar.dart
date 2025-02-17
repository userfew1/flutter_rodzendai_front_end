
import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/colors.dart';

class MenuHeaderBar extends StatefulWidget {
  const MenuHeaderBar({super.key});

  @override
  State<MenuHeaderBar> createState() => _MenuHeaderBarState();
}

class _MenuHeaderBarState extends State<MenuHeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: colorsApp.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), 
            blurRadius: 7, 
            spreadRadius: 0, 
            offset: const Offset(0, 4), 
          ),
        ],
      ),

      padding:
          const EdgeInsets.symmetric(horizontal: 16), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/icons_notification.svg',
                height: 24, 
                width: 24,
              ),
            ],
          ),
          const SizedBox(width: 16), 
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              Text(
                'ยินดีต้อนรับ สุขสันต์ วงค์สว่าง',
                style: ThemeTextStyles().body16_18(
                    fontWeight: FontWeight.w400, color: colorsApp.gray30),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'ผู้ดูแลระบบ',
                style: ThemeTextStyles().body12_14(
                    fontWeight: FontWeight.w500,
                    color: colorsApp.lightBlue60),
              ),
            ],
          ),
          const SizedBox(
              width: 16), 
          CircleAvatar(
            radius: 25, 
            backgroundColor: colorsApp.orange60, 
            child: SvgPicture.asset(
              'assets/icons/Logo.svg',
              height: 30, 
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
