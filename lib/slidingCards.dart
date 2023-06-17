import 'package:flutter/material.dart';

class SlidingCards extends StatefulWidget {
  @override
  _SlidingCardsState createState() => _SlidingCardsState();
}

class _SlidingCardsState extends State<SlidingCards>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  int selectedCardIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeCard(int index) {
    setState(() {
      selectedCardIndex = index;
    });
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [
      // Replace with your card widgets
      _buildCard1(context, _changeCard),
      _buildCard2(context, _changeCard),
      _buildCard3(context, _changeCard),
      // Add more card widgets as needed
    ];

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * .5,
          child: Stack(
            children: [
              for (int i = 0; i < cards.length; i++)
                if (i == selectedCardIndex)
                  SlideTransition(
                    position: _slideAnimation,
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: cards[i],
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildCard1(BuildContext context, Function _changeCard) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: ElevatedButton(
        onPressed: () => _changeCard(0),
        child: Center(
          child: Text('Card 1'),
        ),
      ),
    );
  }

  static Widget _buildCard2(BuildContext context, Function _changeCard) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.amber,
      child: ElevatedButton(
        onPressed: () => _changeCard(1),
        child: Center(
          child: Text('Card 2'),
        ),
      ),
    );
  }

  static Widget _buildCard3(BuildContext context, Function _changeCard) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
      child: ElevatedButton(
        onPressed: () => _changeCard(2),
        child: Center(
          child: Text('Card 3'),
        ),
      ),
    );
  }
}