import 'package:flutter/material.dart';

class UserDropDown extends StatefulWidget {
  final String? selectedOption;
  UserDropDown({this.selectedOption});

  @override
  State<UserDropDown> createState() => _UserDropDownState();
}

class _UserDropDownState extends State<UserDropDown> {
  String? selectedOption ;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue;
        });
      },
      items: [
        DropdownMenuItem<String>(
          value: 'Volunteer',
          child: Text('Volunteer'),
        ),
        DropdownMenuItem<String>(
          value: 'PO',
          child: Text('PO'),
        ),
        DropdownMenuItem<String>(
          value: 'Secretary',
          child: Text('Secretary'),
        ),
      ],
    );
  }
}
