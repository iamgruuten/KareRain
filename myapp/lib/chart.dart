import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _SimpleLineChart(_createSampleData());
  }
  static List<charts.Series<LinearTemp, double>> _createSampleData() {
    final data = [
      new LinearTemp(0, 3.0),
      new LinearTemp(1, 2.8),
      new LinearTemp(2, 2.6),
      new LinearTemp(3, 2.9),
    ];

    return [
      new charts.Series<LinearTemp, double>(
        id: 'Temperature',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearTemp sales, _) => sales.time,
        measureFn: (LinearTemp sales, _) => sales.temp,
        data: data,
      )
    ];
  }
}

class _SimpleLineChart extends State<SimpleLineChart> {
  final List<charts.Series> seriesList;
  final bool animate;

  _SimpleLineChart(this.seriesList, {this.animate});

  factory _SimpleLineChart.withSampleData() {
    return new _SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true));
  }
  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearTemp, double>> _createSampleData() {
    final data = [
      new LinearTemp(0, 3.0),
      new LinearTemp(1, 2.8),
      new LinearTemp(2, 2.6),
      new LinearTemp(3, 2.9),
    ];

    return [
      new charts.Series<LinearTemp, double>(
        id: 'Temperature',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearTemp sales, _) => sales.time,
        measureFn: (LinearTemp sales, _) => sales.temp,
        data: data,
      )
    ];
  }
}


/// Sample linear data type.
class LinearTemp {
  final double time;
  final double temp;

  LinearTemp(this.time, this.temp);
}
