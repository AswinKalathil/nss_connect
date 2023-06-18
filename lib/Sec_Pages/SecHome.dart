import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';
//
// class SecHome extends StatefulWidget{
//   static const String id = 'secretaryHome';
//
//   @override
//   State<SecHome> createState() => _SecHomeState();
//
// }
//
// class _SecHomeState extends State<SecHome>{
//   var currentIndex =0;
//   @override
//   Widget build(BuildContext context) {
//     double displaywidth = MediaQuery.of(context).size.width;
//     return Scaffold(
// bottomNavigationBar: Container(
//
//   margin: EdgeInsets.all(displaywidth * .05),
//   height: displaywidth * .155,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     boxShadow: [
//       BoxShadow(
//         color: Colors.black.withOpacity(.1),
//         blurRadius: 30,
//         offset: Offset(0,10),
//       )
//     ],
//     borderRadius: BorderRadius.circular(30)
//   ),
//   child: ListView.builder(
//     itemCount:4,
//     scrollDirection: Axis.horizontal,
//     padding: EdgeInsets.symmetric(horizontal: displaywidth * .02),
//
//      itemBuilder: (context, index)=>InkWell(
//        onTap:(){
//          setState(() {
//            currentIndex = index;
//            HapticFeedback.lightImpact();
//          },);
//
//        },
//        splashColor: Colors.transparent,
//        highlightColor: Colors.transparent,
//        child: Stack(
//          children: [
//            AnimatedContainer(duration: Duration(seconds: 1),
//            curve: Curves.fastLinearToSlowEaseIn,
//              width: index ==currentIndex ? displaywidth *.32:displaywidth * .18,
//             alignment: Alignment.center,
//              child: AnimatedContainer(
//                duration: Duration(seconds: 1),
//                curve: Curves.fastLinearToSlowEaseIn,
//                height: index == currentIndex ? displaywidth * .12:0,
//                width: index == currentIndex ? displaywidth * .32 : 0,
//                decoration: BoxDecoration(
//                  color: index==currentIndex ?primaryColor:Colors.transparent,
//                  borderRadius: BorderRadius.circular(30)
//                ),
//              ),
//            ),
//            AnimatedContainer(duration: Duration(seconds: 1),
//            curve: Curves.fastLinearToSlowEaseIn,
//            )
//          ],
//        ),
//      ),
//
//        ),
//
// ),
//     );
//   }
// }
//
// //
class SecHome extends StatefulWidget{
  const SecHome({super.key});
  static const String id = 'secretaryHome';
  @override
  State<SecHome> createState() => _SecHomeState();

}

class _SecHomeState extends State<SecHome>{
  @override
  int myCurrentIndex = 0;
  Widget build(BuildContext context) {
    double displaywidth = MediaQuery.of(context).size.width;
   return Scaffold(

     bottomNavigationBar:

     Container(
       margin: EdgeInsets.all(displaywidth * .10),
  height: displaywidth * .155,

       decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(100)
       ),
       child: BottomNavigationBar(
       selectedItemColor: primaryColor,
       unselectedItemColor: Colors.grey,
       currentIndex: myCurrentIndex,
       iconSize: 30,
       items: [
         BottomNavigationBarItem(
             icon: Icon(Icons.dashboard_outlined), label: 'Panel'),
         BottomNavigationBarItem(icon: Icon(Icons.domain_verification_outlined), label: 'Attendance'),

       ],
       elevation: 10,
       onTap: (selectedIndex) {
         setState(() {
           myCurrentIndex = selectedIndex;
         });
       },
   ),
     ),
   );
  }
}
