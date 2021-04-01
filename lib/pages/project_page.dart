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

class _ProjectsPageState extends State<ProjectsPage> {
  int i = 0;
  int j = 0;
  @override
  Widget build(BuildContext context) {
    int numberProjects = this.widget._projectInformations.length;
    int numberFor = numberProjects ~/ 2;
    // ignore: unused_local_variable
    List<Widget> children = const <Widget>[];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
//FUNCIONA BEM MAS NÃO É GERAL
              Row(
                children: [
                  for (i = 0; i < 2; i++)
                    Expanded(
                      child: oneGroup(
                          context, this.widget._projectInformations[i]),
                    ),
                ],
              ),
              Row(
                children: [
                  for (i = 2; i < 4; i++)
                    Expanded(
                      child: oneGroup(
                          context, this.widget._projectInformations[i]),
                    ),
                ],
              ),
//NÃO FUNCIONA MAS É GERAL
              /* for (j = 0; j < 1; j++)
                Row(
                  children: [
                    for (i = 0; i < 2; j++)
                      Expanded(
                        child: oneGroup(
                            context, this.widget._projectInformations[i]),
                      ),
                  ],
                ),

              if (numberProjects % 2 != 0)
                Row(
                  children: [
                    Expanded(
                        child: oneGroup(
                            context, this.widget._projectInformations[i]))
                  ],
                ) */
            ],
          ),
        ),
      ),
    );
  }

  Widget oneGroup(BuildContext context, ProjectInformation project) {
    return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: LinearGradient(
                colors: [backgroundGreen, announcementGrey],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    project.name,
                    style: Styles.titleDesign,
                  ),
                ),
                Row(children: [
                  IconButton(
                    icon: CircleAvatar(
                      backgroundImage: NetworkImage(project.photo),
                    ),
                    onPressed: () {
                      _openEmptyPage(context);
                      print('Membro');
                    },
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      backgroundImage: NetworkImage(project.photo),
                    ),
                    onPressed: () {
                      _openEmptyPage(context);
                      print('Membro');
                    },
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      backgroundImage: NetworkImage(project.photo),
                    ),
                    onPressed: () {
                      _openEmptyPage(context);
                      print('Membro');
                    },
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        _openEmptyPage(context);
        print('Projeto');
      },
    );
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
