import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/credCard.dart';
import 'package:nss_connect/regcard.dart';
import 'accountDataCards.dart';

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
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    List<Widget> cards = [
      credCard(),
      RegCard(),
      UserDataCard(),
      AccountDataCard()

      // Add more card widgets as needed
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            EventCarosel(
              width100: width100,
              height100: height100 * .8,
              cards: cards,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildCard1(BuildContext context, Function _changeCard) {
    return Container(
      padding: EdgeInsets.all(15),
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
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

class EventCarosel extends StatelessWidget {
  const EventCarosel({
    super.key,
    required this.cards,
    required this.width100,
    required this.height100,
  });
  final List<Widget> cards;
  final double width100;
  final double height100;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(0),
      width: width100,
      height: height100, //height  adjust
      child: CarouselSlider(
          options: CarouselOptions(
            height: height100,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {},
          ),
          items: cards),
    );
  }
}
