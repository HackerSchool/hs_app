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
      backgroundColor: backgroundGrey,
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
    );
  }

  Column putOneLine(BuildContext context) {
    List<Widget> children = [];

    int i = 0;
    for (i = 0; i < names.length; i++) {
      children.add(new Center(
          child: GestureDetector(
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
              child: Center(
                  child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.fitWidth,
                child: Text(
                  names[i],
                  style: Styles.titleDesign,
                ),
              )),
            ),
          ),
        ),
        onTap: () {
          _openFutureIdeaPage(context, i, names, description);
        },
      )));
    }
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }

  void _openFutureIdeaPage(BuildContext context, int i, List<String> names,
      List<String> description) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OneFutureIdea(i, names, description)));
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
            names[1],
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
            ))));
  }

  List<Widget> _pageAnnounce(BuildContext context, int index) {
    List<Widget> information = [
      _putTitle('Name:', Styles.addAnnounceTitle, 5.0),
      _putTitle(names[1], Styles.textDesign, 25.0),
      _putTitle('Description:', Styles.addAnnounceTitle, 5.0),
      _putTitle(description[1], Styles.textDesign, 25.0),
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
