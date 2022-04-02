// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:allomapi/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
/*
Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _drawLine(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return U.MapBox(
      // get your own access token from https://account.mapbox.com/access-tokens/
      accessToken:
          'pk.eyJ1IjoieXVudXNldm90bCIsImEiOiJja3kxbjI1NWkwODd0MnNueTV4YXkxZzB0In0.d5s4WA8gSlJatnlhiid5hw',
      center: [53.728301, -1.475235],
      type: type,
      zoom: 15,
      scale: _scale,
      controls: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(left: 90, bottom: 29),
          ),
        )
      ],

      polylines: U.PolylineLayer(points),
    );
        },
      ),
    );
  }


 */