import 'package:flutter/material.dart';

void nextPage(BuildContext ctx, Widget pageTwo) {
  Navigator.pushReplacement(
    ctx,
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => pageTwo,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
void nextPagePush(BuildContext ctx, Widget pageTwo) {
  Navigator.push(
    ctx,
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => pageTwo,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
