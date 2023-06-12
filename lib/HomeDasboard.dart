import 'package:flutter/material.dart';
import 'package:nss_connect/login.dart';
import 'package:nss_connect/longButton.dart';
import 'package:nss_connect/pageTrasitions.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});
  static const String id = 'homeDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Dashboard'),
      ),
      body: Center(
        child: LongButton(
            buttonText: 'Login',
            buttonAction: () => nextPagePush(context,Login())),
      ),
    );
  }
}
