import 'package:flutter/material.dart';
import 'package:nss_connect/regcard.dart';
import 'credCard.dart';
import 'Secretary.dart';

class ConfirmData extends StatefulWidget {
  const ConfirmData({super.key});
  static const String id = 'ConfirmDataScreen';

  @override
  State<ConfirmData> createState() => _ConfirmDataState();
}

class _ConfirmDataState extends State<ConfirmData> {
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
                
              ],
            ),
          ),
          RegCard()
        ]),
      ),
    );
  }
}
