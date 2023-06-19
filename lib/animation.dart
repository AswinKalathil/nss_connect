import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

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
