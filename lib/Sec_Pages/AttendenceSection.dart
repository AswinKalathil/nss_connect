import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nss_connect/widgetStyles.dart';
import '../colors.dart';

class AttendenceSection extends StatefulWidget {
  @override
  _AttendenceSectionState createState() => _AttendenceSectionState();
}

class _AttendenceSectionState extends State<AttendenceSection> {
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 14));
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: selectedDate,
      lastDate: DateTime.now(),
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

  @override
  void initState() {
    super.initState();
    // Initialize the attendance list with false values
    attendance = List<bool>.generate(names.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
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
        TextButton(
          onPressed: () => _selectDate(context),
          child: Text(
            'Select Date: ${DateFormat('dd-MM-yyyy').format(selectedDate)}',
          ),
        ),
        // Container(
        //   alignment: AlignmentDirectional.topStart,
        //   padding: EdgeInsets.only(bottom: 10, left: 30),
        //   child: Text(
        //     'Date',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: Colors.grey.shade600,
        //     ),
        //   ),
        // ),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(5)),
        //     border: Border.all(
        //       color: Colors.grey
        //           .withOpacity(0.3), // Change the border color here
        //     ),
        //   ),
        //   width: MediaQuery.of(context).size.width * 0.8,
        //   child: TextField(
        //     style: TextStyle(),
        //     cursorColor: Colors.black,
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide.none,
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //       contentPadding: EdgeInsets.only(left: 10),
        //       hintText: 'Enter Date',
        //       hintStyle: TextStyle(
        //         color: Colors.black.withOpacity(0.4),
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(names[index]),
                trailing: Checkbox(
                  value: attendance[index],
                  onChanged: (value) {
                    setState(() {
                      attendance[index] = value!;
                    });
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
