import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:primeira_app/design/letters_design.dart';
import '../design/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: announcementGrey,
        body: GestureDetector(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/hs_logo.png',
                    color: titleGrey,
                  ),
                  /* Text(
                    'Click on the logo to start',
                    style: Styles.textDesign,
                  ), */
                ],
              ),
            ),
            onTap: () {
              openEmptyPage(context);
            }));
  }

  void openEmptyPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: backgroundGrey,
          appBar: AppBar(
            backgroundColor: backgroundGreen,
          ),
        );
      },
    ));
  }
}
