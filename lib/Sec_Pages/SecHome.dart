import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nss_connect/widgetStyles.dart';
import '../colors.dart';

class SecHome extends StatefulWidget {
  const SecHome({super.key});
  static const String id = 'secretaryHome';
  @override
  State<SecHome> createState() => _SecHomeState();
}

class _SecHomeState extends State<SecHome> {
  int myCurrentIndex = 0;
  Widget build(BuildContext context) {
    double displaywidth = MediaQuery.of(context).size.width * 0.9;
    double height100 = MediaQuery.of(context).size.height;
    PageController _controller = PageController();
    return Scaffold(
      body: secHomeBody(
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
            horizontal: displaywidth * .10, vertical: displaywidth * .05),
        height: height100 * .08,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: myCurrentIndex,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined), label: 'Panel'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.domain_verification_outlined),
                  label: 'Attendance'),
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

class secHomeBody extends StatelessWidget {
  const secHomeBody({
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
        panelSection(
          height100: height100,
        ),
        AttendenceSection(),
      ],
    );
  }
}

class AttendenceSection extends StatefulWidget {
  @override
  _AttendenceSectionState createState() => _AttendenceSectionState();
}

class _AttendenceSectionState extends State<AttendenceSection> {
  List<String> names = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'Robert Brown',
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'Robert Brown',
  ];
  List<bool> attendance = [];

  @override
  void initState() {
    super.initState();
    // Initialize the attendance list with false values
    attendance = List<bool>.generate(names.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Mark Attendance',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(names[index]),
                trailing: Checkbox(
                  value: attendance[index],
                  onChanged: (value) {
                    setState(() {
                      attendance[index] = value!;
                    });
                  },
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // Process the attendance data
              List<String> presentStudents = [];
              for (int i = 0; i < names.length; i++) {
                if (attendance[i]) {
                  presentStudents.add(names[i]);
                }
              }
              // Print the list of students present
              print('Present Students: $presentStudents');
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }
}

class panelSection extends StatelessWidget {
  const panelSection({
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
            height: height100 * .35,
            child: GridPanels(),
          ),
        ],
      ),
    );
  }
}

class GridPanels extends StatelessWidget {
  static const List<Color> lightColors = [
    Color(0xFFFFEFD5),
    Color(0xFFFAF0E6),
    Color(0xFFF5F5DC),
    Color(0xFFFFF8DC),
    Color(0xFFFFFAF0),
    Color(0xFFFDF5E6),
    // Papaya Whip
  ];
  static const List<String> PanelTitle = [
    'Blood',
    'SIP',
    'EEC',
    'Education',
    'Program',
    'Media',
    // Papaya Whip
  ];
  @override
  Widget build(BuildContext context) {
    double tiltValue = 0 / 360;
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(6, (index) {
        return RotationTransition(
          turns: AlwaysStoppedAnimation(-tiltValue),
          child: Card(
            shape: CardShapeX(radius: 20),
            elevation: 2,
            color: lightColors[index],
            child: Padding(
              padding: EdgeInsets.all(10),
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(tiltValue),
                child: Stack(children: [
                  Text(
                    PanelTitle[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
