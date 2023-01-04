import 'package:flutter/widgets.dart';

class NavigationBarModel {
  String title;
  Widget widget;
  IconData icon;

  NavigationBarModel(
      {required this.title,
      required this.widget,
      required this.icon,});
}
