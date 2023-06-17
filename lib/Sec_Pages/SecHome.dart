import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';


class SecHome extends StatefulWidget{
  const SecHome({super.key});
  static const String id = 'secretaryHome';
  @override
  State<SecHome> createState() => _SecHomeState();

}

class _SecHomeState extends State<SecHome>{
  @override
  int myCurrentIndex = 0;
  Widget build(BuildContext context) {
   return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
     selectedItemColor: primaryColor,
     unselectedItemColor: Colors.grey,
     currentIndex: myCurrentIndex,
     iconSize: 30,
     items: [
       BottomNavigationBarItem(
           icon: Icon(Icons.home_outlined), label: 'Home'),
       BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'Monitor'),
       BottomNavigationBarItem(
           icon: Icon(Icons.event_note_outlined), label: 'Event'),
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
