import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nss_connect/globals.dart';
import 'package:nss_connect/themes.dart';
import 'package:nss_connect/widgetStyles.dart';
import '../models/dataModels.dart';

class AttendenceSection extends StatefulWidget {
  @override
  _AttendenceSectionState createState() => _AttendenceSectionState();
}

class _AttendenceSectionState extends State<AttendenceSection> {
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 14));
  bool isDateselected = false;
  TextEditingController dateController = TextEditingController();
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

    if (picked == null) {
      setState(() {
        isDateselected = false;
      });
    }

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        isDateselected = true;
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
    ThemeData themeData = Theme.of(context);
    bool isDark = darkNotifier.value;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: isDark
            ? themeData.colorScheme.secondary
            : themeData.colorScheme.primary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 8, bottom: 8, right: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                // width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.only(left: 15),
                        // color: themeData.colorScheme.primary,
                        child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: ClipOval(
                              child: Container(
                                alignment: Alignment.center,
                                color: isDark
                                    ? themeData.colorScheme.primary
                                        .withOpacity(0.5)
                                    : themeData.colorScheme.secondary
                                        .withOpacity(0.5),
                                child: IconButton(
                                  icon: Icon(Icons.calendar_today_outlined),
                                  onPressed: () async {
                                    await _selectDate(context);
                                  },
                                ),
                              ),
                            ))),

                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      isDateselected
                          ? '${DateFormat('dd-MM-yyyy').format(selectedDate)}'
                          : 'Choose Date',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? ThemeClass().darkTextColor
                            : ThemeClass().lightTextColor,
                      ),
                    ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    // IconButton(
                    //   onPressed: () async {
                    //     await _selectDate(context);
                    //   },
                    //   icon: Icon(Icons.calendar_today),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  itemCount: VOLUserData.length,
                  itemBuilder: (BuildContext context, int index) {
                    User user = VOLUserData[index];
                    bool? isAttending = getAttendanceStatus(index);

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                        color: isDark? themeData.colorScheme.primary : themeData.colorScheme.secondary,
                        // border: Border.all(
                        //   color: isDark? themeData.colorScheme.primary : themeData.colorScheme.tertiary, // You can change the border color
                        //   width: 1.0, // You can change the border width
                        // ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  activeColor: isDark? themeData.colorScheme.primary : themeData.colorScheme.secondary,
                                  checkColor: themeData.colorScheme.onPrimary,
                                  value: isAttending,
                                  onChanged: (bool? value) {
                                    setAttendanceStatus(index, value);
                                  },
                                ),
                                Text(user.userName),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: isAttending == true
                                      ? isDark
                                          ? ThemeClass()
                                              .darkRightColor
                                              .withOpacity(0.3)
                                          : ThemeClass()
                                              .lightRightColor
                                              .withOpacity(0.2)
                                      : themeData.colorScheme.error
                                          .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(3)),
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.27,
                              child: Center(
                                child: Text(
                                  isAttending == true
                                      ? 'Attended'
                                      : 'Not Attended',
                                  style: TextStyle(
                                      color: isAttending == true
                                          ? isDark
                                              ? ThemeClass().darkRightColor
                                              : ThemeClass().lightRightColor
                                          : themeData.colorScheme.error),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16, right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: SmallButton(
                  buttonWidth: MediaQuery.of(context).size.width * 0.25,
                  buttonAction: () {
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
                  buttonText: 'Submit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
