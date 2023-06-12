import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'longButton.dart';
import 'otpDialog.dart';

class RegCard extends StatefulWidget {
  const RegCard({super.key});

  @override
  State<RegCard> createState() => _RegCardState();
}

class _RegCardState extends State<RegCard> {
  String? selectedOption = 'Volunteer';
  final _unitNumberController = TextEditingController();

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
                  controller: _unitNumberController,
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

              LongButton(
                  buttonText: 'Continue',
                  buttonAction: () {
                    otpEmail(context, _unitNumberController.text);
                  })
            ]),
      ),
    );
  }
}
