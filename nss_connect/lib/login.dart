import 'package:flutter/material.dart';
import 'credCard.dart';
import 'Secretary.dart';
import 'register.dart';

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
          Container(
            padding: const EdgeInsets.only(top: 50, right: 10),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
<<<<<<< Updated upstream
                  // onTap: (){Navigator.of(context).push()},
                  child: Text('Register...'),
=======
                  // onTap: (){Navigator.of(context).push(Register())},
                  child: Text('Register'),
>>>>>>> Stashed changes
                )
              ],
            ),
          ),
          credCard()
        ]),
      ),
    );
  }
}
