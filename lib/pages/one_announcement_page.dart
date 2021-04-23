import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lists/announcement_list.dart';
import '../design/letters_design.dart';
import '../design/colors.dart';

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
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _pageAnnounce(context, announcementInformations),
            ))));
  }

  List<Widget> _pageAnnounce(
      BuildContext context, AnnouncementInformation announcementInformations) {
    List<Widget> information = [
      _putImage(announcementInformations.iconLink),
      _putTitle('Description:', Styles.addAnnounceTitle, 5.0),
      _putTitle(announcementInformations.explanation, Styles.textDesign, 25.0),
      _putTitle('Event Date:', Styles.addAnnounceTitle, 5.0),
      _putTitle(announcementInformations.eventDate, Styles.textDesign, 25.0),
      _putTitle('Event Hour:', Styles.addAnnounceTitle, 5.0),
      _putTitle(announcementInformations.eventHour, Styles.textDesign, 25.0),
      _putTitle('Links (clickable):', Styles.addAnnounceTitle, 5.0),
      _putLink(announcementInformations.links, Styles.textDesign, 25.0),
    ];
    return information;
  }

/*   Widget _putImage(String url) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      constraints: BoxConstraints.tightFor(height: 190.0),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  } */
  Widget _putImage(url) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      constraints: BoxConstraints.tightFor(height: 100.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 50.0,
            ),
          ),
        ],
      ),
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

  Widget _putLink(String titleToPut, TextStyle styleToPut, double distance) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, distance),
      child: new InkWell(
          child: new Text(
            'Zoom',
            textAlign: TextAlign.left,
            style: styleToPut,
          ),
          onTap: () => launch(titleToPut)),
    );
  }
}

class AddOneAnnouncement extends StatefulWidget {
  @override
  _AddOneAnnouncementState createState() => _AddOneAnnouncementState();
}

class _AddOneAnnouncementState extends State<AddOneAnnouncement> {
  DateTime _announceDate;
  TimeOfDay _announceHour;
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
                  maxLines: 100,
                  style: Styles.textDesign,
                  cursorColor: Colors.white,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Event Date/Hour',
                  style: Styles.addAnnounceTitle,
                  textAlign: TextAlign.left,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: backgroundGreen,
                    elevation: 20.0,
                    child: Text(
                      'Choose a date',
                      style: Styles.textDesign,
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialEntryMode: DatePickerEntryMode.calendar,
                        initialDatePickerMode: DatePickerMode.day,
                        initialDate: _announceDate == null
                            ? DateTime.now()
                            : _announceDate,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2022),
                      ).then((date) {
                        setState(() {
                          _announceDate = date;
                        });
                      });
                    }),
                Text(
                  'Picked Date: $_announceDate',
                  style: Styles.textDesign,
                  textAlign: TextAlign.left,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    elevation: 20.0,
                    color: backgroundGreen,
                    child: Text(
                      'Choose a hour',
                      style: Styles.textDesign,
                    ),
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: _announceHour == null
                            ? TimeOfDay.now()
                            : _announceHour,
                      ).then((date) {
                        setState(() {
                          _announceHour = date;
                        });
                      });
                    }),
                Text(
                  'Picked Hour: $_announceHour',
                  style: Styles.textDesign,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "In the format 'Name:link'",
                    hintStyle: Styles.textDesign,
                    labelText: "Links",
                    labelStyle: Styles.addAnnounceTitle,
                    border: UnderlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                  maxLength: 500,
                  minLines: 1,
                  maxLines: 100,
                  style: Styles.textDesign,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Publish the Announcement?',
                  style: Styles.addAnnounceTitle,
                  textAlign: TextAlign.left,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: backgroundGreen,
                    elevation: 20.0,
                    child: Text(
                      'Yes!',
                      style: Styles.textDesign,
                    ),
                    onPressed: () {})
              ],
            ))));
  }
}
