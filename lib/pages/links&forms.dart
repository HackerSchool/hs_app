import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

class LinksPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<LinksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            'Links & Forms',
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20), //mete o espaço em cima
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _listMembers(context),
              ),
            )),
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
            _addLinkForm(context);
          },
        ));
  }

  void _addLinkForm(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNewLink()));
  }

  List<Widget> _listMembers(BuildContext context) {
    List<Widget> members = [
      _putTitle('Forms:', Styles.addAnnounceTitle, 5.0),
      _putClickable(
          "https://docs.google.com/forms/d/e/1FAIpQLSdkcD1buxGYkRO5e-4BoXfYJYpwjbalE7JjZJlDNvmrUowTRg/viewform?usp=sf_link",
          "HS App"),
      _putClickable(
          "https://docs.google.com/forms/d/e/1FAIpQLSdkcD1buxGYkRO5e-4BoXfYJYpwjbalE7JjZJlDNvmrUowTRg/viewform?usp=sf_link",
          "Sweats & Casacos"),
      _putClickable(
          "https://docs.google.com/forms/d/e/1FAIpQLSdkcD1buxGYkRO5e-4BoXfYJYpwjbalE7JjZJlDNvmrUowTRg/viewform?usp=sf_link",
          "HS Robot"),
      _putClickable(
          "https://docs.google.com/forms/d/e/1FAIpQLSdkcD1buxGYkRO5e-4BoXfYJYpwjbalE7JjZJlDNvmrUowTRg/viewform?usp=sf_link",
          "Avaliação do novo método de Sprints"),
      SizedBox(
        height: 16,
      ),
      _putTitle('Links:', Styles.addAnnounceTitle, 5.0),
      _putClickable(
          'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT01',
          "Brainstorm"),
    ];
    return members;
  }

  Widget _putClickable(String url, String name) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return backgroundGrey;
            return Colors.white; // Use the component's default.
          },
        ),
      ),
      onPressed: () => {launch("$url")},
      child: Text(
        name,
        style: TextStyle(color: announcementGrey),
      ),
    );
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
}

class AddNewLink extends StatefulWidget {
  @override
  _AddNewLinkState createState() => _AddNewLinkState();
}

class _AddNewLinkState extends State<AddNewLink> {
  bool checkBoxLink = true;
  bool checkBoxForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            'New Announcement',
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Link/Form Title...",
                    hintStyle: Styles.textDesign,
                    labelText: "Title",
                    labelStyle: Styles.addAnnounceTitle,
                    border: UnderlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                  maxLength: 20,
                  style: Styles.textDesign,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Link/Form Link",
                    hintStyle: Styles.textDesign,
                    labelText: "Link",
                    labelStyle: Styles.addAnnounceTitle,
                    border: UnderlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                  maxLength: 500,
                  minLines: 1,
                  maxLines: 1,
                  style: Styles.textDesign,
                ),
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
                      value: checkBoxLink,
                      onChanged: (bool value) {
                        setState(() {
                          checkBoxLink = value;
                          checkBoxForm = !value;
                        });
                      }),
                  Text(
                    "Link",
                    style: TextStyle(color: Colors.white),
                  ),
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
                      value: checkBoxForm,
                      onChanged: (bool value) {
                        setState(() {
                          checkBoxLink = !value;
                          checkBoxForm = value;
                        });
                      }),
                  Text(
                    "Form",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Publish the Link?',
                  style: Styles.addAnnounceTitle,
                  textAlign: TextAlign.left,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return backgroundGreen;
                        return backgroundGreen; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () => {},
                  child: Text(
                    'Yes!',
                    style: Styles.textDesign,
                  ),
                ),
              ],
            ))));
  }
}
