import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

const courses = ['Meec', 'Memec', 'Leic', 'MeAmb', 'MeBio'];

const positionHS = ['Direção', 'Membro'];

const skills = [
  "C",
  "Dart",
  "Flutter",
  "Java",
  "C++",
  "C#",
  "Python",
  "JavaScript",
  "Perl",
  "Assembly",
  "PHP",
  "Matlab",
  "Ltspice",
  "Ruby",
  "Swift",
  "Visual Basic",
  "Objective-C",
  "Microsoft Office"
];

const projects = [
  'HS App',
  'HS robo',
  'HS App',
  'HS robo',
  'HS App',
  'HS robo',
  'HS App',
  'HS robo',
  'HS App',
  'HS robo'
];

class SettingsPage extends StatefulWidget {
  SettingsPage();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool state1 = true,
      state2 = true,
      state3 = true,
      state4 = true,
      state5 = true,
      value = false;

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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: addAnnounceTitleColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text("Account", style: Styles.addAnnounceTitle),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Name", 1, 30),
            buildAccountOptionRow(context, "Course", 2, 0),
            buildAccountOptionRow(context, "Position in HackerSchool", 3, 0),
            buildAccountOptionRow(context, "Time in HackerSchool", 6, 0),
            buildAccountOptionRow(context, "Skills", 4, 0),
            buildAccountOptionRow(context, "Projects Involved", 5, 0),
            buildAccountOptionRow(context, "Phone Number", 1, 9),
            buildAccountOptionRow(context, "Email", 1, 30),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: addAnnounceTitleColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: Styles.addAnnounceTitle,
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'New Announcement',
                style: Styles.settingsLetter,
              ),
              Transform.scale(
                scale: 0.7,
                child: SizedBox(
                  width: 75,
                  child: CupertinoSwitch(
                    value: state1,
                    onChanged: (bool s) {
                      setState(() {
                        state1 = s;
                      });
                    },
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                '24h before one event',
                style: Styles.settingsLetter,
              ),
              Transform.scale(
                scale: 0.7,
                child: SizedBox(
                  width: 75,
                  child: CupertinoSwitch(
                    value: state2,
                    onChanged: (bool s) {
                      setState(() {
                        state2 = s;
                      });
                    },
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Begining of one event',
                style: Styles.settingsLetter,
              ),
              Transform.scale(
                scale: 0.7,
                child: SizedBox(
                  width: 75,
                  child: CupertinoSwitch(
                    value: state3,
                    onChanged: (bool s) {
                      setState(() {
                        state3 = s;
                      });
                    },
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'New Link/Form',
                style: Styles.settingsLetter,
              ),
              Transform.scale(
                scale: 0.7,
                child: SizedBox(
                  width: 75,
                  child: CupertinoSwitch(
                    value: state4,
                    onChanged: (bool s) {
                      setState(() {
                        state4 = s;
                      });
                    },
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Someone shares a new idea',
                style: Styles.settingsLetter,
              ),
              Transform.scale(
                scale: 0.7,
                child: SizedBox(
                  width: 75,
                  child: CupertinoSwitch(
                    value: state5,
                    onChanged: (bool s) {
                      setState(() {
                        state5 = s;
                      });
                    },
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, int index, int numberLetters) {
    if (index == 1) {
      return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: TextField(
                    decoration: InputDecoration(
                      hintText: "New $title",
                      hintStyle: Styles.textDesign,
                      labelText: title,
                      labelStyle: Styles.settingsDialog,
                      border: UnderlineInputBorder(),
                    ),
                    cursorColor: Colors.white,
                    maxLength: numberLetters,
                    style: Styles.textDesign,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Confirm")),
                  ],
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.settingsLetter,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title),
                  content: SingleChildScrollView(
                    child: listToPut(context, index - 1),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Confirm")),
                  ],
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.settingsLetter,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );
    }
  }

  Column listToPut(BuildContext context, int index) {
    int i = 0;
    List<Widget> children = [];

    if (index == 1)
      children.add(new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (i = 0; i < courses.length; i++)
            Row(children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  activeColor: backgroundGrey,
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  }),
              Text(
                courses[i],
                style: TextStyle(color: Colors.black),
              ),
            ])
        ],
      ));
    else if (index == 2)
      children.add(new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (i = 0; i < positionHS.length; i++)
            Row(children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  activeColor: backgroundGrey,
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  }),
              Text(
                positionHS[i],
                style: TextStyle(color: Colors.black),
              ),
            ])
        ],
      ));
    else if (index == 3)
      children.add(new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (i = 0; i < skills.length; i++)
            Row(children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  activeColor: backgroundGrey,
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  }),
              Text(
                skills[i],
                style: TextStyle(color: Colors.black),
              ),
            ])
        ],
      ));
    else if (index == 4)
      children.add(new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (i = 0; i < projects.length; i++)
            Row(children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return backgroundGreen;
                      return backgroundGreen; // Use the component's default.
                    },
                  ),
                  activeColor: backgroundGrey,
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  }),
              Text(
                projects[i],
                style: TextStyle(color: Colors.black),
              ),
            ])
        ],
      ));

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: children);
  }
}
