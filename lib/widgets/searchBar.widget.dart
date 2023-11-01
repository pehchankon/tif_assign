import 'package:flutter/material.dart';
import 'package:tif_assign/textStyles.dart';
import '../colors.dart';

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
          color: AppColors.secondaryPurpleColor,
        ),
        SizedBox(width: 8),
        Container(
          width: 1,
          height: 26,
          color: Color.fromRGBO(121, 116, 231, 1),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            cursorColor: AppColors.secondaryPurpleColor,
            controller: _textController,
            style: AppTextStyles.primaryPurpleBoldText20,
            decoration: InputDecoration(
              hintStyle: AppTextStyles.inputHintText20,
              hintText: 'Type Event Name',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
