import 'package:flutter/material.dart';
import '../colors.dart';

List<User> POUserData = [
  User("username", "123456"),
  User("u", "1"),
  User("aswin", "password"),
];
List<User> VOLUserData = [
  User("Haritha", "password"),
  User("Bazed", "password"),
  User("Ajith", "password"),
  User("Aksshay", "password"),
  User("Aakash", "password"),
  User("Gokul", "password"),
];
List<User> SECUserData = [
  User("u", "1"),
  User("username", "123456"),
  User("thoukheer", "password")
];

class User {
  String userName;
  String password;
  User(this.userName, this.password) {}
}

class Panel {
  final String title;
  final Color color;
  const Panel(this.title, this.color);
}

const List<Panel> Panels = [
  Panel('Blood', Colors.red),
  Panel(
    'SIP',
    Colors.orange,
  ),
  Panel(
    'EEC',
    Colors.green,
  ),
  Panel(
    'Education',
    Colors.blue,
  ),
  Panel(
    'Program',
    Colors.yellow,
  ),
  Panel(
    'Media',
    Colors.purple,
  ),
];
void fff() {}
