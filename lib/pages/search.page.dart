import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final AppBar _appBar = AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: Color(0xFF120D26)),
      backgroundColor: Colors.transparent,
      title: Text(
        'Search',
        style: GoogleFonts.inter(
            color: Color(0xFF120D26),
            fontWeight: FontWeight.w500,
            fontSize: 24),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Center(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
