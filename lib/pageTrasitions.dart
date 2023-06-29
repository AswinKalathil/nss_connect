import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:nss_connect/pagerouteanimations.dart';

void nextPageReplace(BuildContext ctx, Widget pageTwo) {
  Navigator.pushReplacement(
    ctx,
    CupertinoPageRoute(
      builder: (_) => pageTwo,
      fullscreenDialog: true,
    ),
  );
}

void nextPagePush(BuildContext ctx, Widget pageTwo) {
  Navigator.push(
    ctx,
    CupertinoPageRoute(
      builder: (_) => pageTwo,
    ),
  );
}
