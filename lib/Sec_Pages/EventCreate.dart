import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nss_connect/colors.dart';
import 'package:nss_connect/models/events.dart';
import 'package:nss_connect/globals.dart';
import 'package:nss_connect/themes.dart';
import 'package:nss_connect/widgetStyles.dart';

class EventCreate extends StatelessWidget {
  const EventCreate({super.key});
  static const String id = 'EventCreate';
  @override
  Widget build(BuildContext context) {
    // double height100 = MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).padding.top -
    //     MediaQuery.of(context).padding.bottom;

    return MaterialApp(
      title: 'Event Creation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        buttonTheme:
            ThemeData().buttonTheme.copyWith(buttonColor: primaryButton),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Theme.of(context).primaryColor,
              secondary: secondaryColor,
            ),
      ),
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatefulWidget {
  final String? selectedOption;
  EventScreen({
    this.selectedOption,
  });

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
    int index = 0;
    // For now, let's print the event details
    print('Event Name: $eventName');
    print('Description: $eventDescription');
    print('Type: $selectedOption');
    print('Participants: $participants');
    print('Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}');
    print('Time: ${selectedTime.format(context)}');
    print('Duration: ${eventDuration.inHours} hours');

    index = participants % 3;

    eventList.add(eventItem(
      eventDate: DateFormat('yyyy-MM-dd').format(
          selectedDate), // Set your desired date here (year, month, day)
      eventDescription: eventDescription,
      eventImagepath: Def_pics[index],
      eventTitle: eventName,
    ));

    Navigator.pop(context, "refresh");
  }

  Future<void> _selectDate(BuildContext context) async {
    bool isDark = darkNotifier.value;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
                primary: isDark
                    ? ThemeClass().darkAccentColor
                    : ThemeClass().lightAccentColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    bool isDark = darkNotifier.value;
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
                primary: isDark
                    ? ThemeClass().darkAccentColor
                    : ThemeClass().lightAccentColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.tertiary,
        foregroundColor: ThemeClass().darkTextColor,
        title: Text(
          'Event Creation',
          style: TextStyle(
            color: ThemeClass().darkTextColor,
          ),
        ),
      ),
      body: Container(
        color: themeData.colorScheme.secondary,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                cursorColor: themeData.colorScheme.onPrimary,
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  labelStyle: TextStyle(
                    color: themeData.colorScheme.onPrimary,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: themeData.colorScheme.onPrimary,
                    ), // Change to your desired color
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    eventName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                cursorColor: themeData.colorScheme.onPrimary,
                decoration: InputDecoration(
                  labelText: 'Event Description',
                  labelStyle: TextStyle(
                    color: themeData.colorScheme.onPrimary,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: themeData.colorScheme.onPrimary,
                    ), // Change to your desired color
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    eventDescription = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: widget.selectedOption,
                dropdownColor: themeData.colorScheme.primary,
                decoration: InputDecoration(
                    labelText: 'Event Type',
                    labelStyle: TextStyle(
                      color: themeData.colorScheme.onPrimary,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: themeData.colorScheme.onPrimary))),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                style: TextStyle(color: themeData.colorScheme.onPrimary),
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
              ),
              SizedBox(height: 16.0),
              TextField(
                cursorColor: themeData.colorScheme.onPrimary,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Number of Participants',
                    labelStyle: TextStyle(
                      color: themeData.colorScheme.onPrimary,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: themeData.colorScheme.onPrimary))),
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
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                          style: TextStyle(
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                          onPressed: () async {
                            await _selectDate(context);
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Time: ${selectedTime.format(context)}',
                          style: TextStyle(
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                          onPressed: () async {
                            await _selectTime(context);
                          },
                          icon: Icon(Icons.access_time_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: themeData.colorScheme.onPrimary,
                      decoration: InputDecoration(
                          labelText: 'Event Duration (hours)',
                          labelStyle: TextStyle(
                            color: themeData.colorScheme.onPrimary,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: themeData.colorScheme.onPrimary))),
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
                    child: SmallButton(
                      buttonText: 'Create',
                      buttonAction: () {
                        addEvent();
                      },
                      buttonWidth: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
