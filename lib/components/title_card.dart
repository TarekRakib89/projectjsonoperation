import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectjson/android_verison.dart';
import '../common/app_style.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key,required this.androidVerison});
  final AndroidVerison androidVerison;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          color: kDark,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Text(androidVerison.title.toString(), style: appStyle(13.sp,kWhite, FontWeight.bold),overflow: TextOverflow.ellipsis,),

    );;
  }
}
