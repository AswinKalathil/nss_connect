import 'package:flutter/material.dart';
import 'package:nss_connect/regcard.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String id = 'registerScreen';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/doodleBack.png'),
          fit: BoxFit.cover,
        )),
        child: Column(children: [
          SizedBox(
            height: 200,
          ),
          RegCard()
        ]),
      ),
    );
  }
}
