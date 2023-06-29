import 'package:flutter/material.dart';
import 'package:nss_connect/AddVolunteer.dart';
import 'package:nss_connect/Sec_Pages/SeCert.dart';
import 'package:nss_connect/Sec_Pages/SecEvent.dart';
import 'package:nss_connect/Sec_Pages/SecHome.dart';
import 'colors.dart';

class SecretaryDashboard extends StatefulWidget {
  const SecretaryDashboard({super.key});
  static const String id = 'secretaryDashboard';

  @override
  State<SecretaryDashboard> createState() => _SecretaryDashboardState();
}

class _SecretaryDashboardState extends State<SecretaryDashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 3,
      child: Scaffold(
        
        appBar: AppBar(
        
          title: Text('Secretary Dashboard'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Home',
                icon: Icon(Icons.home_outlined),
              ),
              Tab(
                text: 'Event',
                icon: Icon(Icons.event_note_outlined),
              ),
              Tab(
                text: 'Certificate',
                icon: Icon(Icons.description_outlined),
              ),
            ],
          ),
          actions: [IconButton(onPressed: () {
            Navigator.pushNamed(context,AddVolunteer.id);
          }, icon: Icon(person_add))],
        ),
        body: TabBarView(children: [
          SecHome(),
          SecEvent(),
          SecCert(),
        ]),
      ),
    );
  }
}
