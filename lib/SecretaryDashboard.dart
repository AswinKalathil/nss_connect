import 'package:flutter/material.dart';
import 'package:nss_connect/Sec_Pages/NewVol.dart';
import 'package:nss_connect/Sec_Pages/SeCert.dart';
import 'package:nss_connect/Sec_Pages/SecEvent.dart';
import 'package:nss_connect/Sec_Pages/SecHome.dart';
import 'package:nss_connect/globals.dart';
import 'package:nss_connect/sharedperfs.dart';
import 'package:nss_connect/themes.dart';
import 'colors.dart';

class SecretaryDashboard extends StatefulWidget {
  const SecretaryDashboard({super.key});
  static const String id = 'secretaryDashboard';

  @override
  State<SecretaryDashboard> createState() => _SecretaryDashboardState();
}

class _SecretaryDashboardState extends State<SecretaryDashboard> {
  bool toggle = false;
  void _setIcon() {
    setState(() {
      toggle = !toggle;
    });
  }

  void setisDark() async {
    await ThemePreferenceHelper.setisDark();
  }

  void setisNotDark() async {
    await ThemePreferenceHelper.setisnotDark();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    ThemeData themeData = Theme.of(context);

    final height100 = MediaQuery.of(context).size.height;
    final width100 = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Secretary Dashboard',
              style: TextStyle(color: ThemeClass().darkTextColor)),
          backgroundColor: isDark
              ? ThemeClass().darkAccentColor
              : ThemeClass().lightAccentColor,
          foregroundColor: ThemeClass().darkTextColor,
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
          child: Container(
            color: themeData.colorScheme.secondary,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.tertiary,
                  height: height100 * .2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: width100 * .2,
                            height: width100 * .2,
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.secondary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  color: ThemeClass().darkTextColor,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        height: double.maxFinite,
                        width: width100 * .4,
                        child: IconButton(
                            onPressed: () {
                              isDark = !isDark;
                              darkNotifier.value = isDark;
                              if (darkNotifier.value) {
                                setisDark();
                              } else {
                                setisNotDark();
                              }
                              _setIcon();
                            },
                            icon: !isDark
                                ? Icon(Icons.dark_mode)
                                : Icon(Icons.light_mode)),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.help_outline_outlined),
                    onPressed: () {},
                  ),
                  title: Text('Help'),
                  onTap: () {},
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.settings_outlined),
                    onPressed: () {},
                  ),
                  title: Text('Settings'),
                  onTap: () {},
                ),
                //DON'T USE EXPANDED INSIDE LIST. IT CAN ONLY BE USED INSIDE COLUMN, ROW, OR FLEX.
                // Expanded(
                //     child: Container(
                //   height: height100 * .55,
                // )),
                SizedBox(
                  height: height100 * 0.6,
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {},
                  ),
                  title: Text('Logout'),
                  onTap: () {},
                ),
              ],
            ),
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
