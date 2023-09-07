import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nss_connect/Sec_Pages/AttendenceSection.dart';
import 'package:nss_connect/models/dataModels.dart';
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
            selectedItemColor: Theme.of(context).primaryColor,
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
  @override
  Widget build(BuildContext context) {
    double tiltValue = 0 / 360;
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(6, (index) {
        return RotationTransition(
          turns: AlwaysStoppedAnimation(-tiltValue),
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                // BoxShadow(
                //   color: Colors.grey.withOpacity(0.5),
                //   spreadRadius: 2,
                //   blurRadius: 4,
                //   offset: Offset(0, 2),
                // ),
              ],
              gradient: LinearGradient(
                colors: [
                  Panels[index].color.withOpacity(0.2),
                  Panels[index].color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // color: SolidColors[index],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Transform.rotate(
                angle: tiltValue *
                    3.14159265359 /
                    180, // Convert degrees to radians
                child: Stack(
                  children: [
                    Text(
                      Panels[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // child: Card(
          //   shape: CardShapeX(radius: 20),
          //   elevation: 2,

          //   color: lightColors[index],
          //   child: Padding(
          //     padding: EdgeInsets.all(10),
          //     child: RotationTransition(
          //       turns: AlwaysStoppedAnimation(tiltValue),
          //       child: Stack(children: [
          //         Text(
          //           PanelTitle[index],
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //         ),
          //       ]),
          //     ),
          //   ),
          // ),
        );
      }),
    );
  }
}
