import 'package:flutter/material.dart';
import 'package:hsapp/information/member_information.dart';
import 'package:hsapp/information/project_information.dart';
import 'package:flutter/services.dart';
import 'information/main_page_information.dart';
import 'information/menu_information.dart';
import 'pages/main_page_design.dart';
import 'design/colors.dart';

void main() {
  final mainPage = MainPageInformation.allItems();
  final menu = MenuInformation.allItems();
  final project = ProjectPageInformation.allItems();
  final member = MemberInformation.allItems();

  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
      primaryColorLight: backgroundGrey,
      accentColor: backgroundGrey,
    ),
    home: MainPageDesign(mainPage, menu, member, project),
    debugShowCheckedModeBanner: false,
  ));
}
