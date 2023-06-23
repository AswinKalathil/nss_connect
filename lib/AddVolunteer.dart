import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

class AddVolunteer extends StatelessWidget {
  const AddVolunteer({super.key});
  static const String id = 'AddVolunteer';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Add New Volunteers',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: secondaryColor),
        ),
      ),
    );
  }
}
