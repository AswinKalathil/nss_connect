import 'package:flutter/services.dart';
import 'package:nss_connect/AddSecretary.dart';
import 'package:nss_connect/HomeDasboard.dart';
import 'package:nss_connect/Sec_Pages/SecHome.dart';
import 'package:nss_connect/login2.dart';
import 'package:nss_connect/poDashboard.dart';
import 'package:nss_connect/themes.dart';
import 'package:nss_connect/volunteer_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/register.dart';
import 'Sec_Pages/EventCreate.dart';
import 'login.dart';
import 'createPoAccount.dart';
import 'welcomeTour.dart';
import 'Secretary.dart';
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
        SecHome.id: (ctx) => SecHome(),
        AddVolunteer.id: (ctx) => AddVolunteer(),
        EventApp.id: (ctx) => EventApp(),
      },
      home: WelcomeTour(),
    );
  }
}
