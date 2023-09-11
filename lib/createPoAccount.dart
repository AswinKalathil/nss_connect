import 'package:flutter/material.dart';
import 'package:nss_connect/accountDataCards.dart';

class CreatePoAccount extends StatefulWidget {
  const CreatePoAccount({super.key});

  static const String id = 'CreatePoAccountScreen';

  @override
  State<CreatePoAccount> createState() => _CreatePoAccountState();
}

class _CreatePoAccountState extends State<CreatePoAccount> {
  @override
  Widget build(BuildContext context) {
    // final String unitNumber = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/doodleBack.png'),
          fit: BoxFit.cover,
        )),
        child: Column(children: [
          Flexible(flex: 2, fit: FlexFit.tight, child: Container()),
          AccountDataCard(),
          Flexible(flex: 3, fit: FlexFit.tight, child: Container()),
        ]),
      ),
    );
  }
}
