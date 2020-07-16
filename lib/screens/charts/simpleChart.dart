import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleBarChart extends StatelessWidget {
  List<charts.Series> seriesList;
  bool animate;

  SimpleBarChart() {
    this.seriesList = _createSampleData();
    this.animate = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: charts.BarChart(
      seriesList,
      animate: animate,
    ));
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2016', 5),
      new OrdinalSales('2017', 35),
      new OrdinalSales('2018', 25),
      new OrdinalSales('2019', 15),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        data: data,
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
