import 'package:flutter/material.dart';
import 'package:nss_connect/AddVolunteer.dart';
import 'package:nss_connect/pageTrasitions.dart';
import 'package:nss_connect/widgetStyles.dart';

import 'colors.dart';

class NewVol extends StatefulWidget {
  static const String id = 'poDashboard';

  @override
  State<NewVol> createState() => _NewVolState();
}

class _NewVolState extends State<NewVol> {
  int myCurrentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width;
    double height100 = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text('New Volunteer'),
        actions: [
          IconButton(
            onPressed: () {
              // nextPagePush(context,AddVolunteer());
              Navigator.pushNamed(context, AddVolunteer.id);
            },
            icon: Icon(Icons.person_add),
          )
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (myCurrentIndex) / 8,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue), // Update the value as needed
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(), // Disable page scrolling
              children: [
                AddNewBody(
                  height100: height100,
                  onNextPressed: () {
                    // _controller.nextPage(
                    //   duration: Duration(milliseconds: 300),
                    //   curve: Curves.easeInOut,
                    // );
                    setState(() {
                      myCurrentIndex++;
                    });
                  },
                ),
                AddNewBody(
                  height100: height100,
                  onNextPressed: () {
                    // _controller.nextPage(
                    //   duration: Duration(milliseconds: 300),
                    //   curve: Curves.easeInOut,
                    // );
                    setState(() {
                      // myCurrentIndex++;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddNewBody extends StatefulWidget {
  AddNewBody({
    Key? key,
    required this.height100,
    required this.onNextPressed,
  }) : super(key: key);

  final double height100;
  final VoidCallback onNextPressed;

  @override
  State<AddNewBody> createState() => _AddNewBodyState();
}

class _AddNewBodyState extends State<AddNewBody> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          TitledInputBox(
            title: "Name",
            placeholder: "Enter name",
            textEditingController: nameController,
            submitFunction: widget.onNextPressed,
          ),
          TitledInputBox(
            title: "NSS ID",
            placeholder: "Enter Id",
            textEditingController: nameController,
            submitFunction: widget.onNextPressed,
          ),
          // d
          PassInputBox(
              title: "Password",
              placeholder: "Enter new Password",
              textEditingController: passController,
              submitFunction: () {
                widget.onNextPressed();
              })
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Second Page"),
    );
  }
}
