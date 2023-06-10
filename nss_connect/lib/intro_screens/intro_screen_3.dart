import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

class introscreen3 extends StatelessWidget {
  const introscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Center(
        child: Text(
          'AI Task Management',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
