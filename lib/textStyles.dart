import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {

  //// primary purple bold text
  static final TextStyle primaryPurpleBoldText24 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.primaryPurpleColor,
    fontSize: 20.sp,
  );
  static final TextStyle primaryPurpleBoldText20 = primaryPurpleBoldText24.copyWith(fontSize: 16.5.sp);
  static final TextStyle primaryPurpleBoldText18 = primaryPurpleBoldText24.copyWith(fontSize: 15.sp);
  static final TextStyle primaryPurpleBoldText15 = primaryPurpleBoldText24.copyWith(fontSize: 12.5.sp);
  static final TextStyle primaryPurpleBoldText16 = primaryPurpleBoldText24.copyWith(fontSize: 13.5.sp);


  //// primary purple text
  static final TextStyle primaryPurpleText35 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryPurpleColor,
    fontSize: 30.sp,
  );
  static final TextStyle primaryPurpleText16 = primaryPurpleText35.copyWith(
    fontSize: 13.5.sp,
    height: 1.3.sp,
  );


  //// secondary purple bold text
  static final TextStyle secondaryPurpleBoldText12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryPurpleColor,
    fontSize: 10.sp,
  );


  //// secondary purple text
  static final TextStyle secondaryPurpleText13 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryPurpleColor,
    fontSize: 11.sp,
  );
  static final TextStyle secondaryPurpleText20 = secondaryPurpleText13.copyWith(fontSize: 16.5.sp);
  

  //// secondary light purple text
  static final TextStyle secondaryLightPurpleText12 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryLightPurpleColor,
    fontSize: 10.5.sp,
  );


  //// grey text
  static final TextStyle greyText13 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    fontSize: 11.sp,
  );
  static final TextStyle inputHintText20 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.inputHintTextColor,
    fontSize: 16.5.sp,
  );


  //// white bold text
  static final TextStyle whiteBoldText24 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 20.sp,
  );
  static final TextStyle whiteBoldText16 = whiteBoldText24.copyWith(fontSize: 13.5.sp);

}
