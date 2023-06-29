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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/doodleBack.png'),
            fit: BoxFit.cover,
          )),
          child: Column(children: [
            Expanded(child: Container()),
            credCard(),
            Expanded(child: Container()),
          ]),
        ),
      ),
    );
  }
}
