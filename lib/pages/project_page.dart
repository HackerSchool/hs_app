import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    int number_for = this.widget._projectInformations.length;
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
            ],
          ),
        ),
      ),
    );
  }

  Widget oneGroup(BuildContext context, ProjectInformation project) {
    return Card(
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
              FittedBox(
                fit: BoxFit.fitWidth,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(project.photo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
