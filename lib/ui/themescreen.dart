
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ThemeChangePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//         body: Container(
//           child: Card(
//             child: GridView.count(
//               crossAxisCount: 2,
//               crossAxisSpacing: 4,
//               mainAxisSpacing: 4,
//               children: List.generate(
//                   20,
//                   (i) => Container(
//                         decoration: BoxDecoration(
//                             color: Color.fromARGB(
//                                 0xff, 200, 250 - (i + 100), i * 10),
//                             borderRadius: BorderRadius.circularkborderRadiusCard),
//                         alignment: Alignment.center,
//                         child: Text(
//                           '$i',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 25),
//                         ),
//                       )),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
