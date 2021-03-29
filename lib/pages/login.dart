import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../design/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: announcementGrey,
      body: Container(),
    );
  }
}

/* 

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  errorText: _passwordError,
                  labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                  border: OutlineInputBorder(),
                  fillColor: Colors.black12,
                  filled: true
                  suffixIcon: IconButton(
                    icon: Icon(
                        _secureText ? Icons.remove_red_eye : Icons.security),
                    onPressed: () {
                      setState(() {
                        _secureText = !_secureText;
                      });
                    },
                  )),
              obscureText: _secureText,
              maxLines: 3,
              maxLength: 20,
            ),
            SizedBox(
              height: 16,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (String value) {
                        if (value.length < 10)
                          return "Enter at least 10 char";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.length < 3)
                          return "Enter at least 3 char";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          border: OutlineInputBorder()),
                      obscureText: true,
                    ),
                  ],
                )),
            SizedBox(
              height: 16,
            ),
            RaisedButton(onPressed: () {
              print("Password : " + _passwordController.text);
              setState(() {
                print("Form Validation : " +
                    _formKey.currentState.validate().toString());
                if (_passwordController.text.length < 3)
                  _passwordError = "Enter at least 3 char";
                else
                  _passwordError = null;
              });
            })


 
 
 */
