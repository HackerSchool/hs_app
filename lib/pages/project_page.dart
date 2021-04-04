import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../lists/project_list.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

class ProjectsPage extends StatefulWidget {
  final List<ProjectInformation> _projectInformations;

  ProjectsPage(this._projectInformations);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = new List<Widget>();
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
          child: putOneLine(context, this.widget._projectInformations),
        ),
      ),
    );
  }

  Column putOneLine(
      BuildContext context, List<ProjectInformation> projectInformations) {
    int i = 0;
    int j = 0;
    int numberProjects = this.widget._projectInformations.length;
    int numberFor = numberProjects ~/ 2;
    List<Widget> children = new List<Widget>();

    for (j = 0; j < numberFor; j++) {
      children.add(new Row(
        children: [
          for (i = j * 2; i < j * 2 + 2; i++)
            Expanded(
              child: oneGroup(context, this.widget._projectInformations[i]),
            ),
        ],
      ));
    }
    if (numberProjects % 2 != 0) {
      children.add(new Row(
        children: [
          Expanded(
              child: oneGroup(context, this.widget._projectInformations[i])),
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

  Widget oneGroup(BuildContext context, ProjectInformation project) {
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
            child: putMembers(context, project),
          ),
        ),
      ),
      onTap: () {
        _openEmptyPage(context);
        print('Projeto');
      },
    );
  }

  Column putMembers(BuildContext context, ProjectInformation project) {
    int i = 0;
    int aux1 = min(project.numberMembers, 3);
    int aux2 = min(project.numberMembers - aux1, 3);
    int aux3 = max(project.numberMembers - aux1 - 3, 0);
    List<Widget> children = new List<Widget>();

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
              _openEmptyPage(context);
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
                _openEmptyPage(context);
                print('Membro2');
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
                _openEmptyPage(context);
                print('Membro3');
              },
            ),
        ],
      ));

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
