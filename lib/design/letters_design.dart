import 'package:flutter/material.dart';

class Styles {
  //define letters size
  static const _titleSize = 20.0;
  static const _textSize = 12.0;
  static const _publicationDateSize = 10.0;

  //define colors
  static final Color _textGrey = Color(0xFFBDBDBD);
  static final Color _titleGrey = Color(0xFFBDBDBD);

  //define letters font
  static final String _textFont = 'Muli';
  static final navBarTitle = TextStyle(fontFamily: _textFont, color: _textGrey);

  //define title
  static final titleDesign = TextStyle(
    fontFamily: _textFont,
    fontSize: _titleSize,
    color: _titleGrey,
  );

  //define text
  static final textDesign = TextStyle(
    fontFamily: _textFont,
    fontSize: _textSize,
    color: _textGrey,
  );

  static final publicationDateDesign = TextStyle(
    fontFamily: _textFont,
    fontSize: _publicationDateSize,
    color: _textGrey,
  );

  //????????????????????????????????????????????????????????????????
  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
