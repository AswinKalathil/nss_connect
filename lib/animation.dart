import 'dart:math';
import 'package:flutter/material.dart';

class PopupAnimationController extends ChangeNotifier {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  PopupAnimationController({required TickerProvider vsync}) {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: vsync,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Animation<double> get scaleAnimation => _scaleAnimation;

  Animation<double> get opacityAnimation => _opacityAnimation;

  void startAnimation() {
    _animationController.forward();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

abstract class ShakeAnimationController<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  ShakeAnimationController(this.animationDuration);

  final Duration animationDuration;
  late final animationController =
      AnimationController(vsync: this, duration: animationDuration);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.ShakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  }) : super(key: key);
  final Widget child;
  final double shakeOffset;
  final int ShakeCount;
  final Duration shakeDuration;

  @override
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends ShakeAnimationController<ShakeWidget> {
  ShakeWidgetState(Duration duration) : super(duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateanimationStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateanimationStatus);
    super.dispose();
  }

  void _updateanimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shakeWidget() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sineval =
            sin(widget.ShakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          offset: Offset(sineval * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
