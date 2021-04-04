import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(3), //mete o espaço em cima
          child: SingleChildScrollView(
            child: membersFunction(context, this.widget._membersList),
          ),
        ));
  }

  Column membersFunction(BuildContext context, List<MemberList> memberList) {
    int i = 0;
    int j = 0;
    int numberProjects = this.widget._membersList.length;
    int numberFor = numberProjects ~/ 3;
    List<Widget> children = new List<Widget>();

    for (j = 0; j < numberFor; j++) {
      children.add(new Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          for (i = j * 3; i < j * 3 + 3; i++)
            Expanded(
              child: oneGroup(context, this.widget._membersList[i]),
            ),
        ],
      ));
    }
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  Widget oneGroup(BuildContext context, MemberList memberList) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: putMember(context, memberList),
      ),
      onTap: () {
        _openEmptyPage(context);
        print('Nome');
      },
    );
  }

  Column putMember(BuildContext context, MemberList member) {
    List<Widget> children = new List<Widget>();

    children.add(new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/${member.photo}'),
            radius: 1000,
          ),
          onPressed: () {
            _openEmptyPage(context);
            print('Foto');
          },
        ),
      ],
    ));
    children.add(new Center(
        child: FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.fitWidth,
      child: Text(
        member.name,
        style: Styles.titleDesign,
      ),
    )));
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  void _openEmptyPage(BuildContext context) {
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
