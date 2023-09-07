import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:nss_connect/pagerouteanimations.dart';

void nextPageReplace1(BuildContext ctx, Widget pageTwo) {
  Navigator.pushReplacement(
    ctx,
    CupertinoPageRoute(
      builder: (_) => pageTwo,
      fullscreenDialog: true,
    ),
  );
}

void nextPagePush1(BuildContext ctx, Widget pageTwo) {
  Navigator.push(
    ctx,
    CupertinoPageRoute(
      builder: (_) => pageTwo,
    ),
  );
}

void nextPagePushNamed(BuildContext ctx, String routeName,
    {Object arguments = Null}) {
  Navigator.pushNamed(ctx, routeName, arguments: arguments);
}

void nextPageReplaceNamed(BuildContext ctx, String routeName,
    {Object arguments = Null}) {
  Navigator.pushReplacementNamed(ctx, routeName, arguments: arguments);
}
