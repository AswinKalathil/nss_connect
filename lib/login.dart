import 'package:flutter/material.dart';
import 'credCard.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String id = 'loginScreen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Brightness currentBrightness = themeData.brightness;
    bool isDark = currentBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: isDark? themeData.colorScheme.primary : themeData.colorScheme.secondary,
          ),
          child: Column(children: [
            Flexible(flex: 1, fit: FlexFit.tight, child: Container()),
            credCard(),
            Flexible(flex: 2, fit: FlexFit.tight, child: Container()),
          ]),
        ),
      ),
    );
  }
}
