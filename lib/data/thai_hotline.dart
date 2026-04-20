import 'package:flutter/material.dart';
import '../models/hotline_model.dart';

class HotlineData {
  // --- Heroic Color Palette (Red Night Edition) ---
  // แดงสดสำหรับความช่วยเหลือและการเดินทาง
  static const Color _redTravel = Color(0xFFFF1744);
  // แดงเข้ม/สว่างสลับกันสำหรับเหตุฉุกเฉิน (เน้นความอันตราย/เร่งด่วน)
  static const Color _redEmergency = Color(0xFFFF1744);
  // แดงอมเทาหรือแดงเข้มสำหรับธนาคาร (เน้นความมั่นคง)
  static const Color _redBank = Color(0xFFD50000);
  // แดงส้มสำหรับสาธารณูปโภค (เน้นการบริการ)
  static const Color _redUtility = Color(0xFFFF5252);

  // --- หมวด A: การเดินทาง (Travel) ---
  static List<Hotline> travelHotlines = [
    Hotline(
        name: "กรมทางหลวงชนบท",
        number: "1146",
        imagePath: "assets/images/1146.png",
        themeColor: _redTravel),
    Hotline(
        name: "ตำรวจท่องเที่ยว",
        number: "1155",
        imagePath: "assets/images/1155.png",
        themeColor: _redTravel),
    Hotline(
        name: "ตำรวจทางหลวง",
        number: "1193",
        imagePath: "assets/images/1193.png",
        themeColor: _redTravel),
    Hotline(
        name: "ข้อมูลจราจร",
        number: "1197",
        imagePath: "assets/images/1197.jpg",
        themeColor: _redTravel),
    Hotline(
        name: "ขสมก.",
        number: "1348",
        imagePath: "assets/images/1348.png",
        themeColor: _redTravel),
    Hotline(
        name: "บขส.",
        number: "1490",
        imagePath: "assets/images/1490.png",
        themeColor: _redTravel),
    Hotline(
        name: "เส้นทางบนทางด่วน",
        number: "1543",
        imagePath: "assets/images/1543.png",
        themeColor: _redTravel),
    Hotline(
        name: "การรถไฟแห่งประเทศไทย",
        number: "1690",
        imagePath: "assets/images/1690.png",
        themeColor: _redTravel),
    Hotline(
        name: "กรมทางหลวง",
        number: "1586",
        imagePath: "assets/images/1586.png",
        themeColor: _redTravel),
  ];

  // --- หมวด B: อุบัติเหตุ-เหตุฉุกเฉิน (Emergency) ---
  static List<Hotline> emergencyHotlines = [
    Hotline(
        name: "เหตุด่วนเหตุร้าย",
        number: "191",
        imagePath: "assets/images/191.png",
        themeColor: _redEmergency),
    Hotline(
        name: "แจ้งไฟไหม้/สัตว์เข้าบ้าน",
        number: "199",
        imagePath: "assets/images/199.png",
        themeColor: _redEmergency),
    Hotline(
        name: "สายด่วนรถหาย",
        number: "1192",
        imagePath: "assets/images/1192.png",
        themeColor: _redEmergency),
    Hotline(
        name: "อุบัติเหตุทางน้ำ",
        number: "1196",
        imagePath: "assets/images/1196.jpg",
        themeColor: _redEmergency),
    Hotline(
        name: "แจ้งคนหาย",
        number: "1300",
        imagePath: "assets/images/1300.jpg",
        themeColor: _redEmergency),
    Hotline(
        name: "ศูนย์ปลอดภัยคมนาคม",
        number: "1356",
        imagePath: "assets/images/1356.png",
        themeColor: _redEmergency),
    Hotline(
        name: "หน่วยแพทย์กู้ชีพ",
        number: "1554",
        imagePath: "assets/images/1554.jpg",
        themeColor: _redEmergency),
    Hotline(
        name: "ศูนย์เอราวัณ",
        number: "1646",
        imagePath: "assets/images/1646.jpg",
        themeColor: _redEmergency),
    Hotline(
        name: "เจ็บป่วยฉุกเฉิน (สพฉ.)",
        number: "1669",
        imagePath: "assets/images/1669.jpg",
        themeColor: _redEmergency),
  ];

