import 'package:flutter/material.dart';
import 'package:primeira_app/information/member_information.dart';
import '../lists/member_list.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

class MembersPage extends StatefulWidget {
  final List<MemberList> _membersList;

  MembersPage(this._membersList);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        backgroundColor: backgroundGreen,
        title: Text(
          'Members',
          style: Styles.titleDesign,
        ),
      ),
    );
  }
}
