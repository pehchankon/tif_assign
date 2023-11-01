import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../widgets/rowCard.widget.dart';

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

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.search,
          color: Color.fromRGBO(121, 116, 231, 1),
        ),
        SizedBox(width: 8),
        Text(
          '|',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(121, 116, 231, 1),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _textController,
            style: GoogleFonts.inter(
              fontSize: 20,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintStyle: GoogleFonts.inter(
                fontSize: 20,
                color: Color.fromRGBO(0, 0, 0, 0.3),
              ),
              hintText: 'Type Event Name',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
