import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  // --- โทนสี Strong & Smooth (Black & Red Edition) ---
  final Color myBackgroundColorCenter = const Color(0xFF0F0F0F); // ดำลึก
  final Color myBackgroundColorEdge = const Color(0xFF232323); // เทาดำ
  final Color myTextColorMain = const Color(0xFFE53935); // แดงหลัก
  final Color myTextColorSub =
      const Color(0xFFB0B0B0); // เทาอ่อน (เพื่อความสมูท)
  final Color myAccentColor = const Color(0xFFFF1744); // แดงสด (Accent)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // --- 1. พื้นหลังไล่เฉด ดำ-เทาดำ ---
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  myBackgroundColorEdge,
                  myBackgroundColorCenter,
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),

          // --- 2. เนื้อหาหลัก ---
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: myTextColorSub),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'สายด่วน THAILAND',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),

                      /// หัวข้อ
                      Text(
                        'ผู้จัดทำ',
                        style: GoogleFonts.kanit(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0,
                          color: myTextColorMain, // ใช้สีแดงนำสายตา
                        ),
                      ),
                      const SizedBox(height: 32),

                      /// โลโก้มหาวิทยาลัย (ปรับพื้นหลังให้เข้ากับธีมดำ)
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: myAccentColor.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'assets/images/Logosau.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Icon(
                                Icons.school_rounded,
                                size: 50,
                                color: myAccentColor.withOpacity(0.5)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      Text(
                        'มหาวิทยาลัยเอเชียอาคเนย์',
                        style: GoogleFonts.kanit(
                          fontSize: 16,
                          color: Colors.white70,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 40),

                      /// --- รูปโปรไฟล์ ดีไซน์ใหม่ให้ดูแข็งแกร่ง (Strong Frame) ---
                      Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: myAccentColor.withOpacity(0.15),
                              blurRadius: 30,
                              spreadRadius: 5,
                            )
                          ],
                        ),
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: myAccentColor,
                                      width: 3.0,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 75,
                                    backgroundColor: Colors.black26,
                                    backgroundImage:
                                        AssetImage('assets/images/media.jpg'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 48),

                      /// --- ข้อมูลนักศึกษา (ปรับสีเน้นแดง-ขาว) ---
                      _buildSimpleInfo(
                          'รหัสนักศึกษา', '6619410028', myAccentColor),
                      _buildSimpleInfo('ชื่อ-สกุลนักศึกษา', 'นาย สุกิจ เมนซี่',
                          Colors.white),
                      _buildSimpleInfo('อีเมล์นักศึกษา',
                          's6619410028@sau.ac.th', myTextColorSub),
                      _buildSimpleInfo(
                          'ชื่อสาขาวิชา', 'วิศวกรรมคอมพิวเตอร์', myAccentColor),
                      _buildSimpleInfo(
                          'ชื่อคณะ', 'คณะวิศวกรรมศาสตร์', myAccentColor),

                      const SizedBox(height: 72),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleInfo(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.kanit(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.4),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.kanit(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: valueColor,
            ),
          ),
          // เพิ่มเส้นขีดเล็กๆ เพื่อความ Smooth และดูเป็นระเบียบ
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 1,
            color: myAccentColor.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
