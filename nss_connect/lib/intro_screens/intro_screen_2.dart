import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

class introscreen2 extends StatelessWidget {
  const introscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      child: Center(
        child: Text(
          'Blood Donor Connection',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
