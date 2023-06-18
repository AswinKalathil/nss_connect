import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';


class SecCert extends StatefulWidget{
  const SecCert({super.key});
  static const String id = 'secretaryHome';
  @override
  State<SecCert> createState() => _SecCertState();

}

class _SecCertState extends State<SecCert>{
  @override
  int myCurrentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: myCurrentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(null), label: 'Requests'),
          BottomNavigationBarItem(icon:Icon(null), label: 'Approvals'),

        ],
        elevation: 10,
        onTap: (selectedIndex) {
          setState(() {
            myCurrentIndex = selectedIndex;
          });
        },
      ),
    );
  }
}
