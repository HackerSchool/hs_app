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
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return backgroundGrey;
                          return backgroundGrey; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () => {openEmptyPage(context)},
                    child: Text(
                      'Login',
                      style: Styles.textDesign,
                    ),
                  ),
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
