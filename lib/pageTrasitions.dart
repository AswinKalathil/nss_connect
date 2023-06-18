import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextPage(BuildContext ctx, Widget pageTwo) {
  Navigator.pushReplacement(
    ctx,
    CupertinoPageRoute(

                          builder: (_) => pageTwo,
                          // fullscreenDialog: true,
                        ),
    // PageRouteBuilder(
    //   transitionDuration: Duration(milliseconds: 300),
    //   pageBuilder: (_, __, ___) => pageTwo,
    //   transitionsBuilder: (_, animation, __, child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    // ),
  );
}
void nextPagePush(BuildContext ctx, Widget pageTwo) {
  Navigator.push(
    ctx,
    CupertinoPageRoute(
                          builder: (_) => pageTwo,
                          // fullscreenDialog: ,
                        ),
    // PageRouteBuilder(
    //   transitionDuration: Duration(milliseconds: 300),
    //   pageBuilder: (_, __, ___) => pageTwo,
    //   transitionsBuilder: (_, animation, __, child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    // ),
  );
}
