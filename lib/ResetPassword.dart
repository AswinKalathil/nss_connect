import 'package:flutter/material.dart';

import 'package:nss_connect/accountDataCards.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static const String id = 'ResetPasswordScreen';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
  // final String userId = ModalRoute.of(context)!.settings.arguments as String;

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
            padding: const EdgeInsets.only(top: 500, right: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
          UserDataCard()
        ]),
      ),
    );
  }
}
