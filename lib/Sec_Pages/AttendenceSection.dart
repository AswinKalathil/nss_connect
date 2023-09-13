import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nss_connect/globals.dart';
import 'package:nss_connect/themes.dart';
import '../models/dataModels.dart';

class AttendenceSection extends StatefulWidget {
  @override
  _AttendenceSectionState createState() => _AttendenceSectionState();
}

class _AttendenceSectionState extends State<AttendenceSection> {
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 14));
  Future<void> _selectDate(BuildContext context) async {
    final bool isDark = darkNotifier.value;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: selectedDate,
      lastDate: DateTime.now(),
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

  List<String> names = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'Robert Brown',
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'Robert Brown',
  ];
  List<bool> attendance = [];
  bool Attend = false;

  bool? getAttendanceStatus(int index) {
    return attendance[index];
  }

  void setAttendanceStatus(int index, bool? value) {
    setState(() {
      attendance[index] = value as bool;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the attendance list with false values
    attendance = List<bool>.generate(names.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Mark Attendance',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Text(
                'Date: ${DateFormat('dd-MM-yyyy').format(selectedDate)}',
                style: TextStyle(
                  color: isDark
                      ? ThemeClass().darkTextColor
                      : ThemeClass().lightTextColor,
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
        Expanded(
          child: ListView.builder(
            itemCount: VOLUserData.length,
            itemBuilder: (BuildContext context, int index) {
              User user = VOLUserData[index];
              bool? isAttending = getAttendanceStatus(index);

              return ListTile(
                title: Text(user.userName),
                trailing: Checkbox(
                  value: isAttending,
                  onChanged: (bool? value) {
                    setAttendanceStatus(index, value);
                  },
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // Process the attendance data
              List<String> presentStudents = [];
              for (int i = 0; i < names.length; i++) {
                if (attendance[i]) {
                  presentStudents.add(names[i]);
                }
              }
              // Print the list of students present
              print('Present Students: $presentStudents');
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }
}
