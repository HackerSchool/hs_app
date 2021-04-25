import 'package:flutter/material.dart';
import '../lists/member_list.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';
import '../pages/members.dart';

class SettingsPage extends StatefulWidget {
  final List<MemberList> _membersList;

  SettingsPage(this._membersList);

  @override
  _SettingsPageState createState() => _SettingsPageState(_membersList);
}

class _SettingsPageState extends State<SettingsPage> {
  final List<MemberList> _memberList;
  _SettingsPageState(this._memberList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        backgroundColor: backgroundGreen,
        title: Text(
          'Settings',
          style: Styles.titleDesign,
        ),
      ),
      /* body: Padding(
          padding: const EdgeInsets.all(3), //mete o espaço em cima
          child: ListView.builder(
            itemCount: this._announcementInformations.length,
            itemBuilder: _designPage,
          ),
        ),
        drawer: _drawerFunction(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: backgroundGreen,
          elevation: 10.0,
          child: Container(
            child: Icon(
              Icons.add_rounded,
              size: 50.0,
              color: textGrey,
            ),
          ),
          onPressed: () {
            _addAnnouncementPage(context);
          },
        ) */
    );
  }
}
