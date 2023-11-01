import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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