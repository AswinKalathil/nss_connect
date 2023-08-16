// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import '../colors.dart';

class SecCert extends StatefulWidget {
  const SecCert({super.key});
  static const String id = 'secretaryHome';
  @override
  State<SecCert> createState() => _SecCertState();
}

class _SecCertState extends State<SecCert> {
  @override
  int myCurrentIndex = 0;
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width * 0.9;
    double height100 = MediaQuery.of(context).size.height;
    PageController _controller = PageController();
    return Scaffold(
      body: secCertBody(
        controller: _controller,
        height100: height100,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
            horizontal: width100 * .10, vertical: width100 * .05),
        height: height100 * .08,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: myCurrentIndex,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/request2.png'),
                    size: 20,
                  ),
                  label: 'Requests'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/approve.png'),
                    size: 24,
                  ),
                  label: 'Approvals'),
            ],
            elevation: 10,
            onTap: (selectedIndex) {
              setState(() {
                myCurrentIndex = selectedIndex;
                _controller.animateToPage(selectedIndex,
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
              });
            },
          ),
        ),
      ),
    );
  }
}

class secCertBody extends StatelessWidget {
  const secCertBody({
    super.key,
    required this.height100,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  final double height100;
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: _controller,
      children: [
        // panelSection(
        //   height100: height100,
        // ),
        // AttendenceSection(),
        AdminPendingPage(),
        AdminApprovedPage(),
      ],
    );
  }
}

class Certificate {
  final String title;
  final String status;

  Certificate({required this.title, required this.status});
}

class AdminPendingPage extends StatelessWidget {
  final List<Certificate> pendingCertificates = [
    Certificate(title: 'Certificate 1', status: 'Pending'),
    Certificate(title: 'Certificate 2', status: 'Pending'),
    Certificate(title: 'Certificate 3', status: 'Pending'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pendingCertificates.length,
        itemBuilder: (context, index) {
          Certificate certificate = pendingCertificates[index];
          return ListTile(
            title: Text(certificate.title),
            subtitle: Text(certificate.status),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle view button press
                //   },
                //   child: Text('View'),
                // ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle verify button press
                  },
                  child: Text('Proceed'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AdminApprovedPage extends StatelessWidget {
  final List<Certificate> pendingCertificates = [
    Certificate(title: 'Certificate 1', status: 'Approved'),
    Certificate(title: 'Certificate 2', status: 'Approved'),
    Certificate(title: 'Certificate 3', status: 'Approved'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pendingCertificates.length,
        itemBuilder: (context, index) {
          Certificate certificate = pendingCertificates[index];
          return ListTile(
            title: Text(certificate.title),
            subtitle: Text(certificate.status),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle view button press
                  },
                  child: Text('View'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
