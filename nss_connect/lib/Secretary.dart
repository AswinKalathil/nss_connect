import 'package:flutter/material.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destination Page'),
      ),
      body: Center(
        child: Text('This is the destination page.'),
      ),
    );
  }
}
