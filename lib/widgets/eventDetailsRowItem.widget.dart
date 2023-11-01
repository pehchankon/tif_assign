import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailsRowItem extends StatelessWidget {
  const EventDetailsRowItem(
      {super.key,
      required this.topText,
      required this.bottomText,
      required this.icon});

  final String topText;
  final String bottomText;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(width: 45, height: 45, child: icon),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                topText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                bottomText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}