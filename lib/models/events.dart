import 'package:intl/intl.dart';

class eventItem {
  final String eventTitle;
  final String eventImagepath;
  final String eventDescription;
  final String eventDate;

  eventItem({
    required this.eventDescription,
    required this.eventImagepath,
    required this.eventTitle,
    required this.eventDate,
  });
}

List<eventItem> eventList = [
  eventItem(
    eventDate: DateFormat('yyyy-MM-dd').format(DateTime(2023, 8, 15)),
    eventDescription: 'State Annual NSS Meet',
    eventImagepath: 'assets/images/1.png',
    eventTitle: 'Annual Meet',
  ),
  eventItem(
    eventDate: DateFormat('yyyy-MM-dd').format(DateTime(2023, 9, 20)),
    eventDescription: 'The upcycling event',
    eventImagepath: 'assets/images/2.png',
    eventTitle: 'Bhumi',
  ),
  eventItem(
    eventDate: DateFormat('yyyy-MM-dd').format(DateTime(2023, 10, 5)),
    eventDescription: 'First year orientation',
    eventImagepath: 'assets/images/3.png',
    eventTitle: 'Orientation',
  ),
  eventItem(
    eventDate: DateFormat('yyyy-MM-dd').format(DateTime(2023, 11, 12)),
    eventDescription: 'Blood Donation Camp',
    eventImagepath: 'assets/images/4.png',
    eventTitle: 'Dakshatha',
  ),
];
