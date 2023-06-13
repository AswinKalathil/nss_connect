import 'package:flutter/material.dart';
import 'colors.dart';

class LongButton extends StatelessWidget {
  final String buttonText;
  final Function buttonAction;

  const LongButton({required this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          buttonAction();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.72,
          height: MediaQuery.of(context).size.height * 0.06,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 12,
          ),
          // decoration: BoxDecoration(
          //   color: primaryButton,
          //   borderRadius: BorderRadius.all(Radius.circular(5)),
          // ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25,
              ),
            ),
          ),
        ));
  }
}
