import 'package:flutter/material.dart';
import 'package:nss_connect/widgetStyles.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'register.dart';
import 'otpDialog.dart';

class credCard extends StatefulWidget {
  const credCard({super.key});

  @override
  State<credCard> createState() => _credCardState();
}

class _credCardState extends State<credCard> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedOption = 'volunteerDashboard';
  String? poString = 'poDashboard';

  void _submitData() {
    final enterdUsername = _userNameController.text;
    final enterdPassword = _passwordController.text;
    String nextPageId;
    if (enterdUsername.isEmpty || enterdPassword.isEmpty) {
      return;
    }

    print("user name: $enterdUsername\npassword: $enterdPassword");
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(_selectedOption as String);
    // if (_selectedOption == 'SecretaryDashboard')
    //   Navigator.of(context).pushReplacementNamed(id);
    // else if (_selectedOption == 'VolunteerDashboard')
    //   Navigator.of(context).pushReplacementNamed(VolunteerDashboard.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height *
          (_selectedOption == poString ? 0.72 : .6),
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: CardShape(),
        color: Colors.white,
        elevation: 10,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'Login as',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nexa',
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'volunteerDashboard',
                  child: Text(
                    'Volunteer',
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'poDashboard',
                  child: Text('Program officer'),
                ),
                DropdownMenuItem<String>(
                  value: 'secretaryDashboard',
                  child: Text('Secretary'),
                ),
              ],
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
                color: Colors.grey.shade600,
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
              controller: _userNameController,
              onSubmitted: (_) {
                _submitData();
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
                hintText: 'Enter your username',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: EdgeInsets.only(bottom: 10, left: 30, top: 10),
            child: Text(
              'Password',
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
              controller: _passwordController,
              onSubmitted: (_) {
                _submitData();
              },
              textInputAction: TextInputAction.next,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.only(left: 10),
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),

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
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.7),
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
                  // nextPage(context, Register());
                  Navigator.pushNamed(context, Register.id);
                })
        ]),
      ),
    );
  }
}
