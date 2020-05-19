import 'package:flutter/material.dart';

import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart' as charttext;
import 'package:charts_flutter/src/text_style.dart' as chartstyle;

import 'package:provider/provider.dart';
import 'package:covid19stat/model/nation_state_model.dart';
class TestGraph extends StatefulWidget {
  final String title;
  final String id;
  final int graphN;
  final dynamic data; 
  final String lKey;
  final Color color;
  @override
  TestGraph(this.title, this.id, this.graphN, this.data, this.lKey, this.color);
  _TestGraphState createState() => _TestGraphState();
}

class _TestGraphState extends State<TestGraph> {
  var color;
  var data;
  var id;
  @override
void initState() {
  super.initState();
  color=widget.color;
  data=widget.data;
  id=widget.id;
}

  var d1;
  var d2;
  
  @override
  Widget build(BuildContext context) {
      return Container(
          color: color.withOpacity(0.135),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          height: 200,
          child: charts.TimeSeriesChart(
            data,
            animate: false,
            behaviors: [
              new charts.RangeAnnotation([
                new charts.LineAnnotationSegment(
                  gfirstDay, charts.RangeAnnotationAxisType.domain,
                  //startLabel: 'Oct 4'
                ),
                new charts.LineAnnotationSegment(
                  gfirstDay, charts.RangeAnnotationAxisType.domain,
                  //endLabel: 'Oct 15'
                ),
              ]),
              new charts.LinePointHighlighter(
                drawFollowLinesAcrossChart: true,
                //showVerticalFollowLine: LinePointHighlighterFollowLineType,
                symbolRenderer:  null,
                dashPattern: [],
                defaultRadiusPx: 10,
              ),
              new charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag)
            ],
            defaultRenderer: new charts.LineRendererConfig(includePoints: true),
            customSeriesRenderers: [
              new charts.PointRendererConfig(customRendererId: id)
            ],
            selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: (charts.SelectionModel model) {
                  final selectedDatum = model.selectedDatum;
                  if(model.hasDatumSelection){                      
                      // ToolTipMgr.setgraphN(graphN);
                      // ToolTipMgr.setLabel(graphN, (model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString(), dtToString((selectedDatum.first.datum.day)));
                      // taps[0]=true;
                      d1=(model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString();
                  }
                },
              )
            ],
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            domainAxis: new charts.DateTimeAxisSpec(
              renderSpec: new charts.SmallTickRendererSpec(
                labelStyle: new charts.TextStyleSpec(
                      fontSize: 15,
                      color: (widget.color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(widget.color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(widget.color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(widget.color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                    ),
                  lineStyle: new charts.LineStyleSpec(
                      color: (widget.color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(widget.color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(widget.color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(widget.color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                    ),
            )),
            primaryMeasureAxis: new charts.NumericAxisSpec(
              tickProviderSpec: new charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
              renderSpec: new charts.GridlineRendererSpec(
                  labelStyle: new charts.TextStyleSpec(
                      fontSize: 15,
                      color: (widget.color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(widget.color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(widget.color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(widget.color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                    ),
                  lineStyle: new charts.LineStyleSpec(
                      color: (widget.color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(widget.color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(widget.color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(widget.color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                    ),
              ),
            ),
            
          ),
        );
  }
    DateTime gfirstDay= DateTime(2020, 01, 31);

}