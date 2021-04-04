import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

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
/*                   SizedBox(
                    height: 100,
                  ), */
                  // ignore: deprecated_member_use
                  RaisedButton(
                      color: backgroundGrey,
                      child: Text(
                        'Login',
                        style: Styles.textDesign,
                      ),
                      onPressed: () {
                        openEmptyPage(context);
                      }),
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
