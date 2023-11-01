import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../widgets/rowCard.widget.dart';
import '../widgets/searchBar.widget.dart';

class SearchEventsPage extends StatefulWidget {
  SearchEventsPage({super.key});

  @override
  State<SearchEventsPage> createState() => _SearchEventsPageState();
}

class _SearchEventsPageState extends State<SearchEventsPage> {
  final TextEditingController _textController = TextEditingController();

  final AppBar _appBar = AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(color: Color(0xFF120D26)),
    backgroundColor: Colors.transparent,
    toolbarHeight: 60,
    title: Text(
      'Search',
      style: GoogleFonts.inter(
          color: Color(0xFF120D26), fontWeight: FontWeight.w500, fontSize: 24),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            SearchBar(textController: _textController),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RowCard(),
                    RowCard(),
                    RowCard(),
                    RowCard(),
                    RowCard(),
                    RowCard(),
                    RowCard(),
                    RowCard(),
                    RowCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}