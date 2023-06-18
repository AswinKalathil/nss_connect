import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

class SecEvent extends StatelessWidget {
  const SecEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Event Details',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
