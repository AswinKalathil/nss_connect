import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String id = 'welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Login.id);
      },
      child: Card(
        elevation: 4,
        child: Center(
          child: Container(
            child: Text('Welcome tour'),
            width: 100,
            height: 100,
            color: const Color.fromARGB(26, 71, 61, 61),
          ),
        ),
      ),
    );
  }
}
