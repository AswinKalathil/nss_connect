import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.green,
              ),
            ],
           ),

           Container(
            alignment: Alignment(0,0.75),
            child: SmoothPageIndicator(controller: _controller, count: 3),
           )
      ],
      ),
    );
  }
  }
