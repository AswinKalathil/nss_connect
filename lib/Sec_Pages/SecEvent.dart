import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';
import 'package:nss_connect/globals.dart';
import 'package:nss_connect/models/events.dart';
import 'package:nss_connect/themes.dart';

import '../widgetStyles.dart';
import 'EventCreate.dart';

class SecEvent extends StatefulWidget {
  const SecEvent({super.key});

  @override
  State<SecEvent> createState() => _SecEventState();
}

class _SecEventState extends State<SecEvent> {
  void addNewEvent(BuildContext ctx) async {
    var result = await showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: EventScreen(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );

    if (result == 'refresh') {
      // Handle refresh action here
      // For example, you can setState to trigger a rebuild
      setState(() {
        // Perform refresh action
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    ThemeData themeData = Theme.of(context);
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
          // Navigator.pushNamed(context, EventApp.id);
          addNewEvent(context);
        },
        child: Icon(Icons.add,color: ThemeClass().darkTextColor),
        backgroundColor: themeData.colorScheme.tertiary,
         // Customize FAB color
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
    bool isDark = darkNotifier.value;
    ThemeData themeData = Theme.of(context);
    eventList.sort((a, b) => a.eventDate.compareTo(b.eventDate));
    return ListView(
      children: eventList.map((eventObject) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: width100 * .9,
              height: height100 * 0.2,
              color: themeData.colorScheme.primary, //height adjust
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
                          color: themeData.colorScheme.secondary,
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
                                  color: isDark
                                      ? ThemeClass().darkTextColor
                                      : ThemeClass().lightTextColor,
                                  fontFamily: 'Source Code Pro',
                                  fontSize: width100 * 0.07,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${eventObject.eventDescription}',
                              style: TextStyle(
                                  color: isDark
                                      ? ThemeClass().darkTextColor
                                      : ThemeClass().lightTextColor,
                                  fontFamily: 'Source Code Pro',
                                  fontWeight: FontWeight.w400,
                                  fontSize: width100 * 0.0375),
                            ),
                            Text(
                              '${eventObject.eventDate}',
                              style: TextStyle(
                                  color: isDark
                                      ? ThemeClass().darkTextColor
                                      : ThemeClass().lightTextColor,
                                  fontFamily: 'Source Code Pro',
                                  fontWeight: FontWeight.w400,
                                  fontSize: width100 * 0.0375),
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
    );
  }
}
