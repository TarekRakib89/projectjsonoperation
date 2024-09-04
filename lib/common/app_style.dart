
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


const kDark = Color(0xFF000000);
const kLight = Color(0xFFFFFFFF);
const kLightGrey = Color(0x45D1CECE);
const kLightBlue = Color(0xff3663e3);
const kWhite = Colors.white;



TextStyle appStyle(double size, Color color, FontWeight fw){
  return GoogleFonts.poppins(fontSize: size.sp, color: color,fontWeight: fw);
}