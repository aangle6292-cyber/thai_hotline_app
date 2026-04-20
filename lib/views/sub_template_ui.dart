import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/hotline_model.dart';

class SubHomeUI extends StatelessWidget {
  final String categoryTitle;
  final List<Hotline> hotlineList;
  final Color themeColor; // ในที่นี้จะถูกมองเป็น Red Accent
  final String bannerImage;
  final VoidCallback? onInfoPressed;

  const SubHomeUI({
    super.key,
    required this.categoryTitle,
    required this.hotlineList,
    required this.themeColor,
    required this.bannerImage,
    this.onInfoPressed,
  });

  // --- โทนสี Strong & Heroic (Black & Red) ---
  final Color _backgroundColor = const Color(0xFF0F0F0F); // ดำสนิท
  final Color _cardColor = const Color(0xFF1E1E1E); // เทาเข้มกึ่งโปร่งใส
  final Color _redAccent = const Color(0xFFFF1744); // แดงฮีโร่
  final Color _textSecondary = const Color(0xFFB0B0B0); // เทาอ่อน

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'THAI HOTLINE SERVICE',
          style: GoogleFonts.kanit(
            color: _redAccent.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 3.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: onInfoPressed,
            icon: Icon(Icons.info_outline, color: _redAccent),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              /// หัวข้อหมวดหมู่ (ดุดันและแข็งแกร่ง)
              Text(
                categoryTitle,
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(color: _redAccent.withOpacity(0.5), blurRadius: 10)
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// Banner พร้อมเอฟเฟกต์ Glow (แหล่งพลังงาน)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: _redAccent.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(bannerImage),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                      color: _redAccent.withOpacity(0.3), width: 1.5),
                ),
              ),
              const SizedBox(height: 32),

              /// รายการสายด่วน (สไตล์หน้าจอ Interface ฮีโร่)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotlineList.length,
                itemBuilder: (context, index) {
                  final item = hotlineList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.05),
                        width: 1.0,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      leading: _buildLogo(item),
                      title: Text(
                        item.name,
                        style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          item.number,
                          style: GoogleFonts.kanit(
                            color: _redAccent,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      trailing: _buildCallButton(item),
                    ),
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  /// โลโก้สไตล์ Clean & Sharp
  Widget _buildLogo(Hotline item) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        shape: BoxShape.circle,
        border: Border.all(color: _redAccent.withOpacity(0.4), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          item.imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.shield, color: _redAccent, size: 30),
        ),
      ),
    );
  }

  /// ปุ่มโทรทรงพลัง (Heroic Action Button)
  Widget _buildCallButton(Hotline item) {
    return InkWell(
      onTap: () => _makePhoneCall(item.number),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: _redAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: _redAccent.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.phone_in_talk_rounded,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
