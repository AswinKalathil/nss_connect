import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets\\images\\doodleBack.png'),
          fit: BoxFit.cover,
        )),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 50, right: 10),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dropdown',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.06,
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsets.only(bottom: 10, left: 30),
                  child: Text(
                    'Your Username',
                    style: TextStyle(
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
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
