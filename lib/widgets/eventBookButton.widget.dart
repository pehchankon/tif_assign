import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookButton extends StatelessWidget {
  const BookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 270, //TODO: add some sizing idk
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF5669FF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(111, 126, 201, 0.25), //TODO: add palatte
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
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
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
                  color: Color(0xFF3D56F0), //TODO: const
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ),
            ),
          ],
        ));
  }
}
