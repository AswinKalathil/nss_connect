import 'package:flutter/material.dart';

import 'package:nss_connect/vol_pages/volHome.dart';
import 'package:nss_connect/vol_pages/volDuty.dart';

class VolunteerDashboardPage extends StatefulWidget {
  static const String id = 'volunteerDashboard';
  @override
  State<VolunteerDashboardPage> createState() => _VolunteerDashboardPageState();
}

class _VolunteerDashboardPageState extends State<VolunteerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Volunteer Dashboard'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Home',
                icon: Icon(Icons.home_outlined),
              ),
              Tab(
                text: 'Duties',
                icon: Icon(Icons.task_alt_rounded),
              ),
            ],
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bloodtype))],
        ),
        body: TabBarView(children: [
          VolHome(
            AttendencePercent: .80,
          ),
          VolDuty(),
        ]),
      ),
    );
  }
}
