import 'package:flutter/material.dart';
import 'register.dart';
import 'otpDialog.dart';
import 'longButton.dart';

class credCard extends StatefulWidget {
  const credCard({super.key});

  @override
  State<credCard> createState() => _credCardState();
}

class _credCardState extends State<credCard> {
  String? selectedOption = 'Volunteer';
  String? poString = 'PO';
  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: Duration(microseconds: 5000),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height *
          (selectedOption == poString ? 0.72 : .6),
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Card(
        color: Colors.white,
        elevation: 20,
        child: AnimatedContainer(
          duration: Duration(microseconds: 5000),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
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
            DropdownButton<String>(
              alignment: Alignment.center,
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'Volunteer',
                  child: Text('Volunteer'),
                ),
                DropdownMenuItem<String>(
                  value: 'PO',
                  child: Text(
                    'Program Officer',
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'Secretary',
                  child: Text('Secretary'),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
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
                  color: Colors.grey
                      .withOpacity(.3), // Change the border color here
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
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
                      otp(context, 'ghhj');
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

            //Login button

            LongButton(buttonText: 'Login', buttonAction: () {}),

            if (selectedOption == poString)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'or',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            if (selectedOption == poString)
              LongButton(
                  buttonText: 'Register Unit',
                  buttonAction: () {
                    Navigator.pushNamed(context, Register.id);
                  }),
          ]),
        ),
      ),
    );
  }
}
