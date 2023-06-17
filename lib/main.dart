import 'package:nss_connect/HomeDasboard.dart';
import 'package:nss_connect/login2.dart';
import 'package:nss_connect/poDashboard.dart';
import 'package:nss_connect/volunteer_dashboard.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/register.dart';
import 'login.dart';
import 'createPoAccount.dart';
import 'welcomeTour.dart';
import 'Secretary.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        buttonTheme:
            ThemeData().buttonTheme.copyWith(buttonColor: primaryButton),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
            ),
      ),
      // initialRoute: Home.id,
      routes: {
        WelcomeTour.id: (ctx) => WelcomeTour(),
        HomeDashboard.id: (ctx) => HomeDashboard(),
        Login.id: (ctx) => Login(),
        Register.id: (ctx) => Register(),
        CreatePoAccount.id: (ctx) => CreatePoAccount(
              unitNumber: 'gg',
            ),
        SecretaryDashboard.id: (ctx) => SecretaryDashboard(),
        VolunteerDashboardPage.id: (ctx) => VolunteerDashboardPage(),
        PoDashboardPage.id: (ctx) => PoDashboardPage(),
        Login2.id: (ctx) => Login2(),
      },
      home: WelcomeTour(),
    );
  }
}
