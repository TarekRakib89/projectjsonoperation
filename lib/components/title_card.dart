import 'package:flutter/material.dart';
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
          color: kLightGrey,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Text(androidVerison.title.toString(), style: appStyle(15,Colors.black, FontWeight.bold),),

    );;
  }
}
