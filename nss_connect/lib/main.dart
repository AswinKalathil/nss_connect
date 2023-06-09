import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/register.dart';
import 'login.dart';
import 'cfmdta.dart';
import 'home.dart';
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
          Home.id: (ctx) => Home(),
          Login.id: (ctx) => Login(),
          Register.id: (ctx) => Register(),
          ConfirmData.id: (ctx) => ConfirmData(),
        },
        home: AnimatedSplashScreen(
            duration: 1500,
            splash: Icons.home,
            nextScreen: Home(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.rightToLeft,
            centered: true,
            backgroundColor: Color.fromARGB(255, 237, 83, 83))
        // home: const Login(),
        );
  }
}
