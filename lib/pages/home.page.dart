import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'searchEvents.page.dart';
import 'package:flutter/services.dart';
import '../widgets/rowCard.widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  AppBar _appBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: Color(0xFF120D26)),
      backgroundColor: Colors.transparent,
      toolbarHeight: 60,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          'Events',
          style: GoogleFonts.inter(
              color: Color(0xFF120D26),
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchEventsPage()),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(children: [
          RowCard(),
          RowCard(),
          RowCard(),
          RowCard(),
          RowCard(),
        ]),
      ),
    );
  }
}