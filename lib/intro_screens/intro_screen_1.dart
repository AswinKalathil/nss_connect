import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

class introscreen1 extends StatelessWidget {
  const introscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Manage Volunteers',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: secondaryColor),
        ),
      ),
    );
  }
}
