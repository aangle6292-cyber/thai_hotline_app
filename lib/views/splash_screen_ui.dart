import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'introduction_call_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroductionCallUI(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // --- โทนสีดุดัน (Strong & Smooth Red-Black) ---
    const Color myBgColorEdge = Color(0xFF0F0F0F); // ดำสนิทที่ขอบ
    const Color myBgColorCenter =
        Color(0xFF2C0B0B); // แดงก่ำลึกๆ ตรงกลาง (เพิ่มมิติ)

    const Color myMainRed = Color(0xFFFF1744); // แดงสดนำสายตา
    const Color mySubTextColor = Color(0xFFB0B0B0); // เทาอ่อนสะอาดตา
    const Color myIndicatorColor = Color(0xFFFF1744);

    double customLogoSize = 240.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // --- การไล่สีแบบ Radial สร้างความลึกลับและน่าสนใจ ---
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              myBgColorCenter,
              myBgColorEdge,
            ],
            stops: [0.0, 0.8],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// --- โลโก้ พร้อมเอฟเฟกต์ Neon Glow ---
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    // เงาสีแดงจางๆ รอบโลโก้ (Glow Effect)
                    color: myMainRed.withOpacity(0.2),
                    blurRadius: 60,
                    spreadRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/splashscapp.png',
                width: customLogoSize,
                height: customLogoSize,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.contact_phone_rounded,
                  size: customLogoSize * 0.5,
                  color: myMainRed,
                ),
              ),
            ),

            const SizedBox(height: 48),

            /// --- Title: ดุดันและทรงพลัง ---
            Text(
              'THAI HOTLINE',
              style: GoogleFonts.kanit(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                letterSpacing: 4.0, // เพิ่มช่องว่างให้ดูหรูหรา
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: myMainRed.withOpacity(0.8),
                    blurRadius: 15,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            /// --- Subtitle: สมูทและอ่านง่าย ---
            Text(
              'สายด่วนไทย อุ่นใจทุกการเชื่อมต่อ',
              style: GoogleFonts.kanit(
                fontSize: 16,
                fontWeight: FontWeight.w300, // ใช้ตัวบางให้ดู Smooth
                letterSpacing: 1.5,
                color: mySubTextColor,
              ),
            ),

            const SizedBox(height: 80),

            /// --- Loading: พริ้วไหวแต่ชัดเจน ---
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                    myIndicatorColor.withOpacity(0.8)),
                backgroundColor: Colors.white10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
