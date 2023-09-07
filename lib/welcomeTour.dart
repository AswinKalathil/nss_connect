import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nss_connect/HomeDasboard.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:smooth_page_indicator/src/effects/customizable_effect.dart';
import 'intro_screens/intro_screen_1.dart';
import 'intro_screens/intro_screen_2.dart';
import 'intro_screens/intro_screen_3.dart';
import 'package:nss_connect/sharedperfs.dart';

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
    _checkTourStatus();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _checkTourStatus() async{
    bool tourCompleted = await WelcomeTourHelper.getTourCompleted();

    if(tourCompleted){
      //If the tour has been completed earlier, the tour wont be shown again, and navigated to Home Dashboard
      nextPageReplace(context, HomeDashboard());
    }
  }

  void _marktourCompleted() async{
    await WelcomeTourHelper.setTourCompleted();
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
                    _marktourCompleted();
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 800),
                        pageBuilder: (_, __, ___) => HomeDashboard(),
                        transitionsBuilder: (_, animation, __, child) {
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                            reverseCurve: Curves.easeIn,
                          );

                          final slowCurve = CurvedAnimation(
                            parent: curvedAnimation,
                            curve: Interval(.2, .9, curve: Curves.easeOut),
                          );

                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, -1),
                              end: const Offset(0, 0),
                            ).animate(slowCurve),
                            child: child,
                          );
                        },
                      ),
                    );
                    // nextPage(context, HomeDashboard());
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    size: 30,
                  ))),
        ],
      ),
    );
  }
}
