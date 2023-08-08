import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';
import 'package:nss_connect/models/events.dart';

import '../widgetStyles.dart';
import 'EventApp.dart';

class SecEvent extends StatelessWidget {
  const SecEvent({super.key});

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: secEventBody(
        height100: height100,
        width100: width100,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          Navigator.pushNamed(context, EventApp.id);
        },
        child: Icon(Icons.add),
        backgroundColor: primaryButton, // Customize FAB color
      ),
    );
  }
}

class secEventBody extends StatelessWidget {
  const secEventBody({
    super.key,
    required this.width100,
    required this.height100,
  });
  final double width100;
  final double height100;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: eventList.map((eventObject) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: width100 * .9,
              height: height100 * 0.2, //height adjust
              child: Card(
                elevation: 5,
                shape: CardShape(),
                child: Row(
                  children: [
                    Container(
                      width: width100 * 0.3,
                      decoration: BoxDecoration(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                        ),
                        height: height100 *
                            0.25, //========================height  adjest
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
    );
  }
}
