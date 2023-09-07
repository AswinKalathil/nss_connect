import 'package:flutter/material.dart';
import 'package:nss_connect/AddSecretary.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:nss_connect/widgetStyles.dart';

import 'colors.dart';
import 'models/events.dart';

class PoDashboardPage extends StatefulWidget {
  static const String id = 'poDashboard';
  @override
  State<PoDashboardPage> createState() => _PoDashboardPageState();
}

class _PoDashboardPageState extends State<PoDashboardPage> {
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height100 = MediaQuery.of(context).size.height;
    final width100 = MediaQuery.of(context).size.width;
    PageController _controller = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text('PO Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                nextPagePushNamed(context, "/Add-Secretary");
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
          ),
        ],
      )),
      body: poDashbody(
        controller: _controller,
        height100: height100,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
            horizontal: width100 * .09, vertical: width100 * .045),
        height: height100 * .08,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: myCurrentIndex,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_note_outlined), label: 'Events'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.description_outlined),
                  label: 'Certificates'),
            ],
            elevation: 10,
            onTap: (selectedIndex) {
              setState(() {
                myCurrentIndex = selectedIndex;
                _controller.animateToPage(selectedIndex,
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
              });
            },
          ),
        ),
      ),
    );
  }
}

class poDashbody extends StatelessWidget {
  const poDashbody({
    super.key,
    required this.height100,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  final double height100;
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: _controller,
      children: [
        EventSection(
          height100: height100,
        ),
        POrequestPage(),
      ],
    );
  }
}

class EventSection extends StatelessWidget {
  const EventSection({
    super.key,
    required this.height100,
  });

  final double height100;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: height100 * .7,
            child: GridPanels(),
          ),
        ],
      ),
    );
  }
}

class Events {
  final String title;
  final String status;
  final String Dates;

  Events({required this.title, required this.status, required this.Dates});
}

int index = 0;

class GridPanels extends StatelessWidget {
  // static const List<Color> lightColors = [
  //   Color.fromARGB(255, 255, 255, 202), // Beige
  //   Color.fromARGB(255, 255, 224, 192), // Linen
  //   Color.fromARGB(255, 197, 255, 225), // Cornsilk
  //   Color.fromARGB(255, 228, 255, 184), // Floral White
  //   Color.fromARGB(255, 165, 203, 255), // Old Lace
  //   Color.fromARGB(255, 255, 221, 233), // Papaya Whip
  // ];
  // final List<Events> PanelTitle = [
  //   Events(title: 'Dakshatha 6.O', status: 'Blood Donation Camp',Dates: '26-6-23 '),
  //   Events(title: 'KTUCare Annual Meet', status: 'Annual Volunteer Meet',Dates: '06-7-23 '),
  //   Events(title: 'Project Prithvi', status: 'Clean CET Initiative',Dates: '12-7-23 '),
  //
  // ];
  List<String> PanelTitle = [
    'Dakshatha 6.O',
    'KTUCare Annual Meet',
    'Project Prithvi',
    'Bhaala Bhavan',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: eventList.map((e) {
        return Builder(
          builder: (BuildContext context) {
            return RotationTransition(
              turns: AlwaysStoppedAnimation(1),
              child: Card(
                shape: CardShapeX(radius: 20),
                elevation: 2,
                color: lightColors[index++ % eventList.length],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(1),
                    child: Stack(
                      children: [
                        Text(
                          e.eventTitle,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),

      // List.generate(4, (index) {
      //   return RotationTransition(
      //     turns: AlwaysStoppedAnimation(-5 / 360),
      //     child: Card(
      //       shape: CardShapeX(radius: 20),
      //       elevation: 2,
      //       // color: lightColors[index],
      //       child: Padding(
      //         padding: EdgeInsets.all(10),
      //         child: RotationTransition(
      //           turns: AlwaysStoppedAnimation(5 / 360),
      //           child: Stack(children: [
      //             Text(
      //               PanelTitle[index],
      //               style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
      //             ),

      //           ]),
      //         ),
      //       ),
      //     ),
      //   );
      // }),
    );
  }
}

class Certificate {
  final String title;
  final String status;

  Certificate({required this.title, required this.status});
}

class POrequestPage extends StatelessWidget {
  final List<Certificate> pendingCertificates = [
    Certificate(title: 'Certificate 1', status: 'Verified By VS'),
    Certificate(title: 'Certificate 2', status: 'Verified By VS'),
    Certificate(title: 'Certificate 3', status: 'Verified By VS'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pendingCertificates.length,
        itemBuilder: (context, index) {
          Certificate certificate = pendingCertificates[index];
          return ListTile(
            title: Text(certificate.title),
            subtitle: Text(certificate.status),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle view button press
                //   },
                //   child: Text('View'),
                // ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle verify button press
                  },
                  child: Text('Proceed'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
