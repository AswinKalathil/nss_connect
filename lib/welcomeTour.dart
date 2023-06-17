import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nss_connect/HomeDasboard.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:smooth_page_indicator/src/effects/customizable_effect.dart';
import 'intro_screens/intro_screen_1.dart';
import 'intro_screens/intro_screen_2.dart';
import 'intro_screens/intro_screen_3.dart';

class WelcomeTour extends StatefulWidget {
  const WelcomeTour({super.key});
  static const String id = 'welcomeScreen';

  @override
  State<WelcomeTour> createState() => _WelcomeTourState();
}

class _WelcomeTourState extends State<WelcomeTour> {
  PageController _controller = PageController();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (_) async {
      if (_controller.page == 2) {
        _timer?.cancel();
        // await Future.delayed(Duration(seconds: 1));

        // nextPage(context, HomeDashboard());
      } else {
        //
        _controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              introscreen1(),
              introscreen2(),
              introscreen3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.76),
            child: SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  dotWidth: 12,
                  dotHeight: 12,
                  activeDotColor: const Color.fromARGB(255, 109, 181, 239),
                  dotColor: const Color.fromARGB(255, 203, 203, 203),
                  spacing: 8.0,
                  expansionFactor: 4,
                  strokeWidth: 2.0,
                  radius: 8,
                ),
                controller: _controller,
                count: 3),
          ),
          Container(
              alignment: const Alignment(.95, -.83),
              child: TextButton(
                  // style: TextButton.styleFrom(
                  //   backgroundColor: Colors.grey.withOpacity(.3), // Set the background color
                  // ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (_, __, ___) => HomeDashboard(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                    // nextPage(context, HomeDashboard());
                  },
                 child: Icon(
                  Icons.close_rounded,
                  color: const Color.fromARGB(255, 40, 40, 40),
                  size: 30,
                  ))),
        ],
      ),
    );
  }
}
