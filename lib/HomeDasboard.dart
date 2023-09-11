import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:nss_connect/sharedperfs.dart';
import 'package:nss_connect/widgetStyles.dart';
import 'package:nss_connect/models/events.dart';
import 'package:nss_connect/globals.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});
  static const String id = 'homeDashboard';
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    Brightness currentBrightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: height100 * .005, //height  adjust
          ),
          height: height100, //height  adjust
          width: width100,
          decoration: BoxDecoration(
            image: currentBrightness == Brightness.light
                ? DecorationImage(
                    image: AssetImage('assets/images/homeBackground.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomLeft,
                    opacity: 0.35,
                  )
                : DecorationImage(
                    image: AssetImage('assets/images/homeBackground_dark.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomLeft,
                    opacity: 0.15,
                  ), //
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EventCarosel(width100: width100, height100: height100),
              HeaderLogo(width100: width100, height100: height100),
              Expanded(child: Container()),
              ConnectButtonArea(height100: height100, width100: width100),
            ],
          ),
        ),
      ),
    );
  }
}

class ConnectButtonArea extends StatefulWidget {
  const ConnectButtonArea({
    super.key,
    required this.height100,
    required this.width100,
  });

  final double height100;
  final double width100;

  @override
  State<ConnectButtonArea> createState() => _ConnectButtonAreaState();
}

class _ConnectButtonAreaState extends State<ConnectButtonArea> {
  bool toggle = false;
  void _setIcon() {
    setState(() {
      toggle = !toggle;
    });
  }

  void setisDark() async {
    await ThemePreferenceHelper.setisDark();
  }

  void setisNotDark() async {
    await ThemePreferenceHelper.setisnotDark();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(bottom: widget.height100 * .02),
      padding: EdgeInsets.symmetric(
        vertical: widget.height100 * 0.03,
        horizontal: MediaQuery.of(context).size.width * 0.05, //height  adjust
      ),
      height: widget.height100 * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                isDark = !isDark;
                darkNotifier.value = isDark;
                if (darkNotifier.value) {
                  setisDark();
                } else {
                  setisNotDark();
                }
                _setIcon();
              },
              icon: !isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode)),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            opacity: 1.0,
            child: SmallButton(
                buttonText: 'Let\'s Connect ',
                buttonAction: () {
                  nextPagePushNamed(context, '/Login-page');
                },
                buttonWidth: MediaQuery.of(context).size.width * 0.32),
          ),
        ],
      ),
    );
  }
}

class EventCarosel extends StatelessWidget {
  const EventCarosel({
    super.key,
    required this.width100,
    required this.height100,
  });

  final double width100;
  final double height100;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.all(0),
      width: width100 * .9,
      height: height100 * 0.3125, //height  adjust
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          onPageChanged: (index, reason) {},
        ),
        items: eventList.map((eventObject) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: width100 * .9,
                child: Card(
                  color: themeData.colorScheme.secondary,
                  elevation: 5,
                  shape: CardShape(),
                  child: Row(
                    children: [
                      Container(
                        width: width100 * 0.3,
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(eventObject.eventImagepath),
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.secondary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          height: height100 * 0.25, //height  adjust
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${eventObject.eventTitle}',
                                style: TextStyle(
                                    fontFamily: 'Source Code Pro',
                                    fontSize: width100 * 0.07,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${eventObject.eventDescription}',
                                style: TextStyle(
                                    fontFamily: 'Source Code Pro',
                                    fontWeight: FontWeight.w400,
                                    fontSize: width100 * 0.0375),
                              ),
                              Text(
                                '${eventObject.eventDate}',
                                style: TextStyle(
                                    fontFamily: 'Source Code Pro',
                                    fontSize: width100 * 0.0375,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    super.key,
    required this.width100,
    required this.height100,
  });

  final double width100;
  final double height100;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width100 * .9,
      height: height100 * 0.15, //height  adjust
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              bottom: 10,
              left: 10,
            ),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  spreadRadius: -1,
                  blurRadius: 7,
                  offset: Offset(0, 7),
                )
              ]),
              child: GestureDetector(
                onTap: () => nextPagePushNamed(context, "/Secretary-Dashboard"),
                onDoubleTap: () => nextPagePushNamed(context, "/Po-Dashboard"),
                // onDoubleTap: () => nextPagePushNamed(context, "/Volunteer-Dashboard"),
                child: Image(
                  image: AssetImage('assets/images/nss.png'),
                  height: width100 * 0.16,
                  width: width100 * 0.16,
                ),
              ),
            ),
          ),
          Container(
            height: 120, //height  adjust
            padding: EdgeInsets.symmetric(
                vertical: width100 * 0.02, horizontal: width100 * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: width100 * 0.0375,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: 'WELCOME ',
                      ),
                      TextSpan(
                        text: 'TO',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width100 * .0711,
                    ),
                    children: [
                      TextSpan(
                        text: 'NSS ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'CONNECT',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
