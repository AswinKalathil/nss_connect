import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String id = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Login.id);
      },
      child: Card(
        elevation: 4,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.white10,
        ),
      ),
    );
  }
}