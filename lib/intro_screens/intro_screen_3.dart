import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';



class introscreen3 extends StatelessWidget {
  const introscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'AI Task Management',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        // Container(
        //     alignment: const Alignment(.95, -.83),
        //     child: TextButton(
        //         // style: TextButton.styleFrom(
        //         //   backgroundColor: Colors.grey.withOpacity(.3), // Set the background color
        //         // ),
        //         onPressed: () {
        //           Navigator.pushReplacement(
        //             context,
        //             PageRouteBuilder(
        //               transitionDuration: Duration(milliseconds: 300),
        //               pageBuilder: (_, __, ___) => HomeDashboard(),
        //               transitionsBuilder: (_, animation, __, child) {
        //                 return FadeTransition(
        //                   opacity: animation,
        //                   child: child,
        //                 );
        //               },
        //             ),
        //           );
        //           // nextPage(context, HomeDashboard());
        //         },
                // child: Icon(
                //   Icons.close_rounded,
                //   color: const Color.fromARGB(255, 203, 203, 203),
                //   size: 30,
        //         ))),
      ]),
    );
  }
}

// Text(
//                     'Skip',
//                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                   )