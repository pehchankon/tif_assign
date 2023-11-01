import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {

  //// primary purple bold text
  static final TextStyle primaryPurpleBoldText24 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.primaryPurpleColor,
    fontSize: 24,
  );
  static final TextStyle primaryPurpleBoldText20 = primaryPurpleBoldText24.copyWith(fontSize: 20);
  static final TextStyle primaryPurpleBoldText18 = primaryPurpleBoldText24.copyWith(fontSize: 18);
  static final TextStyle primaryPurpleBoldText15 = primaryPurpleBoldText24.copyWith(fontSize: 15);
  static final TextStyle primaryPurpleBoldText16 = primaryPurpleBoldText24.copyWith(fontSize: 16);


  //// primary purple text
  static final TextStyle primaryPurpleText35 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryPurpleColor,
    fontSize: 35,
  );
  static final TextStyle primaryPurpleText16 = primaryPurpleText35.copyWith(fontSize: 16);


  //// secondary purple bold text
  static final TextStyle secondaryPurpleBoldText12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryPurpleColor,
    fontSize: 12,
  );


  //// secondary purple text
  static final TextStyle secondaryPurpleText13 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryPurpleColor,
    fontSize: 13,
  );
  static final TextStyle secondaryPurpleText20 = secondaryPurpleText13.copyWith(fontSize: 20);
  

  //// secondary light purple text
  static final TextStyle secondaryLightPurpleText12 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryLightPurpleColor,
    fontSize: 12,
  );


  //// grey text
  static final TextStyle greyText13 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    fontSize: 13,
  );
  static final TextStyle inputHintText20 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.inputHintTextColor,
    fontSize: 20,
  );


  //// white bold text
  static final TextStyle whiteBoldText24 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 24,
  );
  static final TextStyle whiteBoldText16 = whiteBoldText24.copyWith(fontSize: 16);

}
