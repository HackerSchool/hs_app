import 'package:flutter/material.dart';
import '../lists/member_list.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

class SearchForASkillPage extends StatefulWidget {
  final List<MemberList> _membersList;

  SearchForASkillPage(this._membersList);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<SearchForASkillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            'Search For A Skill',
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20), //mete o espaço em cima
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            )));
  }
}
