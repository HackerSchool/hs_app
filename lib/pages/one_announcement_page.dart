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
