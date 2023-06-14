import 'package:flutter/material.dart';
import 'package:nss_connect/login.dart';
import 'package:nss_connect/pageTrasitions.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});
  static const String id = 'homeDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homeBackground.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomLeft,
            opacity: 0.35,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.15, horizontal: MediaQuery.of(context).size.width * 0.10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('WELCOME TO', style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),),
                      Text('NSS', style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),),
                    ],
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/nss.png'),
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                onPressed: ()=>nextPagePush(context,Login()),
                child: Text('LOGIN', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),),),
            ),
          ],
          
        ),
        )),
    );
  }
}

         

        