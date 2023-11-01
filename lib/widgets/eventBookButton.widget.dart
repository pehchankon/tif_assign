import 'package:flutter/material.dart';
import 'package:tif_assign/textStyles.dart';
import '../colors.dart';

class BookButton extends StatelessWidget {
  const BookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.secondaryPurpleColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(111, 126, 201, 0.25),
            offset: Offset(0, 10),
            blurRadius: 35,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              'BOOK NOW',
              style: AppTextStyles.whiteBoldText16,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 14),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF3D56F0),
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
