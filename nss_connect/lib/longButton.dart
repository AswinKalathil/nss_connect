import 'package:flutter/material.dart';
import 'colors.dart';

class LongButton extends StatelessWidget {
  final String buttonText;
  final Function buttonAction;
  // const LongButton({super.key});
  const LongButton({required this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          buttonAction();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.07,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: primaryButton,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.25,
              ),
            ),
          ),
        ));
  }
}