  // --- หมวด C: ธนาคาร (Bank) ---
  static List<Hotline> bankHotlines = [
    Hotline(
        name: "ธนาคารกรุงเทพ",
        number: "1333",
        imagePath: "assets/images/1333.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารออมสิน",
        number: "1115",
        imagePath: "assets/images/1115.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารกสิกรไทย",
        number: "028888888",
        imagePath: "assets/images/028888888.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารกรุงไทย",
        number: "021111111",
        imagePath: "assets/images/021111111.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารกรุงศรี",
        number: "1572",
        imagePath: "assets/images/1572.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารไทยพาณิชย์",
        number: "027777777",
        imagePath: "assets/images/027777777.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารธนาชาติ",
        number: "1428",
        imagePath: "assets/images/1428.png",
        themeColor: _redBank),
    Hotline(
        name: "citibank",
        number: "1588",
        imagePath: "assets/images/1588.png",
        themeColor: _redBank),
    Hotline(
        name: "LHBANK",
        number: "1327",
        imagePath: "assets/images/1327.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารอาคารสงเคราะห์",
        number: "026459000",
        imagePath: "assets/images/026459000.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารเกียรตินาคินภัทร",
        number: "021655555",
        imagePath: "assets/images/021655555.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารซีไอเอ็มบีไทย",
        number: "026267777",
        imagePath: "assets/images/026267777.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารไทยเครดิต",
        number: "026975454",
        imagePath: "assets/images/026975454.png",
        themeColor: _redBank),
    Hotline(
        name: "UOB",
        number: "022851555",
        imagePath: "assets/images/022851555.png",
        themeColor: _redBank),
    Hotline(
        name: "TISCO",
        number: "026336000",
        imagePath: "assets/images/026336000.png",
        themeColor: _redBank),
    Hotline(
        name: "ธนาคารอิสลาม แห่งประเทศไทย",
        number: "022042766",
        imagePath: "assets/images/022042766.png",
        themeColor: _redBank),
  ];

  // --- หมวด D: สาธารณูปโภค (Utility) ---
  static List<Hotline> utilityHotlines = [
    Hotline(
        name: "ไฟฟ้านครหลวง",
        number: "1130",
        imagePath: "assets/images/1130.png",
        themeColor: _redUtility),
    Hotline(
        name: "ไฟฟ้าส่วนภูมิภาค",
        number: "1129",
        imagePath: "assets/images/1129.png",
        themeColor: _redUtility),
    Hotline(
        name: "ไฟฟ้าฝ่ายผลิต",
        number: "1416",
        imagePath: "assets/images/1416.png",
        themeColor: _redUtility),
    Hotline(
        name: "การประปานครหลวง",
        number: "1125",
        imagePath: "assets/images/1125.png",
        themeColor: _redUtility),
    Hotline(
        name: "การประปาส่วนภูมิภาค",
        number: "1662",
        imagePath: "assets/images/1662.png",
        themeColor: _redUtility),
    Hotline(
        name: "True",
        number: "1242",
        imagePath: "assets/images/1242.png",
        themeColor: _redUtility),
    Hotline(
        name: "Dtac",
        number: "1678",
        imagePath: "assets/images/1678.png",
        themeColor: _redUtility),
    Hotline(
        name: "AIS",
        number: "1175",
        imagePath: "assets/images/1175.png",
        themeColor: _redUtility),
    Hotline(
        name: "TOT/NT",
        number: "1100",
        imagePath: "assets/images/1100.png",
        themeColor: _redUtility),
  ];
}
