import 'package:flutter/material.dart';


class SecretaryDashboard extends StatefulWidget{
 const SecretaryDashboard({super.key});
 static const String id = 'secretaryDashboard';
  @override
  State<SecretaryDashboard> createState() => _SecretaryDashboardState();

}

class _SecretaryDashboardState extends State<SecretaryDashboard>{
  int myCurrentIndex=3;
  @override


  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('secretary Dashboard'),
    ),
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.blueGrey,
      currentIndex: myCurrentIndex,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label:'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.monitor),
            label:'Monitor'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label:'Event'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_outlined),
            label:'Services'
        ),
      ],),
  );
}

}




