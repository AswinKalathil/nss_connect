import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:nss_connect/colors.dart';
import 'package:flutter/material.dart';
import 'package:nss_connect/login.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:nss_connect/widgetStyles.dart';
import 'package:nss_connect/models/events.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});
  static const String id = 'homeDashboard';
  @override
  Widget build(BuildContext context) {
    double width90 = MediaQuery.of(context).size.width * 0.9;
    double width25 = MediaQuery.of(context).size.width * 0.25;
    double height25 = MediaQuery.of(context).size.height * 0.25;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top *
                0.2, //========================height  adjest
            // bottom: MediaQuery.of(context).padding.bottom,
          ),
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context)
                  .padding
                  .bottom, //========================height  adjest
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/homeBackground.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
              opacity: 0.3,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:
                    height25 * 1.25, //========================height  adjest
                width: width90,
                child: Row(children: [
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.all(0),
                    width: width90,
                    height: height25 *
                        1.25, //========================height  adjest
                    child: CarouselSlider(
                      options: CarouselOptions(
                        // height: MediaQuery.of(context).size.height * 0.25,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        // aspectRatio: 2.07,
                        onPageChanged: (index, reason) {
                          // setState(() {
                          //   _current = index;
                          // });
                        },
                      ),
                      items: eventList.map((eventObject) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: width90,
                              // margin: EdgeInsets.symmetric(horizontal: 4),

                              child: Card(
                                elevation: 5,
                                shape: CardShape(),
                                child: Row(
                                  children: [
                                    Container(
                                      // child: Image.asset(
                                      //   'assets/images/1.png'
                                      // ),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              eventObject.eventImagepath),
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
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                        ),
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.25, //========================height  adjest
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${eventObject.eventTitle}',
                                              style: TextStyle(
                                                  fontFamily: 'Source Code Pro',
                                                  fontSize: width25 * .28,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '${eventObject.eventDescription}',
                                              style: TextStyle(
                                                  fontFamily: 'Source Code Pro',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: width25 * .15),
                                            )
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
                  )
                ]),
                // child: CarouselSlider.builder(
                //   itemCount: itemCount,
                //   itemBuilder: itemBuilder,
                //   options: options),
              ),
              Container(
                width: width90,
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.15, //========================height  adjest
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
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            spreadRadius: -1,
                            blurRadius: 7,
                            offset: Offset(0, 7),
                          )
                        ]),
                        child: Image(
                          image: AssetImage('assets/images/nss.png'),
                          height: MediaQuery.of(context).size.width * 0.16,
                          width: MediaQuery.of(context).size.width * 0.16,
                        ),
                      ),
                    ),
                    Container(
                      height: 120, //========================height  adjest
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.02,
                          horizontal: MediaQuery.of(context).size.width *
                              0.02), //========================height  adjest
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  fontFamily: 'Nexa',
                                  fontSize: width25 * .15,
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
                                fontSize: width90 * .079,
                                color: const Color.fromARGB(255, 0, 0, 0),
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.25, //========================height  adjest
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                  horizontal: MediaQuery.of(context).size.width *
                      0.05, //========================height  adjest
                ),
                height: MediaQuery.of(context).size.height * 0.175,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  opacity: 1.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.012,
                          horizontal: MediaQuery.of(context).size.width *
                              0.05), //========================height  adjest
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      nextPagePush(context, Login());
                    },
                    child: Text(
                      'Let\'s Connect ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: width25 * .15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // child: Text.rich(
                //   TextSpan(
                //     text: 'Are you a member? ',
                //     children: <TextSpan>[
                //       TextSpan(
                //         text: 'Login',
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () => nextPagePush(context, Login()),
                //         style: TextStyle(
                //           fontFamily: 'Nexa',
                //           fontWeight: FontWeight.bold,
                //           decoration: TextDecoration.underline,
                //           color: secondaryColor,
                //         ),
                //       ),
                //       TextSpan(
                //         text: ' here',
                //       ),
                //     ],
                //   ),
                //   style: TextStyle(
                //     fontFamily: 'Ysabeau',
                //     shadows: [
                //       Shadow(
                //         blurRadius: 13.0,
                //         color: Color.fromARGB(255, 120, 121, 109),
                //         offset: Offset(3.0, 8.0),
                //       ),
                //     ],
                //     fontSize: width25 * .17,
                //     color: primaryColor,
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
