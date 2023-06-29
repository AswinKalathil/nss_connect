import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:nss_connect/pagerouteanimations.dart';

void nextPage(BuildContext ctx, Widget pageTwo) {
  Navigator.pushReplacement(
    ctx,
    CupertinoPageRoute(
      builder: (_) => pageTwo,
    ),
  );
}

void nextPagePush(BuildContext ctx, Widget pageTwo) {
  Navigator.push(
    ctx,
    CupertinoPageRoute(
      builder: (_) => pageTwo,
      fullscreenDialog: true,
      ),
  );
}
