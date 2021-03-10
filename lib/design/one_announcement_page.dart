import 'package:flutter/material.dart';
import '../lists/announcement_list.dart';
import 'letters_design.dart';
import 'colors.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, //eixo y
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Qualquer coisa'),
          //_designPage(context,announcementInformations),
        ],
      ),
    );
  }
}
