import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 106, 74, 144), //TODO: update color
        ),
      ),
    );
  }
}
