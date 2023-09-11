import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:nss_connect/themes.dart';
import 'package:nss_connect/widgetStyles.dart';
import 'models/dataModels.dart';
import 'dart:async';
import 'otpDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:nss_connect/animation.dart';

class credCard extends StatefulWidget {
  const credCard({super.key});

  @override
  State<credCard> createState() => _credCardState();
}

class _credCardState extends State<credCard> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final textFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();
  bool _isUsernameEmpty = true;
  bool _isPasswordEmpty = true;
  bool _isNotValid = false;
  Timer? _invalidTimer;
  Timer? _errorTimer;

  String _selectedOption = "/Volunteer-Dashboard";
  String? poString = "/Po-Dashboard";
  String? volString = "/Volunteer-Dashboard";
  String? secString = "/Secretary-Dashboard";

  List<User> loginData = List.empty();
  Widget? nextRoute;

  @override
  void dispose() {
    _errorTimer?.cancel();
    _invalidTimer?.cancel();
    super.dispose();
  }

  void _onTextFieldChange() {
    setState(() {
      print("Setting both to true");
      _isUsernameEmpty = true;
      _isPasswordEmpty = true;
      _isNotValid = false;
    });
  }

  void _submitData() {
    final enteredUsername = _userNameController.text;
    final enteredPassword = _passwordController.text;
    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _isUsernameEmpty = enteredUsername.isNotEmpty;
        _isPasswordEmpty = enteredPassword.isNotEmpty;
      });
      if (!_isUsernameEmpty || !_isPasswordEmpty) {
        print("Setting error flags to true and starting timer");
        setState(() {
          textFieldErrorShakeKey.currentState?.shakeWidget();
        });

        _errorTimer?.cancel();

        _errorTimer = Timer(Duration(seconds: 10), () {
          setState(() {
            _isUsernameEmpty = true;
            _isPasswordEmpty = true;
          });
        });
        return;
      }
    }
    print("Username: $enteredUsername\nPassword: $enteredPassword");
    if (_selectedOption == volString) {
      loginData = VOLUserData;
    } else if (_selectedOption == poString) {
      loginData = POUserData;
    } else if (_selectedOption == secString) {
      loginData = SECUserData;
    }

    bool isCredentialsValid = false;
    for (User user in loginData) {
      print("Database------\n");
      print(user.userName + " " + user.password);
      if (user.userName == enteredUsername &&
          user.password == enteredPassword) {
        isCredentialsValid = true;
        setState(() {
          _isNotValid = false;
        });
        break;
      }
    }
    print(isCredentialsValid);
    if (isCredentialsValid) {
      print("Username: $enteredUsername\nPassword: $enteredPassword");
      FocusScope.of(context).requestFocus(FocusNode());
      nextPageReplaceNamed(context, _selectedOption);
    } else {
      setState(() {
        _isNotValid = true;
      });
    }
  }

  void _credValid() {
    if (_isNotValid) {
      setState(() {
        _invalidTimer = Timer(Duration(seconds: 10), () {
          setState(() {
            _isNotValid = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Brightness currentBrightnessValue = themeData.brightness;
    bool isDark = currentBrightnessValue == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 8,
      child: Card(
        shape: CardShape(padding: 50),
        color: themeData.colorScheme.secondary,
        elevation: 10,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'Login as',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nexa',
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
                buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                )),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  elevation: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    border: Border.all(
                      color: isDark
                          ? ThemeClass().darkTextColor.withOpacity(0.3)
                          : ThemeClass().lightTextColor.withOpacity(0.3),
                    ),
                  ),
                ),
                alignment: AlignmentDirectional.centerStart,
                isExpanded: false,
                value: _selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue as String;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: "/Volunteer-Dashboard",
                    child: Text(
                      'Volunteer',
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "/Po-Dashboard",
                    child: Text('Program Officer'),
                  ),
                  DropdownMenuItem<String>(
                    value: "/Secretary-Dashboard",
                    child: Text('Secretary'),
                  ),
                ]),
          ),

          SizedBox(
            height: 10,
          ),
          if (!_isUsernameEmpty || !_isPasswordEmpty)
            ShakeWidget(
              key: textFieldErrorShakeKey,
              shakeOffset: 5.0,
              shakeDuration: Duration(milliseconds: 500),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                padding: EdgeInsets.only(bottom: 10, left: 5, top: 3),
                width: MediaQuery.of(context).size.width * 0.8,
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: ThemeData().colorScheme.error,
                          fontSize: 16,
                        ),
                        children: [
                      WidgetSpan(
                          child: Icon(
                              CupertinoIcons.exclamationmark_circle_fill,
                              size: 19.5,
                              color: ThemeData().colorScheme.error)),
                      TextSpan(text: " Please enter a value")
                    ])),
              ),
            ),
          if (_isNotValid)
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.only(bottom: 10, left: 30),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: ThemeData().colorScheme.error,
                    fontSize: 16,
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(CupertinoIcons.exclamationmark_circle_fill,
                          size: 19.5, color: ThemeData().colorScheme.error),
                    ),
                    TextSpan(text: " Invalid Username or Password")
                  ],
                ),
              ),
            ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: EdgeInsets.only(bottom: 10, left: 30),
            child: Text(
              'Username',
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
                color: _isUsernameEmpty
                    ? Colors.grey.withOpacity(0.3)
                    : ThemeData()
                        .colorScheme
                        .error, // Change the border color here
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              onChanged: (_) {
                _onTextFieldChange();
              },
              controller: _userNameController,
              onSubmitted: (_) {
                _submitData();
              },
              textInputAction: TextInputAction.next,
              style: TextStyle(),
              cursorColor: isDark
                  ? ThemeClass().darkTextColor.withOpacity(0.5)
                  : ThemeClass().lightTextColor.withOpacity(0.5),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.only(left: 10),
                hintText: 'Enter your Username',
                hintStyle: TextStyle(
                  color: isDark
                      ? ThemeClass().darkTextColor.withOpacity(0.4)
                      : ThemeClass().lightTextColor.withOpacity(0.4),
                ),
              ),
            ),
          ),
          PassInputBox(
              title: "Password",
              placeholder: "Enter your Password",
              textEditingController: _passwordController,
              isPasswordEmpty: _isPasswordEmpty,
              onChanged: (_) {
                _onTextFieldChange();
              },
              submitFunction: () {
                _submitData();
              }),
          SizedBox(
            height: 15,
          ),

          //forgot password container
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    otpPhone(context, 'ss');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: themeData.colorScheme.onPrimary.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //Register button
          LongButton(
              buttonText: 'Login',
              buttonAction: () {
                print('Pressed login');
                _submitData();
                _credValid();
              }),
          if (_selectedOption == poString)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'or',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          if (_selectedOption == poString)
            LongButton(
                buttonText: 'Register Unit',
                buttonAction: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  nextPagePushNamed(context, "/Register");
                })
        ]),
      ),
    );
  }
}
