// Header
import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/colors.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // สีเงา (ปรับความเข้มได้)
            blurRadius: 7, // ความเบลอของเงา
            spreadRadius: 0, // การกระจายของเงา
            offset: const Offset(0, 4), // ตำแหน่งเงา (X, Y)
          ),
        ],
      ),

      padding:
          const EdgeInsets.symmetric(horizontal: 16), // เพิ่ม Padding ด้านข้าง
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Icon Bell
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/icons_notification.svg',
                height: 24, // ขนาดของโลโก้ (ควรเล็กกว่าหรือเท่ารัศมี)
                width: 24,
              ),
            ],
          ),
          const SizedBox(width: 16), // ✅ เพิ่มระยะห่างระหว่าง Icon และ Text
          // Text และตำแหน่งผู้ดูแลระบบ
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end, // ✅ แก้ไขเป็น end
            children: [
              Text(
                'ยินดีต้อนรับ สุขสันต์ วงค์สว่าง',
                style: ThemeTextStyles().body16_18(
                    fontWeight: FontWeight.w400, color: ThemeColors().gray30),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'ผู้ดูแลระบบ',
                style: ThemeTextStyles().body12_14(
                    fontWeight: FontWeight.w500,
                    color: ThemeColors().lightBlue60),
              ),
            ],
          ),
          const SizedBox(
              width: 16), // ✅ เพิ่มระยะห่างระหว่าง Text และ Icon รถพยาบาล
          CircleAvatar(
            radius: 25, // ขนาดของวงกลม (48px)
            backgroundColor: ThemeColors().orange60, // พื้นหลังวงกลม
            child: SvgPicture.asset(
              'assets/icons/Logo.svg',
              height: 30, // ขนาดของโลโก้ (ควรเล็กกว่าหรือเท่ารัศมี)
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
