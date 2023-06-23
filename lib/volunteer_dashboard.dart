import 'package:flutter/material.dart';
import 'package:nss_connect/Sec_Pages/SeCert.dart';
import 'package:nss_connect/Sec_Pages/SecEvent.dart';
import 'package:nss_connect/Sec_Pages/SecHome.dart';
import 'colors.dart';
class VolunteerDashboardPage extends StatefulWidget {
  static const String id = 'volunteerDashboard';
  @override
  State<VolunteerDashboardPage> createState() => _VolunteerDashboardPageState();
}

class _VolunteerDashboardPageState extends State<VolunteerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: 3, 
    child: Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Dashboard'),
        bottom: TabBar(tabs: [
          Tab(
            text: 'Home',
            icon: Icon(Icons.home_max_outlined),
          ),
          Tab(
            text: 'Blood',
            icon: Icon(Icons.event_note_outlined),
          ),
          Tab(
            text: 'Certificate',
            icon: Icon(Icons.description_outlined),
          ),
        ],
        ),
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
