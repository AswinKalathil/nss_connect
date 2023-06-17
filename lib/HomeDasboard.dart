import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:nss_connect/colors.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/login.dart';
import 'package:nss_connect/pageTrasitions.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});
  static const String id = 'homeDashboard';
  @override
  Widget build(BuildContext context) {
    double width80 = MediaQuery.of(context).size.width * 0.8;
    double width25 = MediaQuery.of(context).size.width * 0.25;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom),
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homeBackground.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
              opacity: 0.3,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  elevation: 5,
                  // child: Row(
                  //   children: [Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     child: CarouselSlider(
                  //       options: CarouselOptions(
                  //         // height: MediaQuery.of(context).size.height * 0.25,
                  //         viewportFraction: 1,
                  //         autoPlay: true,
                  //         autoPlayInterval: Duration(seconds: 5),
                  //         autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //         autoPlayCurve: Curves.fastOutSlowIn,
                  //         pauseAutoPlayOnTouch: true,
                  //         aspectRatio: 2.0,
                  //         onPageChanged: (index, reason) {
                  //           // setState(() {
                  //           //   _current = index;
                  //           // });
                  //         },
                  //       ),
                  //       items: [1, 2, 3, 4, 5].map((i) {
                  //         return Builder(
                  //           builder: (BuildContext context) {
                  //             return Container(
                  //               width: MediaQuery.of(context).size.width,
                  //               margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //               decoration: BoxDecoration(
                  //                 color: Colors.amber,
                  //               ),
                  //               child: Text(
                  //                 'text $i',
                  //                 style: TextStyle(fontSize: 16.0),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }).toList(),
                  //     ),
                  //   )]
                  // ),
                  // child: CarouselSlider.builder(
                  //   itemCount: itemCount,
                  //   itemBuilder: itemBuilder,
                  //   options: options),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WELCOME TO',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: width80 * .09,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            'NSS',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: width80 * .09,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image(
                        image: AssetImage('assets/images/nss.png'),
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.21,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03),
                height: MediaQuery.of(context).size.height * 0.15,
                child: Text.rich(
                  TextSpan(
                    text: 'Are you a member?',
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => nextPagePush(context, Login()),
                        style: TextStyle(
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' here',
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontFamily: 'Ysabeau',
                    shadows: [
                      Shadow(
                        blurRadius: 13.0,
                        color: Color.fromARGB(255, 120, 121, 109),
                        offset: Offset(3.0, 8.0),
                      ),
                    ],
                    fontSize: width25 * .17,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
