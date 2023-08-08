import 'package:flutter/material.dart';
import 'package:nss_connect/backEnd/supporters.dart';
import 'package:nss_connect/models/dataModels.dart';

import 'package:nss_connect/widgetStyles.dart';

class AddVolunteer extends StatefulWidget {
  const AddVolunteer({super.key});
  static const String id = 'AddVolunteer';

  @override
  State<AddVolunteer> createState() => _AddVolunteerState();
}

class _AddVolunteerState extends State<AddVolunteer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage('assets/images/doodleBack.png'),
          //   fit: BoxFit.cover,
          // )),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            DataCard(),
          ]),
        ),
      ),
    );
  }
}

class DataCard extends StatefulWidget {
  const DataCard({super.key});

  @override
  State<DataCard> createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _setPassController = TextEditingController();

  bool _validateInputs() {
    return _nameController.text.isNotEmpty && _emailController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      // child: Card(
      //   shape: CardShape(padding: 50),
      //   color: Colors.white,
      //   elevation: 10,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Register Secretary',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nexa',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TitledInputBox(
                title: "Username",
                placeholder: "Enter Username",
                textEditingController: _nameController,
                submitFunction: () => {}),
            TitledInputBox(
                title: "Email",
                placeholder: "Enter Email",
                textEditingController: _emailController,
                submitFunction: () => {}),
            PassInputBox(
                title: "Set Password",
                placeholder: "Auto Generated",
                textEditingController: _setPassController,
                submitFunction: () =>
                    {_setPassController.text = generateRandomPassword(6)}),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 20,
            ),
            LongButton(
                buttonText: 'Register',
                buttonAction: () {
                  if (!_validateInputs()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Fill Username and Password"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  if (!_setPassController.text.isNotEmpty)
                    _setPassController.text = generateRandomPassword(6);

                  SECUserData.add(
                      User(_nameController.text, _setPassController.text));
                  print(
                      "==============================================\nNew Secretary Added Username: ${_nameController.text} \nSPass: ${_setPassController.text}\n==============================================\n");
                  Future.delayed(Duration(seconds: 1), () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Secretary Added'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    _emailController.text = '';
                    _nameController.text = '';
                    _setPassController.text = '';
                  });
                }),
          ]),
    );
  }
}
