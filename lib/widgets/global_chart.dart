// Package imports
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class GlobalChart extends StatefulWidget {
  GlobalChart({Key? key}) : super(key: key);

  @override
  State<GlobalChart> createState() => _GlobalChartState();
}

class _GlobalChartState extends State<GlobalChart> {
  late List<GDPData> _chartData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      tooltipBehavior: _tooltipBehavior,
      margin: const EdgeInsets.all(0),
      borderWidth: 0,
      palette: [Colors.green, Colors.orange, Colors.red],
      backgroundColor: Colors.transparent,
      series: <CircularSeries>[
        RadialBarSeries<GDPData, String>(
          dataSource: _chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
          enableTooltip: true,
          maximumValue: 300,
        )
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Moving', 100),
      GDPData('Paused', 80),
      GDPData('Stopped', 120),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
