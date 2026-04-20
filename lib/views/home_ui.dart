import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  // --- โทนสีใหม่: ดำ-แดง (Red & Black Edition) ---
  final Color _blackBackground = const Color(0xFF0F0F0F); // ดำลึก
  final Color _redAccent = const Color(0xFFFF1744); // แดงสด (Accent)
  final Color _unselectedGrey = const Color(0xFF555555); // เทาเข้มลึกลับ

  final List<Widget> _pages = [
    const SubAHomeUI(),
    const SubBHomeUI(),
    const SubCHomeUI(),
    const SubDHomeUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _blackBackground, // พื้นหลังของ Scaffold ทั้งหมด
      body: _pages[_selectedIndex],

      // ใช้ Container หุ้มเพื่อให้ใส่การไล่เฉดสีที่ขอบบนของ Bar ได้
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _redAccent.withOpacity(0.2), // เส้นขอบแดงบางๆ ให้ดูสมูท
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: _blackBackground,
          selectedItemColor: _redAccent, // สีแดงเด่นเมื่อเลือก
          unselectedItemColor: _unselectedGrey, // สีเทาลึกลับเมื่อไม่เลือก
          showSelectedLabels: true,
          showUnselectedLabels: true,

          // สไตล์ตัวอักษรให้ดูดุดันแต่สะอาดตา
          selectedLabelStyle: GoogleFonts.kanit(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            letterSpacing: 0.8,
          ),
          unselectedLabelStyle: GoogleFonts.kanit(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),

          items: [
            _buildAwesomeItem(FontAwesomeIcons.car, 'การเดินทาง'),
            _buildAwesomeItem(FontAwesomeIcons.kitMedical, 'อุบัติเหตุ'),
            _buildAwesomeItem(FontAwesomeIcons.piggyBank, 'ธนาคาร'),
            _buildAwesomeItem(FontAwesomeIcons.lightbulb, 'สาธารณูปโภค'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildAwesomeItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: FaIcon(
          icon,
          size: 22, // ขนาดเล็กลงนิดหน่อยเพื่อให้ดูเฉี่ยว
        ),
      ),
      // ไอคอนตอนกดเลือก ให้มีขนาดใหญ่ขึ้นเล็กน้อย (Animation เบาๆ)
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: FaIcon(
          icon,
          size: 26,
        ),
      ),
    );
  }
}
