import 'package:flutter/material.dart';

class Styles {
  //define letters size
  static const _settingsSize = 15.0;
  static const _titleSize = 20.0;
  static const _textSize = 12.0;
  static const _publicationDateSize = 10.0;

  //define colors
  static final Color _textGrey = Color(0xFFBDBDBD);
  static final Color _titleGrey = Color(0xFFBDBDBD);
  static final Color _addAnnounceTitleColor = Color(0xFFA5D6A7);
  static final Color __settingsBlack = Color(0xDD000000);

  //define letters font
  static final String _textFont = 'Muli';
  static final navBarTitle = TextStyle(fontFamily: _textFont, color: _textGrey);

  static final titleDesign = TextStyle(
    fontFamily: _textFont,
    fontSize: _titleSize,
    color: _titleGrey,
  );

  static final settingsLetter = TextStyle(
    fontFamily: _textFont,
    fontSize: _settingsSize,
    color: _titleGrey,
  );

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

  static final addAnnounceTitle = TextStyle(
    fontFamily: _textFont,
    fontSize: _titleSize,
    color: _addAnnounceTitleColor,
  );

  static final settingsDialog = TextStyle(
    fontFamily: _textFont,
    fontSize: _titleSize,
    color: __settingsBlack,
  );
}
