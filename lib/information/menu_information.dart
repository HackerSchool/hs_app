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
      title: 'Links',
      icon: Icons.link_off_sharp,
    ),
    MenuList(
      title: 'Shop',
      icon: Icons.shopping_bag_outlined,
    ),
    MenuList(
      title: 'Schedule',
      icon: Icons.calendar_today,
    ),
    MenuList(
      title: 'Attendance',
      icon: Icons.sentiment_satisfied_alt_outlined,
    ),
    MenuList(
      title: 'Future Ideas',
      icon: Icons.lightbulb_outline_rounded,
    ),
  ];

  static MenuList oneItem() {
    return items[0];
  }

  static List<MenuList> allItems() {
    return items;
  }
}
