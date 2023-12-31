import 'package:flutter/material.dart';
import 'package:tif_assign/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.secondaryPurpleColor,
      ),
    );
  }
}
