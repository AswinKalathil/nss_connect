import 'package:flutter/material.dart';

import 'package:nss_connect/accountDataCards.dart';

class CreatePoAccount extends StatefulWidget {
  const CreatePoAccount({super.key,required this.unitNumber});
  final String unitNumber;
  static const String id = 'CreatePoAccountScreen';

  @override
  State<CreatePoAccount> createState() => _CreatePoAccountState();
}

class _CreatePoAccountState extends State<CreatePoAccount> {
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
            padding: const EdgeInsets.only(top: 500, right: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
          AccountDataCard()
        ]),
      ),
    );
  }
}
