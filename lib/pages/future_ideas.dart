import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

class FutureIdeasPage extends StatefulWidget {
  @override
  _FutureIdeasPageState createState() => _FutureIdeasPageState();
}

class _FutureIdeasPageState extends State<FutureIdeasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        backgroundColor: backgroundGreen,
        title: Text(
          'Future Ideas',
          style: Styles.titleDesign,
        ),
      ),
    );
  }
}
