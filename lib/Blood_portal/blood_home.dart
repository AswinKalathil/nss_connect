import 'package:flutter/material.dart';
import 'package:nss_connect/Blood_portal/request.dart';
import 'package:nss_connect/colors.dart';
import '../pageTrasitions.dart';

class blood_home extends StatelessWidget {
  const blood_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text('Blood Portal'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width*0.75, // Set width to screen width
            child: Card(
              elevation: 4, // Adjust the elevation
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Adjust the border radius
              ),
              color: Color(0xFFBDE0FE),
              // child: GestureDetector(
              //   onTap: () => nextPagePush(context, request()),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 200,
                  child: Text(
                    'New Request',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: MediaQuery.of(context).size.width*0.75, // Set width to screen width
            child:
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xFFBDE0FE),
              child: InkWell(
                onTap: () {
                  // Action for Card 2
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 200,
                  child: Text(
                    'New Donor',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            ),
            SizedBox(height: 20),

            SizedBox(
                width: MediaQuery.of(context).size.width*0.75, // Set width to screen width
            child:
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xFFBDE0FE),
              child: InkWell(
                onTap: () {
                  // Action for Card 3
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 200,
                  child: Text(
                    'Update Donor',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
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
