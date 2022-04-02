import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: library_prefixes
import 'package:latlong2/latlong.dart' as latLng;
//-----------------------------//
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import '../../widgets/app_bar.dart';
import './fetchData.dart';

// // name
// // speed
// // lat
// // lng
// // active

const satellite =
    'https://api.mapbox.com/styles/v1/yunusevotl/cl06gu9b4000b16r2wx6ujyze/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieXVudXNldm90bCIsImEiOiJja3kxbjI1NWkwODd0MnNueTV4YXkxZzB0In0.d5s4WA8gSlJatnlhiid5hw';
const basic =
    'https://api.mapbox.com/styles/v1/yunusevotl/ckzbasxdu002b14nougtamnpv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieXVudXNldm90bCIsImEiOiJja3kxbjI1NWkwODd0MnNueTV4YXkxZzB0In0.d5s4WA8gSlJatnlhiid5hw';

class Postion {
  final String name;
  final String speed;
  final String lat;
  final String lng;
  final String active;

  Postion(
      {required this.name,
      required this.speed,
      required this.lat,
      required this.lng,
      required this.active});

  factory Postion.fromJson(Map<String, dynamic> json) {
    return Postion(
      name: json['name'],
      speed: json['speed'],
      lat: json['lat'],
      lng: json['lng'],
      active: json['active'],
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var mapMode = basic;

  late Future<List<Postion>> postionsList;

  final List<Marker> postions = [];
  List<Polyline> polyLines = [];
  final List<latLng.LatLng> points = [];

  // ignore: prefer_typing_uninitialized_variables
  var objectsData;

  void drawLine() async {
    polyLines = await getLngLat();
  }

  void getData() async {
    objectsData = await getObjects();

    if (objectsData != null) {
      if (!mounted) return;
      setState(
        () {
          objectsData.forEach(
            (d) {
              postions.add(
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: latLng.LatLng(
                    double.parse(d['lat']),
                    double.parse(
                      d['lng'],
                    ),
                  ),
                  builder: (ctx) => GestureDetector(
                    onTap: () => {
                      showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return PopUp(d['name'], d['speed'], d['active']);
                        },
                      ),
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.circle,
                          size: 30,
                          color: Color(0xff1c6dd0),
                        ),
                      ),
                    ),
                  ),
                ),
              );
              // postions.removeLast();
              Timer(const Duration(seconds: 4), () => postions.removeLast());
            },
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    drawLine();
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      drawLine();
      getData();
      // print(polyLines);
    });
  }

  @override
  void dispose() {
    super.dispose();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  center: latLng.LatLng(53.725696, -2.670633),
                  zoom: 6,
                ),
                layers: [
                  TileLayerOptions(
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoieXVudXNldm90bCIsImEiOiJja3kxbjI1NWkwODd0MnNueTV4YXkxZzB0In0.d5s4WA8gSlJatnlhiid5hw'
                    },
                    urlTemplate: mapMode,
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return const Text("© OpenStreetMap contributors");
                    },
                  ),
                  PolylineLayerOptions(
                    polylineCulling: true,
                    polylines: polyLines,
                  ),
                  MarkerLayerOptions(
                    markers: postions,
                  ),
                ],
              ),
              SizedBox(
                height: AppBar().preferredSize.height * 0.3,
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Colors.transparent,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff1c6dd0),
                        Color(0xff1c6dd0),
                        // Colors.deepPurpleAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(45),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                right: 12,
                child: Container(
                    height: 105,
                    width: 50,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mapMode = basic;
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.white,
                            ),
                            child:
                                const Icon(Icons.satellite_outlined, size: 28),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mapMode = satellite;
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.router_outlined, size: 28),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopUp extends StatelessWidget {
  final String name;
  final String speed;
  final String status;
  const PopUp(this.name, this.speed, this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Container(
        height: 390,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        // Speed Meter
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160,
              child: Row(
                children: [
                  Expanded(
                    child: SpeedMeter(speed),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black45),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.directions_car_outlined,
                                  size: 32,
                                  color: Color(0xff1c6dd0),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Car Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black45),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.gps_fixed_outlined,
                                  size: 32,
                                  color: Colors.green.shade400,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Car Status',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      status == 'true' ? 'Active' : 'Inactive',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.alt_route,
                          size: 32,
                          color: Colors.purple.shade400,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Moving Since',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '5h,22m',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.wifi,
                          size: 32,
                          color: Colors.red.shade400,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Network Status',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Desconnected',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 8,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.room_outlined,
                    size: 32,
                    color: Colors.orange.shade400,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 75.w,
                        child: const Text(
                          '6 Rue Bouberthar Abdelkrim, 25000,Constantine',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Container(
                constraints: const BoxConstraints.tightFor(
                    width: double.infinity, height: 45),
                child: ElevatedButton(
                  child: const Text(
                    'History for Last 12 Hour',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class CustomMarker extends StatelessWidget {
//   const CustomMarker({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }

class SpeedMeter extends StatelessWidget {
  final String speed;
  const SpeedMeter(this.speed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              minimum: 0,
              maximum: 250,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                  thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  angle: 180,
                  widget: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          speed,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Km/h',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              pointers: const <GaugePointer>[
                RangePointer(
                    value: 220,
                    cornerStyle: CornerStyle.bothCurve,
                    enableAnimation: true,
                    animationDuration: 1200,
                    animationType: AnimationType.ease,
                    sizeUnit: GaugeSizeUnit.factor,
                    gradient: SweepGradient(
                        colors: <Color>[Color(0xFF6A6EF6), Color(0xFFDB82F5)],
                        stops: <double>[0.25, 0.75]),
                    color: Color(0xFF00A8B5),
                    width: 0.15),
              ]),
        ],
      ),
    );
  }
}

// /*
// SfRadialGauge(
//                                       axes: [
//                                         RadialAxis(
//                                             minimum: 0,
//                                             maximum: 250,
//                                             ranges: [
//                                               GaugeRange(
//                                                   startValue: 0,
//                                                   endValue: 50,
//                                                   color: Colors.green),
//                                               GaugeRange(
//                                                   startValue: 50,
//                                                   endValue: 100,
//                                                   color: Colors.orange),
//                                               GaugeRange(
//                                                   startValue: 100,
//                                                   endValue: 250,
//                                                   color: Colors.red)
//                                             ],
//                                             pointers: const [
//                                               RangePointer(value: 90),
//                                             ],
//                                             annotations: <GaugeAnnotation>[
//                                               GaugeAnnotation(
//                                                   widget: Container(
//                                                     child: const Text(
//                                                       '90.0',
//                                                       style: TextStyle(
//                                                         fontSize: 25,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   angle: 90,
//                                                   positionFactor: 0.5)
//                                             ])
//                                       ],
//                                     )

//  */
