
import 'package:flutter/material.dart';
import 'package:projectjson/common/app_style.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final VoidCallback ontap;
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.buttonText,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: kLightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      child: Text(
        buttonText,
        style: appStyle(15, kDark, FontWeight.bold),
      ),
    );
  }
}
