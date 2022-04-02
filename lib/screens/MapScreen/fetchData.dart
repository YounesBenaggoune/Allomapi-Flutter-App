import 'dart:convert';
import "package:http/http.dart" as http;
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart' as latLng;

getObjects() async {
  final response = await http.post(
    Uri.parse('http://server.allomapi.com/app/objectsNv.php'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {'user': '2', 'managerId': '0', 'privilege': 'viewer'},
    ),
  );
  List list = json.decode(response.body);
  return list;
}

getLngLat() async {
  final response = await http.get(
    Uri.parse('http://192.168.1.17:3000/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  List list = json.decode(response.body).toList();

  return list;
}


// /*
// Future<List<Postion>> getAllObjects() async {
//     final response = await http.post(
//       Uri.parse('http://server.allomapi.com/app/objectsNv.php'),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//         {'user': '2', 'managerId': '0', 'privilege': 'viewer'},
//       ),
//     );
//     if (response.statusCode == 200) {
//       List list = json.decode(response.body);
//       setState(
//         () {
//           list.forEach(
//             (d) {
//               postions.add(
//                 Marker(
//                   width: 80.0,
//                   height: 80.0,
//                   point: latLng.LatLng(
//                     double.parse(d['lat']),
//                     double.parse(
//                       d['lng'],
//                     ),
//                   ),
//                   builder: (ctx) => GestureDetector(
//                     onTap: () => {
//                       showModalBottomSheet<void>(
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (BuildContext context) {
//                           return PopUp(d['name'], d['speed'], d['active']);
//                         },
//                       ),
//                     },
//                     child: Container(
//                       width: 70,
//                       height: 70,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: Colors.blue.withOpacity(0.3),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: Colors.blue.withOpacity(0.5),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.circle,
//                           size: 30,
//                           color: Color(0xff1c6dd0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       );

//       return list.map((data) => Postion.fromJson(data)).toList();
//     } else {
//       throw Exception('Unexpected error occured!');
//     }
//   }









//  */


// /*
//  // Fetch content from the json file
//   Future<void> readJson() async {
//     final String response =
//         await rootBundle.loadString('assets/json/path.json');
//     final data = await json.decode(response);
//     setState(() {
//       data.forEach((d) {
//         latlngList.add(latLng.LatLng(d['lat'], d['lng']));
//         // print(d['lng']);
//         // print(d['lat']);
//       });
//     });
//   }
//  */

// /*
// setState(
//         () => {
//           polyLinesData.forEach((d) {
//             polyLines.add(
//               Polyline(
//                 points: d['value'].forEach((obj) {
//                   points.add(latLng.LatLng(
//                     double.parse(obj['lat']),
//                     double.parse(
//                       obj['lng'],
//                     ),
//                   ));
//                 }),

//                 // isDotted: true,
//                 color: Colors.purple,
//                 strokeWidth: 4.0,
//                 borderColor: Colors.purple,
//                 borderStrokeWidth: 0.3,
//               ),
//             );
//           }),
//         },
//       );

//  */