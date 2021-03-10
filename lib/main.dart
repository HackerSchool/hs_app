import 'package:flutter/material.dart';
import 'package:primeira_app/information/member_information.dart';
import 'information/main_page_information.dart';
import 'information/menu_information.dart';
import 'design/main_page_design.dart';

void main() {
  final mainPage = MainPageInformation.allItems();
  final menu = MenuInformation.allItems();
  final member = MemberInformation.oneItem();

  return runApp(MaterialApp(home: MainPageDesign(mainPage, menu, member)));
}
