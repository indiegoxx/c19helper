/// RTL Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StateARD extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StateARD(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory StateARD.withSampleData() {
    return new StateARD(
      createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {

    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new charts.BarChart(
          seriesList,
          animate: animate,
          vertical: false,
        ));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}