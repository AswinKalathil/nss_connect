import 'package:flutter/material.dart';
import 'credCard.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  static const String id = 'loginScreen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            height: MediaQuery.of(context).size.height * .15,
          ),
          credCard()
        ]),
      ),
    );
  }
}
