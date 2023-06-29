import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

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
  final double padding;

  const CardShape({this.padding = 0});
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(padding);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final paddedRect = Rect.fromLTWH(
      rect.left,
      rect.top,
      rect.width,
      rect.height + padding,
    );
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          paddedRect,
          Radius.circular(10), // radius value change here
        ),
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

class TitledInputBox extends StatelessWidget {
  const TitledInputBox(
      {super.key,
      required this.title,
      required this.placeholder,
      required this.textEditingController,
      required this.submitFunction});
  final String title;
  final String placeholder;
  final TextEditingController textEditingController;
  final VoidCallback submitFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * .8,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title------------
          Container(
            // color: Colors.blue,
            alignment: AlignmentDirectional.topStart,
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          //input ----------------
          Container(
            decoration: BoxDecoration(
              // color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Colors.grey
                    .withOpacity(0.3), // Change the border color here
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: textEditingController,
              onSubmitted: (_) {
                submitFunction();
              },
              textInputAction: TextInputAction.next,
              style: TextStyle(),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.only(left: 10),
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PassInputBox extends StatefulWidget {
  const PassInputBox(
      {super.key,
      required this.title,
      required this.placeholder,
      required this.textEditingController,
      required this.submitFunction});
  final String title;
  final String placeholder;
  final TextEditingController textEditingController;
  final VoidCallback submitFunction;

  @override
  _PassInputBoxState createState() => _PassInputBoxState();
}

class _PassInputBoxState extends State<PassInputBox> {
  bool _obscureText = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * .8,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title------------
          Container(
            // color: Colors.blue,
            alignment: AlignmentDirectional.topStart,
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color:
                    Colors.grey.withOpacity(.3), // Change the border color here
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: widget.textEditingController,
              onSubmitted: (_) {
                widget.submitFunction();
              },
              textInputAction: TextInputAction.next,
              obscureText: !_obscureText,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      color: _obscureText ? primaryColor : Colors.grey,
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggle),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.only(left: 10),
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
