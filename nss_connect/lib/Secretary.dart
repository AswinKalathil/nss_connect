import 'package:flutter/material.dart';

class SecretaryDashboard extends StatelessWidget {
  const SecretaryDashboard({super.key});
  static const String id = 'secretaryDashboard';
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
