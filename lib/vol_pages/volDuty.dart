import 'package:flutter/material.dart';
import 'package:nss_connect/colors.dart';

import '../models/dutymodel.dart';
import '../widgetStyles.dart';

class VolDuty extends StatefulWidget {
  const VolDuty({super.key});
  static const String id = 'certificaterequest';
  @override
  State<VolDuty> createState() => _VolDutyState();
}

class _VolDutyState extends State<VolDuty> {
  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return ListView(
      children: dutyList.map((dutyObject) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: width100 * .9,
              height: height100 * 0.18, //height adjust
              child: Card(
                elevation: 5,
                shape: CardShape(),
                child: Row(
                  children: [

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
                              '${dutyObject.dutyTitle}',
                              style: TextStyle(
                                  fontFamily: 'Source Code Pro',
                                  fontSize: width100 * 0.07,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${dutyObject.dutyDescription}',
                              style: TextStyle(
                                  fontFamily: 'Source Code Pro',
                                  fontWeight: FontWeight.w400,
                                  fontSize: width100 * 0.0375),
                            ),
                            Text(
                              '${dutyObject.dutyDate}',
                              style: TextStyle(
                                  fontFamily: 'Source Code Pro',
                                  fontWeight: FontWeight.w400,
                                  fontSize: width100 * 0.0375),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: () {

                            // Handle button press

                          },
                          child: Text('Submit'),
                        ),
                      ],
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
