import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nss_connect/themes.dart';

class LongButton extends StatelessWidget {
  final String buttonText;
  final Function buttonAction;

  const LongButton(
      {required this.buttonText,
      required this.buttonAction,
      buttonWidth = 100});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ElevatedButton(
        onPressed: () {
          buttonAction();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: themeData.colorScheme.tertiary,
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
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nexa',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25,
              ),
            ),
          ),
        ));
  }
}

class SmallButton extends StatelessWidget {
  final String buttonText;
  final Function buttonAction;
  final double buttonWidth;

  const SmallButton(
      {required this.buttonText,
      required this.buttonAction,
      required this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ElevatedButton(
        onPressed: () {
          buttonAction();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: themeData.colorScheme.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Container(
          width: buttonWidth,
          height: MediaQuery.of(context).size.height * 0.06,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 12,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Circular',
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

class ImageInputBox extends StatefulWidget {
  @override
  _ImageInputBoxState createState() => _ImageInputBoxState();
}

class _ImageInputBoxState extends State<ImageInputBox> {
  late File _image;

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _getImage,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: _image == true
                ? Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                : Image.file(_image, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: _getImage,
          child: Text('Choose Image'),
        ),
      ],
    );
  }
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
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
      required this.submitFunction,
      required this.isPasswordEmpty,
      this.onChanged});
  final String title;
  final String placeholder;
  final TextEditingController textEditingController;
  final VoidCallback submitFunction;
  final bool isPasswordEmpty;
  final void Function(String)? onChanged;

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

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(widget.textEditingController.text);
      }
    });
  }

  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Brightness currentBrightnessValue = themeData.brightness;
    bool isDark = currentBrightnessValue == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title------------
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark
                    ? ThemeClass().darkTextColor.withOpacity(0.5)
                    : ThemeClass().lightTextColor.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: widget.isPasswordEmpty
                    ? Colors.grey.withOpacity(.3)
                    : Colors.red, // Change the border color here
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
              cursorColor: isDark
                  ? ThemeClass().darkTextColor
                  : ThemeClass().lightTextColor,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      color: _obscureText
                          ? themeData.colorScheme.onPrimary
                          : Colors.grey,
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
                  color: themeData.colorScheme.onPrimary.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
