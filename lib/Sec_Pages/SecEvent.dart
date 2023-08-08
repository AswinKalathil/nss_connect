import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

import 'EventApp.dart';

class SecEvent extends StatelessWidget {
  const SecEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
      onPressed: () {
        // Add your action here
        Navigator.pushNamed(context,EventApp.id);
      },
      child: Icon(Icons.add),
      backgroundColor: primaryButton, // Customize FAB color
    ),
    );
  }
}
