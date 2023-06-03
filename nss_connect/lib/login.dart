import 'package:flutter/material.dart';
import 'Secretary.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String selectedOption = 'Volunteer';

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
      DropdownButton<String>(
        value: selectedOption,
        onChanged: (String? newValue) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DestinationPage(),
            ),
          );
        },
        items: [
          DropdownMenuItem<String>(
            value: 'Volunteer',
            child: Text('Volunteer'),
          ),
          DropdownMenuItem<String>(
            value: 'PO',
            child: Text('PO'),
          ),
          DropdownMenuItem<String>(
            value: 'Secretary',
            child: Text('Secretary'),
          ),
        ],
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
                      fontFamily: 'Nexa',
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
             width: MediaQuery.of(context).size.width*0.8,
             padding: EdgeInsets.symmetric(horizontal: 8),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 GestureDetector(
                   onTap: (){},
                   child: Text('Forgot Password',
                   style: TextStyle(
                     color: Colors.grey.withOpacity(0.7),
                     fontSize: 15,
                     fontWeight: FontWeight.w500,
                   ),),
                 )
               ],
             ),
           ),
           SizedBox(
            height: 20,
           ),

//Login button   
       GestureDetector(
             onTap: (){},
             child: Container(
               width: MediaQuery.of(context).size.width*0.8,
               height: MediaQuery.of(context).size.height*0.07,
               padding: EdgeInsets.symmetric(
                   vertical: 5,
                  horizontal: 12,
               ),
               decoration: BoxDecoration(
                color: Color.fromARGB(255, 35, 25, 173).withOpacity(0.7),
                 borderRadius: BorderRadius.all(Radius.circular(5)),
               ),
               child: Center(
                 child: Text('Login',
                 style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.w400,
                 letterSpacing: 1.25,
               ),),
               ),
             )
           )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
