import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nss_connect/cfmdta.dart';

class RegCard extends StatefulWidget {
  const RegCard({super.key});

  @override
  State<RegCard> createState() => _RegCardState();
}

class _RegCardState extends State<RegCard> {
  String? selectedOption = 'Volunteer';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.45,
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
              'Register Unit',
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
              'Unit No:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ),
              SizedBox(
                height: 10,
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
                hintText: 'Enter your unit no',
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

          //Login button
          GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: Text('OTP Authentication '),
                  content: Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      children: [

                        Text('OTP send to ******@gmail.com'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 68,
                              width: 55,
                              child: TextField(
                                onChanged: (value){
                                  if (value.length == 1)
                                 { FocusScope.of(context).nextFocus();}
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 55,
                              child: TextField(
                                onChanged: (value){
                                  if (value.length == 1)
                                  { FocusScope.of(context).nextFocus();}
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 55,
                              child: TextField(
                                onChanged: (value){
                                  if (value.length == 1)
                                  { FocusScope.of(context).nextFocus();}
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 55,
                              child: TextField(
                                onChanged: (value){
                                  if (value.length == 1)
                                  { FocusScope.of(context).nextFocus();}
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                  
                  ,
                  actions: [
                    TextButton(onPressed: (){Navigator.pushNamed(context,ConfirmData.id);}, child: Text('proceed'))
                  ],
                ), );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 35, 25, 173).withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.25,
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
