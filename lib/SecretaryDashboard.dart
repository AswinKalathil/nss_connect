import 'package:flutter/material.dart';
import 'package:nss_connect/Sec_Pages/NewVol.dart';
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
    final height100 = MediaQuery.of(context).size.height;
    // final width100 = MediaQuery.of(context).size.width;
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
          actions: [
            IconButton(
                onPressed: () {
                  addVolunteerSheet(context);
                },
                icon: Icon(person_add))
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
          ],
        )),
        body: TabBarView(children: [
          SecHome(),
          SecEvent(),
          SecCert(),
        ]),
      ),
    );
  }
}
void addVolunteerSheet(BuildContext ctx) async {
  var result = await showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    builder: (_) {
      return SizedBox(
        height: (MediaQuery.of(ctx).size.height * .6) +
            MediaQuery.of(ctx).viewInsets.bottom,
        child: GestureDetector(
          onTap: () {},
          child: DataCard(),
          behavior: HitTestBehavior.opaque,
        ),
      );
    },
  );
}
