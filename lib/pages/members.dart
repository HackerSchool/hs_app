import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
            padding: const EdgeInsets.all(20), //mete o espaço em cima
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _listMembers(context, this.widget._membersList),
              ),
            )));
  }

  List<Widget> _listMembers(BuildContext context, List<MemberList> memberList) {
    List<Widget> members = [
      _putTitle('Direção:', Styles.addAnnounceTitle, 5.0),
      membersFunction(context, this.widget._membersList, 7),
      _putTitle('Assistentes de Direção:', Styles.addAnnounceTitle, 5.0),
      membersFunction(context, this.widget._membersList, 3),
      _putTitle('Membros:', Styles.addAnnounceTitle, 5.0),
      membersFunction(context, this.widget._membersList, 17),
    ];
    return members;
  }

  Widget _putTitle(String titleToPut, TextStyle styleToPut, double distance) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, distance),
      child: Text(
        titleToPut,
        textAlign: TextAlign.center,
        style: styleToPut,
      ),
    );
  }

  Column membersFunction(
      BuildContext context, List<MemberList> memberList, int number) {
    int i = 0;
    int j = 0;
    int numberFor = number ~/ 3;
    List<Widget> children = new List<Widget>();

    for (j = 0; j < numberFor; j++) {
      children.add(new Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          for (i = j * 3; i < j * 3 + 3; i++)
            Expanded(
              child: oneMember(context, this.widget._membersList[i]),
            ),
        ],
      ));
    }
    if (number % 3 != 0)
      children.add(new Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          for (i = 0; i < number - numberFor * 3; i++)
            Expanded(
              child: oneMember(context, this.widget._membersList[i]),
            ),
        ],
      ));

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  Widget oneMember(BuildContext context, MemberList memberList) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: putMember(context, memberList),
      ),
      onTap: () {
        _openMemberPage(context, memberList);
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
            _openMemberPage(context, member);
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
        style: Styles.textDesign,
      ),
    )));
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  void _openMemberPage(BuildContext context, MemberList member) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OneMemberPage(member)));
  }
}

class OneMemberPage extends StatelessWidget {
  final MemberList member;

  OneMemberPage(this.member);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            member.name,
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _pageMember(context, member),
            ))));
  }

  List<Widget> _pageMember(BuildContext context, MemberList member) {
    List<Widget> information = [
      _putImage(member.photo, member),
      _putTitle('Position in HackerSchool:', Styles.addAnnounceTitle, 5.0),
      _putTitle('Member - Development Team', Styles.textDesign, 25.0),
      _putTitle('Description:', Styles.addAnnounceTitle, 5.0),
      _putTitle('Colocar descrição aqui', Styles.textDesign, 25.0),
      _putTitle('Time in HackerSchool:', Styles.addAnnounceTitle, 5.0),
      _putTitle('September 2020 - Present', Styles.textDesign, 25.0),
      _putTitle('Skills:', Styles.addAnnounceTitle, 5.0),
      _putTitle(
          'C, Matlab, Dart, Flutter, Android Emulator, Ltspice, Assembly, Microsoft Office',
          Styles.textDesign,
          25.0),
      _putTitle('Projects involved:', Styles.addAnnounceTitle, 5.0),
      _putTitle('HS App', Styles.textDesign, 25.0),
      _putTitle('Phone Number:', Styles.addAnnounceTitle, 5.0),
      _putClickable('tel', '910710449', Styles.textDesign, 25.0),
      _putTitle('Email:', Styles.addAnnounceTitle, 5.0),
      _putClickable(
          'mailto', 'pedrocasventura@gmail.com', Styles.textDesign, 25.0),
    ];
    return information;
  }

  Widget _putClickable(
      String identifier, String url, TextStyle styleToPut, double distance) {
    return RaisedButton(
      onPressed: () => {launch("$identifier:$url")},
      child: Text(url),
      textColor: announcementGrey,
      padding: const EdgeInsets.all(5.0),
    );
  }

  Widget _putImage(url, MemberList member) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      constraints: BoxConstraints.tightFor(height: 100.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/${member.photo}'),
              radius: 50.0,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft + Alignment(1.2, -0.5),
            child: Text(
              member.name,
              style: TextStyle(color: textGrey, fontSize: 30.0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft + Alignment(0.7, 0.2),
            child: Text(
              'ist1${member.id}',
              style: TextStyle(color: textGrey, fontSize: 10.0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft + Alignment(0.67, 0.7),
            child: Text(
              'MEEC',
              style: TextStyle(color: textGrey, fontSize: 10.0),
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
}
