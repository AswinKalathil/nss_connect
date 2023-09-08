import 'package:flutter/material.dart';
import 'credCard.dart';
import 'package:nss_connect/themes.dart';

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
    Brightness currentBrightnessValue = themeData.brightness;
    bool isDark = currentBrightnessValue == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            //     image: DecorationImage(
            //   image: AssetImage('assets/images/doodleBack.png'),
            //   fit: BoxFit.cover,
            // )
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
