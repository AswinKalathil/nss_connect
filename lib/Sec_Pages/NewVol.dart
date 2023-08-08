// import 'package:flutter/material.dart';
// import 'package:nss_connect/AddSecretary.dart';
// import 'package:nss_connect/pageTrasitions.dart';
// import 'package:nss_connect/widgetStyles.dart';
//
// import 'colors.dart';
//
// class NewVol extends StatefulWidget {
//   static const String id = 'poDashboard';
//
//   @override
//   State<NewVol> createState() => _NewVolState();
// }
//
// class _NewVolState extends State<NewVol> {
//   int myCurrentIndex = 0;
//   final PageController _controller = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     double width100 = MediaQuery.of(context).size.width;
//     double height100 = MediaQuery.of(context).size.height -
//         MediaQuery.of(context).padding.top -
//         MediaQuery.of(context).padding.bottom;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Volunteer'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // nextPagePush(context,NewVol());
//               Navigator.pushNamed(context, NewVol.id);
//             },
//             icon: Icon(Icons.person_add),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           LinearProgressIndicator(
//             value: (myCurrentIndex) / 8,
//             backgroundColor: Colors.grey[200],
//             valueColor: AlwaysStoppedAnimation<Color>(
//                 Colors.blue), // Update the value as needed
//           ),
//           Expanded(
//             child: PageView(
//               controller: _controller,
//               physics: NeverScrollableScrollPhysics(), // Disable page scrolling
//               children: [
//                 AddNewBody(
//                   height100: height100,
//                   onNextPressed: () {
//                     // _controller.nextPage(
//                     //   duration: Duration(milliseconds: 300),
//                     //   curve: Curves.easeInOut,
//                     // );
//                     setState(() {
//                       myCurrentIndex++;
//                     });
//                   },
//                 ),
//                 AddNewBody(
//                   height100: height100,
//                   onNextPressed: () {
//                     // _controller.nextPage(
//                     //   duration: Duration(milliseconds: 300),
//                     //   curve: Curves.easeInOut,
//                     // );
//                     setState(() {
//                       // myCurrentIndex++;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AddNewBody extends StatefulWidget {
//   AddNewBody({
//     Key? key,
//     required this.height100,
//     required this.onNextPressed,
//   }) : super(key: key);
//
//   final double height100;
//   final VoidCallback onNextPressed;
//
//   @override
//   State<AddNewBody> createState() => _AddNewBodyState();
// }
//
// class _AddNewBodyState extends State<AddNewBody> {
//   final TextEditingController nameController = TextEditingController();
//
//   final TextEditingController passController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Column(
//         children: [
//           TitledInputBox(
//             title: "Name",
//             placeholder: "Enter name",
//             textEditingController: nameController,
//             submitFunction: widget.onNextPressed,
//           ),
//           TitledInputBox(
//             title: "NSS ID",
//             placeholder: "Enter Id",
//             textEditingController: nameController,
//             submitFunction: widget.onNextPressed,
//           ),
//           // d
//           PassInputBox(
//               title: "Password",
//               placeholder: "Enter new Password",
//               textEditingController: passController,
//               submitFunction: () {
//                 widget.onNextPressed();
//               })
//         ],
//       ),
//     );
//   }
// }
//
// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Second Page"),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:nss_connect/backEnd/supporters.dart';

import 'package:nss_connect/widgetStyles.dart';

import '../models/dataModels.dart';

class NewVol extends StatefulWidget {
  const NewVol({super.key});
  static const String id = 'NewVol';

  @override
  State<NewVol> createState() => _NewVolState();
}

class _NewVolState extends State<NewVol> {
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
            DataCard()
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
                'Register Volunteer',
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

                  VOLUserData.add(
                      User(_nameController.text, _setPassController.text));
                  print(
                      "==============================================\nNew Volunteer Added Username: ${_nameController.text} \nPass: ${_setPassController.text}\n==============================================\n");

                  if (!_setPassController.text.isNotEmpty)
                    _setPassController.text = generateRandomPassword(6);

                  Future.delayed(Duration(milliseconds: 500), () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Volunteer Added'),
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
                    _emailController = TextEditingController();
                    _nameController = TextEditingController();
                    _setPassController = TextEditingController();
                  });
                })
          ]),
    );
  }
}
