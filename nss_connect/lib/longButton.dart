import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String buttonText;
  final Function buttonAction;
  // const LongButton({super.key});
  LongButton({required this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: buttonAction(),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.07,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 35, 25, 173).withOpacity(0.7),
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
