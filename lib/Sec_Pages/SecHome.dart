import 'package:flutter/material.dart';
import 'package:nss_connect/Sec_Pages/AttendenceSection.dart';
import 'package:nss_connect/globals.dart';
import 'package:nss_connect/models/dataModels.dart';
import 'package:nss_connect/themes.dart';

class SecHome extends StatefulWidget {
  const SecHome({super.key});
  static const String id = 'secretaryHome';
  @override
  State<SecHome> createState() => _SecHomeState();
}

class _SecHomeState extends State<SecHome> {
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int myCurrentIndex = 0;
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    ThemeData themeData = Theme.of(context);
    double displaywidth = MediaQuery.of(context).size.width * 0.9;
    double height100 = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: isDark? themeData.colorScheme.secondary : themeData.colorScheme.primary,
      body: secHomeBody(
        controller: _controller,
        height100: height100,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark? themeData.colorScheme.secondary : themeData.colorScheme.primary,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: displaywidth * .10, vertical: displaywidth * .05),
        height: height100 * .08,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            backgroundColor: isDark? themeData.colorScheme.primary : themeData.colorScheme.secondary,
            selectedItemColor: themeData.colorScheme.onPrimary.withOpacity(1),
            unselectedItemColor:
                themeData.colorScheme.onPrimary.withOpacity(0.3),
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
        GridPanels(),
        AttendenceSection(),
      ],
    );
  }
}

class GridPanels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height100 = MediaQuery.of(context).size.height;
    double width100 = MediaQuery.of(context).size.width;

    ThemeData themeData = Theme.of(context);
    bool isDark = darkNotifier.value;
    double tiltValue = 0 / 360;
    return Container(
      
      padding: EdgeInsets.all(10),
      height: height100 * .35,
      child: Stack(
        children: [

          GridView.count(
            crossAxisCount: 3,
            children: List.generate(6, (index) {
              return RotationTransition(
                turns: AlwaysStoppedAnimation(-tiltValue),
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [],
                    color: Colors.white
                   
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Transform.rotate(
                      angle: tiltValue *
                          3.14159265359 /
                          180, // Convert degrees to radians
                      
                    ),
                  ),
                ),
              );
            }),
          ),
          GridView.count(
            crossAxisCount: 3,
            children: List.generate(6, (index) {
              return RotationTransition(
                turns: AlwaysStoppedAnimation(-tiltValue),
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [],
                    gradient: LinearGradient(
                      colors: [
                        Panels[index].color.withOpacity(0.5),
                        Panels[index].color,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
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
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeClass().lightTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          
        ],
      ),
    );
  }
}
