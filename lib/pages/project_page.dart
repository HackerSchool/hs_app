import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../lists/project_list.dart';
import '../lists/member_list.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';
import '../pages/members.dart';

class ProjectsPage extends StatefulWidget {
  final List<ProjectInformation> _projectInformations;
  final List<MemberList> _memberList;

  ProjectsPage(this._projectInformations, this._memberList);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = [];
  for (var i = 0; i < strings.length; i++) {
    list.add(new Text(strings[i]));
  }
  return new Row(children: list);
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        backgroundColor: backgroundGreen,
        title: Text(
          'Projects',
          style: Styles.titleDesign,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3), //mete o espaço em cima
        child: SingleChildScrollView(
          child: putOneLine(context, this.widget._projectInformations,
              this.widget._memberList),
        ),
      ),
    );
  }

  Column putOneLine(
      BuildContext context,
      List<ProjectInformation> projectInformations,
      List<MemberList> _memberList) {
    int i = 0;
    int j = 0;
    int numberProjects = this.widget._projectInformations.length;
    int numberFor = numberProjects ~/ 2;
    List<Widget> children = [];

    for (j = 0; j < numberFor; j++) {
      children.add(new Row(
        children: [
          for (i = j * 2; i < j * 2 + 2; i++)
            Expanded(
              child: oneGroup(
                  context, this.widget._projectInformations[i], _memberList),
            ),
        ],
      ));
    }
    if (numberProjects % 2 != 0) {
      children.add(new Row(
        children: [
          Expanded(
              child: oneGroup(
                  context, this.widget._projectInformations[i], _memberList)),
          Expanded(child: nullGroup(context))
        ],
      ));
    }
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  Widget nullGroup(BuildContext context) {
    return Card(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: LinearGradient(
            colors: [backgroundGreen, announcementGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
    ));
  }

  Widget oneGroup(BuildContext context, ProjectInformation project,
      List<MemberList> _memberList) {
    return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: LinearGradient(
                colors: [announcementGrey, backgroundGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: putMembers(context, project, _memberList),
          ),
        ),
      ),
      onTap: () {
        _openProjectPage(context, project, _memberList);
      },
    );
  }

  Column putMembers(BuildContext context, ProjectInformation project,
      List<MemberList> _memberList) {
    int i = 0;
    int aux1 = min(project.numberMembers, 3);
    int aux2 = min(project.numberMembers - aux1, 3);
    int aux3 = max(project.numberMembers - aux1 - 3, 0);
    List<Widget> children = [];

    children.add(new Center(
        child: FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.fitWidth,
      child: Text(
        project.name,
        style: Styles.titleDesign,
      ),
    )));
    children.add(new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (i = 0; i < aux1; i++)
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/EU.jpg'),
            ),
            onPressed: () {
              _openProjectPage(context, project, _memberList);
            },
          ),
      ],
    ));
    if (aux2 != 0)
      children.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (i = 0; i < aux2; i++)
            IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/EU.jpg'),
              ),
              onPressed: () {
                _openProjectPage(context, project, _memberList);
              },
            ),
        ],
      ));
    if (aux3 != 0)
      children.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (i = 0; i < aux3; i++)
            IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/EU.jpg'),
              ),
              onPressed: () {
                _openProjectPage(context, project, _memberList);
              },
            ),
        ],
      ));

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  void _openProjectPage(BuildContext context, ProjectInformation project,
      List<MemberList> memberList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OneProjectPage(project, memberList)));
  }
}

class OneProjectPage extends StatelessWidget {
  final ProjectInformation project;
  final List<MemberList> _memberList;

  OneProjectPage(this.project, this._memberList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            project.name,
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _pageProject(context, project, _memberList),
            ))));
  }

  List<Widget> _pageProject(BuildContext context, ProjectInformation project,
      List<MemberList> _memberList) {
    List<Widget> information = [
      _putImage(project.photo),
      _putTitle('Description:', Styles.addAnnounceTitle, 5.0),
      _putTitle(project.explanation, Styles.textDesign, 25.0),
      _putTitle('Project Date:', Styles.addAnnounceTitle, 5.0),
      _putTitle('Aqui metes a data', Styles.textDesign, 25.0),
      _putTitle('Skills used:', Styles.addAnnounceTitle, 5.0),
      _putTitle('Aqui metes os skills usados', Styles.textDesign, 25.0),
      _putTitle('Members:', Styles.addAnnounceTitle, 5.0),
      _putMembers(context, project, _memberList),
    ];
    return information;
  }

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

  Widget _putMembers(BuildContext context, ProjectInformation project,
      List<MemberList> _memberList) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      constraints: BoxConstraints.tightFor(height: 190.0),
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: putMembers(context, project, _memberList)),
    );
  }

  Column putMembers(BuildContext context, ProjectInformation project,
      List<MemberList> _memberList) {
    int i = 0;
    int aux1 = min(project.numberMembers, 6);
    List<Widget> children = [];

    children.add(new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (i = 0; i < aux1; i++) memberIcon(context, _memberList)],
    ));
    if (project.numberMembers > 6)
      children.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (i = 0; i < project.numberMembers - 6; i++)
            memberIcon(context, _memberList)
        ],
      ));

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  Widget memberIcon(BuildContext context, List<MemberList> memberList) {
    return IconButton(
      icon: CircleAvatar(
        backgroundImage: AssetImage('assets/EU.jpg'),
      ),
      onPressed: () {
        _openMemberPage(context, memberList[0]);
      },
    );
  }

  void _openMemberPage(BuildContext context, MemberList member) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OneMemberPage(member)));
  }
}
