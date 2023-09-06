import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

class introscreen3 extends StatelessWidget {
  const introscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'AI Task Management',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ]),
    );
  }
}
