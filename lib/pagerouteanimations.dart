import 'package:flutter/material.dart';

class PopUpRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  PopUpRoute({
    required this.child,
    this.direction = AxisDirection.up,
  }) : super(
            transitionDuration: Duration(seconds: 3),
            reverseTransitionDuration: Duration(seconds: 3),
            pageBuilder: (context, animation, secondaryAnimation) => child,
);

  Widget PopUpTransition(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOffset(),
          end: Offset.zero,
          ).animate(animation),
        child: child,
      );

      getBeginOffset(){
        switch(direction){
          case AxisDirection.up:
            return Offset(0, 1);
          case AxisDirection.down:
            return Offset(0, -1);
          case AxisDirection.left:
            return Offset(1, 0);
          case AxisDirection.right:
            return Offset(-1, 0);
        }
      }
}
