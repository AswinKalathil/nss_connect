import 'package:intl/intl.dart';

class eventItem {
  final String eventTitle;
  final String eventImagepath;
  final String eventDescription;
  late DateTime eventDate;

  eventItem({
    required this.eventDescription,
    required this.eventImagepath,
    required this.eventTitle,
    required this.eventDate,
  });
}

List<eventItem> eventList = [
  eventItem(
    eventDate:
        DateTime(2023, 8, 15), // Set your desired date here (year, month, day)
    eventDescription: 'State Annual NSS Meet',
    eventImagepath: 'assets/images/1.png',
    eventTitle: 'Annual Meet',
  ),
  eventItem(
    eventDate:
        DateTime(2023, 9, 20), // Set your desired date here (year, month, day)
    eventDescription: 'The upcycling event',
    eventImagepath: 'assets/images/2.png',
    eventTitle: 'Bhumi',
  ),
  eventItem(
    eventDate:
        DateTime(2023, 10, 5), // Set your desired date here (year, month, day)
    eventDescription: 'First year orientation',
    eventImagepath: 'assets/images/3.png',
    eventTitle: 'Orientation',
  ),
  eventItem(
    eventDate:
        DateTime(2023, 11, 12), // Set your desired date here (year, month, day)
    eventDescription: 'Blood Donation Camp',
    eventImagepath: 'assets/images/4.png',
    eventTitle: 'Dakshatha',
  ),
];
