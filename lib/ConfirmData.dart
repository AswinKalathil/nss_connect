import 'package:flutter/material.dart';
import 'widgetStyles.dart';

class ConfirmData extends StatefulWidget {
  const ConfirmData({super.key});
  static const String id = 'ConfirmDataScreen';

  @override
  State<ConfirmData> createState() => _ConfirmDataState();
}

class _ConfirmDataState extends State<ConfirmData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/doodleBack.png'),
          fit: BoxFit.cover,
        )),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 500, right: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
          ConfirmCard()
        ]),
      ),
    );
  }
}

class ConfirmCard extends StatefulWidget {
  const ConfirmCard({super.key});

  @override
  State<ConfirmCard> createState() => _ConfirmCardState();
}

class _ConfirmCardState extends State<ConfirmCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Create Account',
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
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: EdgeInsets.only(bottom: 10, left: 30, top: 10),
                child: Text(
                  'Confirm Password',
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
                  obscureText: false,
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

              SizedBox(
                height: 20,
              ),

              LongButton(buttonText: 'SignUp', buttonAction: () {})
            ]),
      ),
    );
  }
}
