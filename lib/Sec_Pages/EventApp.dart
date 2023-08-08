import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nss_connect/colors.dart';
import 'package:nss_connect/widgetStyles.dart';
import 'package:nss_connect/models/events.dart';

class EventApp extends StatelessWidget {
  const EventApp({super.key});
  static const String id = 'EventApp';
  @override
  Widget build(BuildContext context) {
    double height100 = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return MaterialApp(
      title: 'Event Creation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        buttonTheme:
            ThemeData().buttonTheme.copyWith(buttonColor: primaryButton),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
            ),
      ),
      home: EventScreen(
        height100: height100,
        onNextPressed: () {
          // _controller.nextPage(
          //   duration: Duration(milliseconds: 300),
          //   curve: Curves.easeInOut,
          // );
        },
      ),
    );
  }
}

class EventScreen extends StatefulWidget {
  final String? selectedOption;
  EventScreen(
      {this.selectedOption,
      required this.height100,
      required this.onNextPressed});
  final double height100;
  final VoidCallback onNextPressed;

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  String eventName = '';
  String eventDescription = '';
  String? selectedOption = '';
  int participants = 0;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Duration eventDuration = Duration(hours: 1);

  void addEvent() {
    // Implement your logic to add the event
    // For now, let's print the event details
    print('Event Name: $eventName');
    print('Description: $eventDescription');
    print('Type: $selectedOption');
    print('Participants: $participants');
    print('Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}');
    print('Time: ${selectedTime.format(context)}');
    print('Duration: ${eventDuration.inHours} hours');

    eventList.add(eventItem(
      eventDate: DateFormat('yyyy-MM-dd').format(
          selectedDate), // Set your desired date here (year, month, day)
      eventDescription: 'State Annual NSS Meet',
      eventImagepath: 'assets/images/1.png',
      eventTitle: 'Annual Meet',
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var selectedOption;
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Creation'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Event Name'),
              onChanged: (value) {
                setState(() {
                  eventName = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Event Description'),
              onChanged: (value) {
                setState(() {
                  eventDescription = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: widget.selectedOption,
              decoration: InputDecoration(labelText: 'Event Type'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'Community',
                  child: Text('Community'),
                ),
                DropdownMenuItem<String>(
                  value: 'College',
                  child: Text('College'),
                ),
                DropdownMenuItem<String>(
                  value: 'General Orientation',
                  child: Text('General Orientation'),
                ),
                DropdownMenuItem<String>(
                  value: 'Flagship ',
                  child: Text('Flagship'),
                ),
              ],
              // items: <String>['Conference', 'Workshop', 'Seminar', 'Party']
              //     .map<DropdownMenuItem<String>>(
              //       (String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   },
              // ).toList(),
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of Participants'),
              onChanged: (value) {
                setState(() {
                  participants = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      'Select Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                      'Select Time: ${selectedTime.format(context)}',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: 'Event Duration (hours)'),
                    onChanged: (value) {
                      setState(() {
                        eventDuration =
                            Duration(hours: int.tryParse(value) ?? 0);
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      addEvent();
                    },
                    child: Text('Create Event'),
                    // backgroundColor: primaryButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
