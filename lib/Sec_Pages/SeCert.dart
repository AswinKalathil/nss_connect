import 'package:flutter/material.dart';
import 'package:nss_connect/themes.dart';

class SecCert extends StatefulWidget {
  const SecCert({super.key});
  static const String id = 'secretaryHome';
  @override
  State<SecCert> createState() => _SecCertState();
}

int myCurrentIndex = 0;

class _SecCertState extends State<SecCert> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double width100 = MediaQuery.of(context).size.width * 0.9;
    double height100 = MediaQuery.of(context).size.height;
    PageController _controller = PageController();
    return Scaffold(
      backgroundColor: themeData.colorScheme.secondary,
      body: secCertBody(
        controller: _controller,
        height100: height100,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width100 * .10, vertical: width100 * .05),
        height: height100 * .08,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            selectedItemColor: themeData.colorScheme.onPrimary.withOpacity(1),
            unselectedItemColor:
                themeData.colorScheme.onPrimary.withOpacity(0.3),
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
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.secondary,
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
                SizedBox(width: 10.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        themeData.colorScheme.tertiary),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Proceed',
                    style: TextStyle(color: ThemeClass().darkTextColor),
                  ),
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
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.secondary,
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        themeData.colorScheme.tertiary),
                  ),
                  onPressed: () {},
                  child: Text(
                    'View',
                    style: TextStyle(color: ThemeClass().darkTextColor),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
