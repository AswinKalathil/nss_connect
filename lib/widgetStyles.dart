import 'package:flutter/material.dart';

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
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
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

class CardShape extends ShapeBorder {
  const CardShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
            rect, Radius.circular(10)), // radius value change here
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class CardShapeX extends ShapeBorder {
  const CardShapeX({required this.radius});
  final double radius;
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(
        
        RRect.fromRectAndRadius(
            rect, Radius.circular(radius)), // radius value change here
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
