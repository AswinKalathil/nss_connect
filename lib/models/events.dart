import 'package:flutter/material.dart';

class eventItem {
  final String eventTitle;
  final String eventImagepath;
  final String eventDescription;

  const eventItem({
    required this.eventDescription,
    required this.eventImagepath,
    required this.eventTitle,
  });
}

List<eventItem> eventList = [
  eventItem(eventDescription: 'State Annual NSS Meet', eventImagepath: 'assets/images/1.png', eventTitle: 'Annual Meet'),
  eventItem(eventDescription: 'The upcycling event', eventImagepath: 'assets/images/2.png', eventTitle: 'Bhumi',),
  eventItem(eventDescription: 'First year orientation', eventImagepath: 'assets/images/3.png', eventTitle: 'Orientation',),
  eventItem(eventDescription: 'Blood Donation Camp', eventImagepath: 'assets/images/4.png', eventTitle: 'Dakshatha'),
];