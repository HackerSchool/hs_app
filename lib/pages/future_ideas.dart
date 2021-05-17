import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';

const names = [
  'Televisão',
  'Rádio',
  'Gmail',
  'Webmail',
  'Arroz de bacalhau',
  'Com Fraturas'
];

const description = [
  'É suposto todos os grupos, e respectivos elementos, comparecerem! O evento é semanal e serve para a equipa reunir, trabalhar e avançar com o projeto. Nós iremos andar pelas salas a ver o que vocês andam a fazer e a ajudar no que for preciso.',
  'O evento serve para a malta se conhecer, trocar ideias, apresentar ideias para futuros projetos, etc e tal.',
  'É suposto todos os grupos, e respectivos elementos, comparecerem! O evento é semanal e serve para a equipa reunir, trabalhar e avançar com o projeto. Nós iremos andar pelas salas a ver o que vocês andam a fazer e a ajudar no que for preciso.',
  'O evento serve para a malta se conhecer, trocar ideias, apresentar ideias para futuros projetos, etc e tal.',
  'É suposto todos os grupos, e respectivos elementos, comparecerem! O evento é semanal e serve para a equipa reunir, trabalhar e avançar com o projeto. Nós iremos andar pelas salas a ver o que vocês andam a fazer e a ajudar no que for preciso.',
  'O evento serve para a malta se conhecer, trocar ideias, apresentar ideias para futuros projetos, etc e tal.',
];

class FutureIdeasPage extends StatefulWidget {
  @override
  _FutureIdeasPageState createState() => _FutureIdeasPageState();
}

class _FutureIdeasPageState extends State<FutureIdeasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: announcementGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            'Future Ideas',
            style: Styles.titleDesign,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(3), //mete o espaço em cima
          child: SingleChildScrollView(
            child: putOneLine(context),
          ),
        ),
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
            _addFutureIdea(context);
          },
        ));
  }

  Column putOneLine(BuildContext context) {
    List<Widget> children = [];

    int i = 0;
    for (i = 0; i < names.length; i++) {
      children.add(new Center(
        child: _putTitle(names, description, i),
      ));
    }
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  Widget _putTitle(List<String> names, List<String> description, int index) {
    return Card(
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.google.com/maps/uv?pb=!1s0xd1933a3bf58649d%3A0xd7f3d7a384498675!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMZnTcodgPmAnEkVfiH9fI5BVK8NcbYDDPxhRTB%3Dw160-h160-k-no!5shacker%20school%20-%20Pesquisa%20Google!15sCgIgAQ&imagekey=!1e10!2sAF1QipMZnTcodgPmAnEkVfiH9fI5BVK8NcbYDDPxhRTB&hl=pt-PT&sa=X&ved=2ahUKEwimjMm6xKTvAhWGYcAKHWQtDKkQoiowEnoECBoQAw&cshid=1615338400130077#'),
            ),
            tileColor: backgroundGrey,
            contentPadding: EdgeInsets.all(10),
            title: Text(
              names[index],
              style: Styles.titleDesign,
            ),
            onTap: () {
              _openFutureIdeaPage(context, index, names, description);
            }));
  }

  void _openFutureIdeaPage(BuildContext context, int i, List<String> names,
      List<String> description) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OneFutureIdea(i, names, description)));
  }

  void _addFutureIdea(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNewIdea()));
  }
}

class OneFutureIdea extends StatelessWidget {
  final int index;
  final List<String> names;
  final List<String> description;
  OneFutureIdea(this.index, this.names, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        backgroundColor: backgroundGreen,
        title: Text(
          names[index],
          style: Styles.titleDesign,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _pageAnnounce(context, index),
          ))),
    );
  }

  List<Widget> _pageAnnounce(BuildContext context, int index) {
    List<Widget> information = [
      _putTitle('Name:', Styles.addAnnounceTitle, 5.0),
      _putTitle(names[index], Styles.textDesign, 25.0),
      _putTitle('Description:', Styles.addAnnounceTitle, 5.0),
      _putTitle(description[index], Styles.textDesign, 25.0),
    ];
    return information;
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

class AddNewIdea extends StatefulWidget {
  @override
  _AddNewIdeaState createState() => _AddNewIdeaState();
}

class _AddNewIdeaState extends State<AddNewIdea> {
  bool checkBoxLink = true;
  bool checkBoxForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: backgroundGreen,
          title: Text(
            'New Idea',
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
                    hintText: "Idea Title...",
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
                    hintText: "Idea Description",
                    hintStyle: Styles.textDesign,
                    labelText: "Description",
                    labelStyle: Styles.addAnnounceTitle,
                    border: UnderlineInputBorder(),
                  ),
                  cursorColor: Colors.white,
                  maxLength: 500,
                  minLines: 1,
                  maxLines: 1,
                  style: Styles.textDesign,
                ),
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
