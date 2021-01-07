import 'package:flutter/material.dart';
import 'package:primeira_app/colors.dart';
//import 'package:flutter/rendering.dart';

void main() => runApp(MinhaApp());

class MinhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_Screen(),
    );
  }
}

void openPage(BuildContext context, String texto) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: principal_grey,
        appBar: AppBar(
          backgroundColor: principal_green,
          title: Text(
            texto,
            style: TextStyle(
              color: letter_grey,
              fontSize: 24,
            ),
          ),
        ),
      );
    },
  ));
}

class Main_Screen extends StatelessWidget {
  Main_Screen({Key key}) : super(key: key);
  @override
  String texto = 'Perfil';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: principal_grey,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Grupo.jpg"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "\t Quem somos?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: letter_grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "\t A HackerSchool é uma associação académica, fundada em 2012, que desenvolve actividades num ambiente multidisciplinar, de learn-by-doing e de aprendizagem entre pares, inspirado nos valores da cultura hacker. Aqui, independentemente da formação de base, aprende-se a criar novos produtos e serviços sobre tecnologias emergentes como a internet das coisas ou a web semântica, utilizando soluções de baixo custo assentes em open electronics, open materials, open fabrication, entre outros. \n",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: letter_grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: principal_green,
        title: Row(
          children: <Widget>[
            Image.asset('assets/oi.png',
                alignment: Alignment.center, height: 72, color: letter_grey),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: principal_grey,
              ),
              margin: const EdgeInsets.only(bottom: 0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-1, 0.2),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/EU.jpg'),
                      radius: 30.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Pedro Ventura',
                      style: TextStyle(color: letter_grey, fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.35, 0.4),
                    child: Text(
                      'Ist193155',
                      style: TextStyle(color: letter_grey, fontSize: 10.0),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.campaign_outlined,
                color: letter_grey,
              ),
              title: Text(
                'Anuncíos',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Anuncíos';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.computer_rounded,
                color: letter_grey,
              ),
              title: Text(
                'Projetos',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Projetos';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                color: letter_grey,
              ),
              title: Text(
                'Search for a skill',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Search for a skill';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.people_outline,
                color: letter_grey,
              ),
              title: Text(
                'Membros',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Membros';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: letter_grey,
              ),
              title: Text(
                'Definições',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Definições';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.link_sharp,
                color: letter_grey,
              ),
              title: Text(
                'Links',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Links';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_bag_outlined,
                color: letter_grey,
              ),
              title: Text(
                'Loja',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Loja';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: letter_grey,
              ),
              title: Text(
                'Calendário',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Calendário';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.sentiment_satisfied_alt_outlined,
                color: letter_grey,
              ),
              title: Text(
                'Presenças',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Presenças';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline_rounded,
                color: letter_grey,
              ),
              title: Text(
                'Ideias Futuras',
                style: TextStyle(color: letter_grey),
              ),
              onTap: () {
                texto = 'Ideias Futuras';
                openPage(context, texto);
              },
              tileColor: principal_grey,
            ),
          ],
        ),
      ),
    );
  }
}
