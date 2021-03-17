import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lists/announcement_list.dart';
import '../design/letters_design.dart';
import '../design/colors.dart';

//É PARA APAGAR\\//É SÓ CÓCÓ\\
class OneAnnouncementPage extends StatelessWidget {
  final AnnouncementInformation announcementInformations;

  OneAnnouncementPage(this.announcementInformations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            announcementInformations.title,
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _pageAnnounce(context, announcementInformations),
            )));
  }

  /* List<Widget> _pageAnnounce(
      BuildContext context, AnnouncementInformation announcementInformations) {
    var information = List<Widget>();
    information.add(_putTitle('Description:', Styles.titleDesign, 10.0));
    information.add(_putTitle('Description:', Styles.titleDesign, 25.0));

    return information;
  } */

  List<Widget> _pageAnnounce(
      BuildContext context, AnnouncementInformation announcementInformations) {
    List<Widget> information = [
      _putImage(announcementInformations.iconLink),
      _putTitle('Description:', Styles.titleDesign, 5.0),
      _putTitle(announcementInformations.explanation, Styles.textDesign, 25.0),
      _putTitle('Event Date:', Styles.titleDesign, 5.0),
      _putTitle(announcementInformations.eventDate, Styles.textDesign, 25.0),
      _putTitle('Event Hour:', Styles.titleDesign, 5.0),
      _putTitle(announcementInformations.eventHour, Styles.textDesign, 25.0),
      //TENHO DE TORNAR OS LINKS CLICÁVEIS
      _putTitle('Links:', Styles.titleDesign, 5.0),
      _putTitle(announcementInformations.links, Styles.textDesign, 25.0),
    ];
    return information;
  }

  Widget _putImage(String url) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      constraints: BoxConstraints.tightFor(height: 190.0),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }

  Widget _putTitle(String titleToPut, TextStyle styleToPut, double distance) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, distance),
      child: Text(
        titleToPut,
        textAlign: TextAlign.left,
        style: styleToPut,
      ),
    );
  }
}

class AddOneAnnounce extends StatelessWidget {
  DateTime _announceDate;
  DateTime _announceHour = DateTime.now();
  //TimeOfDay _announceHour;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            'New Announcement',
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Announcement Title...",
                    hintStyle: Styles.textDesign,
                    labelText: "Title",
                    labelStyle: Styles.addAnnounceTitle,
                    border: UnderlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                  maxLength: 20,
                  style: Styles.textDesign,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Add one description to your announce...",
                    hintStyle: Styles.textDesign,
                    labelText: "Description",
                    labelStyle: Styles.addAnnounceTitle,
                    border: UnderlineInputBorder(),
                  ),
                  maxLength: 500,
                  minLines: 1,
                  maxLines: 10,
                  style: Styles.textDesign,
                  cursorColor: Colors.white,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  _announceDate == null
                      ? 'Event Date/Hour'
                      : _announceDate.toString(),
                  style: Styles.addAnnounceTitle,
                  textAlign: TextAlign.left,
                ),
                ElevatedButton(
                    child: Text(
                      'Choose a date',
                      style: Styles.textDesign,
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: _announceDate == null
                            ? DateTime.now()
                            : _announceDate,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2022),
                      ).then((date) {
                        _announceDate = date;
                      });
                    }),
                /*  ElevatedButton(
                    child: Text(
                      'Choose a hour',
                      style: Styles.textDesign,
                    ),
                    onPressed: () {
                      showTimePicker(
                              context: context, initialTime: _announceHour)
                          .then((time) {
                        _announceHour = time;
                      });
                    }), */

                /*  ElevatedButton(
                    child: Text(
                      'Choose a hour',
                      style: Styles.textDesign,
                    ),
                    onPressed: () { */
                SizedBox(
                    height: 100,
                    child: CupertinoDatePicker(
                        initialDateTime: _announceHour,
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (dateTime) {
                          print(dateTime);
                          _announceHour = dateTime;
                        }))
              ],
            ))));
  }
}

/* Para login page falta:

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
