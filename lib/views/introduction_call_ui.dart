import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_ui.dart';

class IntroductionCallUI extends StatefulWidget {
  const IntroductionCallUI({super.key});

  @override
  State<IntroductionCallUI> createState() => _IntroductionCallUIState();
}

class _IntroductionCallUIState extends State<IntroductionCallUI> {
  // --- โทนสีดุดัน (Strong & Smooth Red-Black) ---
  final Color _blackBg = const Color(0xFF0F0F0F); // ดำลึก
  final Color _greyDark = const Color(0xFF222222); // เทาเข้มเลเยอร์หลัง
  final Color _redAccent = const Color(0xFFFF1744); // แดงสด Accent
  final Color _whiteText = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // --- พื้นหลังไล่เฉดสร้างมิติความดุดัน ---
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_greyDark, _blackBg],
          ),
        ),
        child: SafeArea(
          child: IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            pages: [
              _buildPage(
                title: "สะดวกทุกการเดินทาง",
                body:
                    "รวมเบอร์โทรหน่วยงานคมนาคม เช็กจราจร หรือเหตุด่วนบนทางหลวงได้ทันที",
                imagePath: 'assets/images/subA_pic.png',
              ),
              _buildPage(
                title: "อุ่นใจเมื่อเกิดเหตุฉุกเฉิน",
                body:
                    "แจ้งเหตุด่วนเหตุร้าย ไฟไหม้ หรือกู้ชีพฉุกเฉิน 24 ชั่วโมง เพื่อความปลอดภัยของคุณ",
                imagePath: 'assets/images/subB_pic.png',
              ),
              _buildPage(
                title: "จัดการเรื่องเงินได้รวดเร็ว",
                body:
                    "เบอร์ติดต่อธนาคารชั้นนำ และบริการทางการเงินที่คุณต้องการในที่เดียว",
                imagePath: 'assets/images/subC_pic.png',
              ),
              _buildPage(
                title: "ครบเครื่องเรื่องบริการรัฐ",
                body:
                    "สาธารณูปโภคครบครัน ต่อสายตรงถึงเจ้าหน้าที่ได้ทันที ไม่ต้องเสียเวลาโทรหาหลายหน่วยงาน",
                imagePath: 'assets/images/subD_pic.png',
              ),
            ],
            onDone: () => _onIntroEnd(context),
            onSkip: () => _onIntroEnd(context),
            showSkipButton: true,

            // --- ปุ่มกดสไตล์มินิมอลแต่ชัดเจน ---
            skip: Text('ข้าม',
                style: GoogleFonts.kanit(color: Colors.white54, fontSize: 16)),
            next: Icon(Icons.arrow_forward, color: _redAccent),
            done: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _redAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _redAccent, width: 1),
              ),
              child: Text('เริ่มใช้งาน',
                  style: GoogleFonts.kanit(
                    fontWeight: FontWeight.w600,
                    color: _redAccent,
                    fontSize: 16,
                  )),
            ),

            // --- DotsDecorator สไตล์ดุดัน ---
            dotsDecorator: DotsDecorator(
              size: const Size(8.0, 8.0),
              color: Colors.white24,
              activeSize: const Size(24.0, 8.0),
              activeColor: _redAccent, // จุดที่เลือกเป็นสีแดง
              activeShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- ฟังก์ชันสร้างหน้าพร้อมเลเยอร์เงาสีแดงจางๆ ---
  PageViewModel _buildPage({
    required String title,
    required String body,
    required String imagePath,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // --- เงาสีแดงจางๆ (Red Glow) ให้ความรู้สึกดุดันแต่สมูท ---
            boxShadow: [
              BoxShadow(
                color: _redAccent.withOpacity(0.15),
                blurRadius: 30,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(
                width: double.infinity,
                height: 280,
                color: Colors.white.withOpacity(0.02),
                child: Icon(Icons.image_not_supported,
                    size: 80, color: _redAccent.withOpacity(0.3)),
              ),
            ),
          ),
        ),
      ),
      decoration: PageDecoration(
        pageColor: Colors.transparent,
        titleTextStyle: GoogleFonts.kanit(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: _whiteText,
          letterSpacing: 1.0,
        ),
        bodyTextStyle: GoogleFonts.kanit(
          fontSize: 16,
          color: Colors.white70,
          fontWeight: FontWeight.w300,
          height: 1.5,
        ),
        imagePadding: const EdgeInsets.only(top: 50, bottom: 30),
        titlePadding: const EdgeInsets.only(top: 10, bottom: 20),
        bodyPadding: const EdgeInsets.symmetric(horizontal: 32),
      ),
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeUI()),
    );
  }
}
