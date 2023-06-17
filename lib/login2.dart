import 'package:flutter/material.dart';
import 'package:nss_connect/slidingCards.dart';


class Login2 extends StatefulWidget {
  const Login2({super.key});
  static const String id = 'login2Screen';

  @override
  State<Login2> createState() => _Login2State();



  
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/doodleBack.png'),
          fit: BoxFit.cover,
        )),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
          SlidingCards(),
        ]),
      ),
    );
  }
}
