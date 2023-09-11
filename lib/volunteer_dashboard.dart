import 'package:flutter/material.dart';
import 'package:nss_connect/vol_pages/volHome.dart';
import 'package:nss_connect/vol_pages/volDuty.dart';
import 'package:nss_connect/pageTrasitions.dart';

class VolunteerDashboardPage extends StatefulWidget {
  static const String id = 'volunteerDashboard';
  @override
  State<VolunteerDashboardPage> createState() => _VolunteerDashboardPageState();
}

class _VolunteerDashboardPageState extends State<VolunteerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final height100 = MediaQuery.of(context).size.height;
    bool isDarkMode = false;
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
          actions: [
            IconButton(
                onPressed: () {
                  nextPagePushNamed(context, "/Blood-Portal");
                },
                icon: Icon(Icons.bloodtype))
          ],
        ),
        drawer: Drawer(
            child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: height100 * .2,
              child: Row(
                children: [],
              ),
            ),
            Switch(
              value: isDarkMode,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  isDarkMode = value;
                });
              },
            )
          ],
        )),
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
