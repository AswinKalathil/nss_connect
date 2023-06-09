import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_screens/intro_screen_1.dart';
import 'intro_screens/intro_screen_2.dart';
import 'intro_screens/intro_screen_3.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String id = 'welcomeScreen';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
           PageView(
            controller: _controller,
            children: [ 
              introscreen1(),
              introscreen2(),
              introscreen3(),
            ],
           ),

           Container(
            alignment: const Alignment(0,0.75),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Login.id);
              },
              child: Text('Skip'),
              ),
            SmoothPageIndicator(controller: _controller, count: 3),
            GestureDetector(
              onTap: () {
                _controller.nextPage(
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeIn
                  );
              },
              child: Text('Next'),
              ),
              ],
            )
           )
      ],
      ),
    );
  }
  }
