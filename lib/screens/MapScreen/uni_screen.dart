// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:universe/universe.dart';
// import './fetchData.dart';
// import "package:http/http.dart" as http;

// class MapBox extends StatefulWidget {
//   const MapBox({Key? key}) : super(key: key);

//   @override
//   _MapBoxState createState() => _MapBoxState();
// }

// class _MapBoxState extends State<MapBox> {
//   MapBoxType type = MapBoxType.Street;

//   Scale get _scale {
//     if (type == MapBoxType.Satellite ||
//         type == MapBoxType.Hybrid ||
//         type == MapBoxType.Dark) {
//       return Scale(color: Colors.white);
//     }
//     return Scale();
//   }

//   List polyLines = [
//     [
//       [52.552339, -1.96942],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.553306, -1.971937],
//       [52.554608, -1.973993]
//     ],
//     [
//       [52.312294, 10.800906],
//       [52.312022, 10.803991],
//       [52.312022, 10.803991],
//       [52.312022, 10.803991],
//       [52.312022, 10.803991],
//       [52.312022, 10.803991],
//       [52.311782, 10.807082],
//       [52.312022, 10.803991],
//       [52.312022, 10.803991],
//       [52.311782, 10.807082],
//       [52.311523, 10.810166]
//     ],
//     [
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886],
//       [54.217581, 24.559886]
//     ]
//   ];

//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(const Duration(seconds: 5), (timer) async {
//       getLngLat();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: getLngLat(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return U.MapBox(
//               // get your own access token from https://account.mapbox.com/access-tokens/
//               accessToken:
//                   'pk.eyJ1IjoieXVudXNldm90bCIsImEiOiJja3kxbjI1NWkwODd0MnNueTV4YXkxZzB0In0.d5s4WA8gSlJatnlhiid5hw',
//               center: [52.552339, -1.96942],
//               type: type,
//               zoom: 10,
//               scale: _scale,
//               controls: [
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 90, bottom: 29),
//                   ),
//                 )
//               ],

//               polylines: U.PolylineLayer(
//                 polyLines,
//                 strokeColor: Colors.pink,
//                 strokeOpacity: 0.8,
//                 isDotted: false,
//               ),
//             );
//           } else {
//             return Text('000000');
//           }
//         },
//       ),
//     );
//   }

//   Future<List> getLngLat() async {
//     final response = await http.get(
//       Uri.parse('http://192.168.1.17:3000/'),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );

//     List list = json.decode(response.body).toList();
//     polyLines = list;

//     return list;
//   }
// }
// /*
// return U.MapBox(
//             // get your own access token from https://account.mapbox.com/access-tokens/
//             accessToken:
//                 'pk.eyJ1IjoieXVudXNldm90bCIsImEiOiJja3kxbjI1NWkwODd0MnNueTV4YXkxZzB0In0.d5s4WA8gSlJatnlhiid5hw',
//             center: [53.728301, -1.475235],
//             type: type,
//             zoom: 15,
//             scale: _scale,
//             controls: [
//               Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 90, bottom: 29),
//                 ),
//               )
//             ],

//             polylines: U.PolylineLayer(points),
//           );













//  */