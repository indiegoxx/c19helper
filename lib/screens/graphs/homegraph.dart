/// Example of a time series chart using a bar renderer.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/src/painting/text_style.dart' as styl;
import 'package:flutter/material.dart';

class HomeCharts extends StatefulWidget {

  final List<charts.Series<TimeSeriescount, DateTime>> seriesList;
  final bool animate;

  HomeCharts(this.seriesList, {this.animate});

  @override
  _HomeChartsState createState() => _HomeChartsState();
}

class _HomeChartsState extends State<HomeCharts> {
  var cases="";

  var dayof="";

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        new charts.TimeSeriesChart(
          widget.seriesList,
          animate: widget.animate,
          primaryMeasureAxis: new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),
          // Set the default renderer to a bar renderer.
          // This can also be one of the custom renderers of the time series chart.
          defaultRenderer: new charts.BarRendererConfig<DateTime>(),
          // It is recommended that default interactions be turned off if using bar
          // renderer, because the line point highlighter is the default for time
          // series chart.
          defaultInteractions: false,
          // If default interactions were removed, optionally add select nearest
          // and the domain highlighter that are typical for bar charts.
          behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter()],
          selectionModels: [
            SelectionModelConfig(
              changedListener: (SelectionModel model) {
                if(model.hasDatumSelection)
                {
                  setState(() {
                  cases=model.selectedSeries[0].measureFn(model.selectedDatum[0].index).toString();
                  dayof=dtToString(model.selectedSeries[0].domainFn(model.selectedDatum[0].index));
  
                  });
              }
              }

            )
          ],
        ),
                Positioned(
          left: 0,
          child: Container(
            color: Colors.white70,
          child: Column(
            children: <Widget>[
              Text("$cases" , style: styl.TextStyle(fontSize: 18),),
              Text("$dayof" , style: styl.TextStyle(fontSize: 13),),
            ],
          ),
          // color: Colors.grey,
          // height: 30,
          width: 70,
          ),
        ),
      ],
    );
  }

  String dtToString(DateTime dt){
    String a;
    if(dt.month==1){a="JANUARY";}
    else if(dt.month==2){a="FEBRUARY";}
    else if(dt.month==3){a="MARCH";}
    else if(dt.month==4){a="APRIL";}
    else if(dt.month==5){a="MAY";}
    else if(dt.month==6){a="JUNE";}
    else if(dt.month==7){a="JULY";}
    else if(dt.month==8){a="AUGUST";}
    else if(dt.month==9){a="SEPTEMBER";}
    else if(dt.month==10){a="OCTOBER";}
    else if(dt.month==11){a="NOVEMBER";}
    else if(dt.month==12){a="DECEMBER";}
    String d= dt.day.toString()+" "+a;
    return d;
  }
}




class TimeSeriescount {
  final DateTime time;
  final int count;
  final colorBar;

  TimeSeriescount(this.time, this.count,this.colorBar);
}