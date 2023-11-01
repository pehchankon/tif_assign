import 'package:flutter/material.dart';
import 'package:tif_assign/textStyles.dart';

class EventDetailsRowItem extends StatelessWidget {
  const EventDetailsRowItem(
      {super.key,
      required this.topText,
      required this.bottomText,
      required this.icon});

  final String topText;
  final String bottomText;
  final Widget icon;

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
                style: AppTextStyles.primaryPurpleBoldText16,
              ),
              Text(
                bottomText,
                style: AppTextStyles.secondaryLightPurpleText12,
              )
            ],
          ),
        ],
      ),
    );
  }
}
