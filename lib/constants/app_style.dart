import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyle {
  static const TextStyle headingStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor
  );

  static const TextStyle headingStyleBlack = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor
  );
  static const TextStyle headingStyleWhite = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16.0,
    color:AppColors.textColor,
  );
}
