import 'package:flutter/services.dart';
import 'package:nss_connect/AddSecretary.dart';
import 'package:nss_connect/HomeDasboard.dart';
import 'package:nss_connect/Sec_Pages/NewVol.dart';
import 'package:nss_connect/Sec_Pages/SecHome.dart';

import 'package:nss_connect/poDashboard.dart';
import 'package:nss_connect/themes.dart';
import 'package:nss_connect/volunteer_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/register.dart';
import 'Blood_portal/bloodPortalHome.dart';
import 'ResetPassword.dart';
import 'Sec_Pages/EventCreate.dart';
import 'login.dart';
import 'createPoAccount.dart';
import 'welcomeTour.dart';
import 'SecretaryDashboard.dart';
import 'colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.system,

      // initialRoute: Home.id,
      routes: {
        WelcomeTour.id: (ctx) => WelcomeTour(),
        "/Home-Dashboard": (ctx) => HomeDashboard(),
        "/Login-page": (ctx) => Login(),
        "/Register": (ctx) => Register(),
        "/Create-PoAccount": (ctx) => CreatePoAccount(),
        "/Secretary-Dashboard": (ctx) => SecretaryDashboard(),
        "/Add-Volunteer": (ctx) => AddVolunteer(),
        "/Volunteer-Dashboard": (ctx) => VolunteerDashboardPage(),
        "/Blood-Portal": (ctx) => BloodPortal(),
        "/Po-Dashboard": (ctx) => PoDashboardPage(),
        "/Reset-Password": (ctx) => ResetPassword(),
        "/SecHome": (ctx) => SecHome(),
        "/Add-Secretary": (ctx) => AddSecretary(),
        "/Event-Create": (ctx) => EventCreate(),
      },
      home: WelcomeTour(),
    );
  }
}
