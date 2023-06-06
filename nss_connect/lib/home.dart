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
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}