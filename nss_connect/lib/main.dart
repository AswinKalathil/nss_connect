import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nexa',
      ),
      initialRoute: Login.id,
      routes: {
        Login.id: (ctx) => Login(),
        Register.id: (ctx) => Register(),
      },
      home: const Login(),
    );
  }
}
