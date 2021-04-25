import '../lists/menu_list.dart';
import 'package:flutter/material.dart';

class MenuInformation extends MenuList {
  static final List<MenuList> items = [
    null,
    MenuList(
      title: 'Login',
      icon: Icons.login,
    ),
    MenuList(
      title: 'Projects',
      icon: Icons.computer_rounded,
    ),
    MenuList(
      title: 'Search for a skill',
      icon: Icons.search,
    ),
    MenuList(
      title: 'Members',
      icon: Icons.people_alt_outlined,
    ),
    MenuList(
      title: 'Settings',
      icon: Icons.settings,
    ),
    MenuList(
      title: 'Links and Forms',
      icon: Icons.link_off_sharp,
    ),
    MenuList(
      title: 'Future Ideas',
      icon: Icons.lightbulb_outline_rounded,
    ),
    MenuList(
      title: " ",
      icon: null,
    ),
    MenuList(
      title: " ",
      icon: null,
    ),
    MenuList(
      title: " ",
      icon: null,
    ),
    MenuList(
      title: " ",
      icon: null,
    ),
  ];

  static MenuList oneItem() {
    return items[0];
  }

  static List<MenuList> allItems() {
    return items;
  }
}
