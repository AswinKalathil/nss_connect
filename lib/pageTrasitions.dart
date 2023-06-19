import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/pagerouteanimations.dart';

void nextPage(BuildContext ctx, Widget pageTwo) {
  Navigator.pushReplacement(
    ctx, PopUpRoute(child: pageTwo, direction: AxisDirection.up),
  );
}
void nextPagePush(BuildContext ctx, Widget pageTwo) {
  Navigator.push(
    ctx,PopUpRoute(child: pageTwo, direction: AxisDirection.up),
  );
}
