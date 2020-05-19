import 'dart:async';

import 'package:covid19stat/screens/graphs/testgraph.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart' as charttext;
import 'package:charts_flutter/src/text_style.dart' as chartstyle;

import 'package:provider/provider.dart';
import 'package:covid19stat/model/nation_state_model.dart';

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
  
class GraphsScreen extends StatefulWidget {
  final PageController graphsPageController;
  //final noSwipe;
  GraphsScreen(this.graphsPageController);
  @override
	State<StatefulWidget> createState() {
    return _GraphsScreenState(this.graphsPageController);
  }
  
}

class _GraphsScreenState extends State<GraphsScreen>{
  final PageController graphsPageController;
  _GraphsScreenState(this.graphsPageController);
  
  int gRange=1;
  List<String> cldnSubjects=[];
  
  double gSLen=0;
  List<Color> pColorList=[Colors.red, Colors.green, Colors.black];
  List<bool> taps=[false, false];
  var stateData;
  var mainData;
  var sTstData;
  var distData;
  String gKey;
  int _dataSpread=1;
  bool _modeLog=false;
  DateTime gfirstDay= DateTime(2020, 01, 31);
  DateTime glastDay= DateTime(0, 0, 0);
  

  GRendrer0 gRender0=new GRendrer0();
  GRendrer1 gRender1=new GRendrer1();
  GRendrer2 gRender2=new GRendrer2();
  GRendrer3 gRender3=new GRendrer3();
  GRendrer4 gRender4=new GRendrer4();
  var grenderX=[];

  GMulRendrer0 gMulRender0=new GMulRendrer0();
  GMulRendrer1 gMulRender1=new GMulRendrer1();
  GMulRendrer2 gMulRender2=new GMulRendrer2();
  GMulRendrer3 gMulRender3=new GMulRendrer3();
  GMulRendrer4 gMulRender4=new GMulRendrer4();
  var gMulRenderX=[];

  //GBarRendrer0 gBarRender0=new GBarRendrer0();
  GBarRendrer1 gBarRender1=new GBarRendrer1();

  GPieRendrer0 gPieRender0=new GPieRendrer0();
  
  int nConfirmed;
  int nActive;
  int nRecovered;
  int nDeceased;
  int nTested;
  List<Color> colors7=[Colors.deepPurple, Colors.indigo, Colors.blue, Colors.yellow, Colors.green, Colors.orange, Colors.red];
  List<Color> colorList=[Colors.purple, Colors.pink, Colors.orange, Colors.yellow, Colors.cyan, Colors.green, Colors.grey, Colors.blue];
  final List<String> dataSubject=[
    "India",
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha", 
    "Puducherry", 
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
  ];

  int dstadd=0;
  String _selectedSubject;
  @override
  void initState(){
    stateData=Provider.of<GlobalData>(context, listen:false).getstategraph;
    mainData=Provider.of<GlobalData>(context, listen:false).getmainPayload;
    sTstData=Provider.of<GlobalData>(context, listen:false).getTestData;
    distData=Provider.of<GlobalData>(context, listen:false).getdistData;
    gKey=Provider.of<GlobalData>(context, listen:false).getgraphT;
    setState(() {
    _selectedSubject= codetoTitle(gKey);
    });
    for(int i=0;i<5;i++){
      _labelBox[i][0]=_labelBox[i][1]="";
    }
    for(int i=0;i<5;i++){
      _mullabelBox[i][0]=_mullabelBox[i][1]="";
    }
    for(int i=0;i<4;i++){
      _barlabelBox[i][0]=_barlabelBox[i][1]="";
    }
    grenderX.add(gRender0);
    grenderX.add(gRender1);
    grenderX.add(gRender2);
    grenderX.add(gRender3);
    grenderX.add(gRender4);

    gMulRenderX.add(gMulRender0);
    gMulRenderX.add(gMulRender1);
    gMulRenderX.add(gMulRender2);
    gMulRenderX.add(gMulRender3);
    gMulRenderX.add(gMulRender4);

    cldnSubjects.add("an");
    cldnSubjects.add("ar");
    cldnSubjects.add("mh");
    cldnSubjects.add("jh");
    cldnSubjects.add("");
    cldnSubjects.add("");
    cldnSubjects.add("");

    
    super.initState();
    
    
  }
  void refreshColor(){
    pColorList[0]=Colors.red;
    pColorList[1]=Colors.green;
    pColorList[2]=Colors.black;
    
  }
  Future colorPalette(String title, int bxN)
  {
    return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        //color: Colors.cyan,
                        //width: MediaQuery.of(context).size.width*.4,
                        height: MediaQuery.of(context).size.height*.5,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              trailing: GestureDetector(
                                child: Icon(Icons.refresh, size: 30,),
                                onTap: (){
                                  setState(() {
                                    refreshColor();
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ),
                            /*Row(
                              children: <Widget>[
                                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  GestureDetector(
                                        child: Icon(Icons.refresh, size: 20,),
                                        onTap: (){
                                          setState(() {
                                            refreshColor();
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                              ],
                            ),*/
                            Container(
                              height: MediaQuery.of(context).size.height*.35,
                              width: MediaQuery.of(context).size.height*.35,
                              child: new GridView.builder(
                                itemCount: colorList.length,
                                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                itemBuilder: (BuildContext context, int index) {
                                  return new GestureDetector(
                                    child: new Container(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 45.0,
                                        height: 45.0,                    
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: colorList[index],
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        pColorList[bxN]=colorList[index];
                                        Navigator.pop(context);
                                      });              
                                    },
                                  );
                                },
                              )
                            ),
                          ],
                        ),
                      )
                    );
                  }
                );
  }
  List<String> sRDialList(){
    List<String> ndSub=[];
    for(int i=0;i<dataSubject.length;i++){
      if(dataSubject[i]!=_selectedSubject){
        ndSub.add(dataSubject[i]);
      }
    }
    return ndSub;
  }
  List<String> chipDialList(int cPos){
    List<String> ndSub=[];
    for(int i=0;i<dataSubject.length;i++){
      if(dataSubject[i]=="India"){
        ndSub.add("");
      }
      else if(dataSubject[i]!=cldnSubjects[cPos]){
        ndSub.add(dataSubject[i]);
      }
    }
    return ndSub;
  }
  //returns stylized titles
  Widget dataTitle(String title, {color: Colors.black}){
    return Container(
      width: double.infinity,
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.left,
        style:  TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  //returns stylized titles
  Widget sectTitle(String title){
    return Container(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style:  TextStyle(
          fontSize: 20,
          //fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  
  DateTime toDT(var a){
    String b=a.toString();
    String date;
    String month;
    String year;
    if(b.substring(2,3)!="/"){
      date=b.substring(0,2);
      month=b.substring(3,6);
      if(month=="Jan"){month="01";}
      else if(month=="Feb"){month="02";}
      else if(month=="Mar"){month="03";}
      else if(month=="Apr"){month="04";}
      else if(month=="May"){month="05";}
      else if(month=="Jun"){month="06";}
      else if(month=="Jul"){month="07";}
      else if(month=="Aug"){month="08";}
      else if(month=="Sep"){month="09";}
      else if(month=="Oct"){month="10";}
      else if(month=="Nov"){month="11";}
      else if(month=="Dec"){month="12";}

      year="2020";
    }
    else{
      date=b.substring(0,2);
      month=b.substring(3,5);

      year="2020";
    }
    return DateTime(int.parse(year), int.parse(month), int.parse(date));
  }
  int toINT(var a){
    String b=a.toString();
    if(b==""){b="0";}
    return int.parse(b);
  }

  Widget gTitle(String title, Color color, {bgColor: Colors.pink}){
    return Container(
      color: (bgColor==Colors.pink)?color.withOpacity(0.125):bgColor,
      child: ListTile (
          title: (bgColor!=Colors.pink)?Text(title,
            textAlign: TextAlign.left,
            style:  TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ):null,
          trailing: (bgColor==Colors.pink)?Text(title,
            textAlign: TextAlign.left,
            style:  TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ):null,
        ),
    );
  }

  bool chipChk(int cP, int index){
    bool chk=false;
    for(int i=0;i<7;i++){
        if(cldnSubjects[i]==titleToCode(dataSubject[index]) ){
          chk=true;
        }
    }
    return chk;
  }
  _getBSeriesData(String queryKey, String id, {color: Colors.lightBlue}) {
    
    // bar graph data
    List<BarData> dataB = [];
    if(queryKey!="Tested"){
      for(var i=0;i<distData.length;i++)
      {
        if(distData[i]["state"].toString().toUpperCase() == _selectedSubject.toUpperCase())
        {
          dstadd=i;
          for(var j=0;j<distData[i]["districtData"].length;j++){
          dataB.add(BarData(title: distData[i]["districtData"][j]["district"], value: distData[i]["districtData"][j][queryKey], barColor: charts.ColorUtil.fromDartColor(color)) );
          }
          gSLen=(distData[i]["districtData"].length*60).toDouble();
          break;
        }
      }
    }
    
    List<charts.Series<BarData, String>> series = [
      
      charts.Series(
        id: id,
        data: dataB,
        domainFn: (BarData region, _) => region.title,
        measureFn: (BarData region, _) => region.value,
        colorFn: (BarData region, _) => region.barColor
      )
    ];
    return series;
  }

  /*Widget gBar(String queryKey, String id, int graphBN, {Color color: Colors.red}){
    return Container(
      color: color.withOpacity(0.125),
        child: SizedBox(
          height: 200, 
          child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: SizedBox(
              //height: 200,
              width: (gSLen>MediaQuery.of(context).size.width)?gSLen:MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 40, 140, 20),
                //height: 200,
                child: charts.BarChart(
                  _getBSeriesData(queryKey, id, color:color), 
                  animate: false,
                  behaviors: [
                    new charts.LinePointHighlighter(symbolRenderer: gBarRender0,
                    dashPattern: [],
                    defaultRadiusPx: 0,
                    ),
                    new charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag)
                  ],
                  selectionModels: [
                    new charts.SelectionModelConfig(
                      type: charts.SelectionModelType.info,
                      changedListener: (charts.SelectionModel model) {
                        final selectedDatum = model.selectedDatum;
                        if(model.hasDatumSelection){
                            ToolTipMgr.setgraphBN(graphBN);
                            ToolTipMgr.setBarLabel(graphBN, (model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString(), (selectedDatum.first.datum.title));
                            print(graphBN.toString()+"|"+(model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString()+"|"+(selectedDatum.first.datum.title));

                        }
                      },
                    )
                  ],
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: new charts.GridlineRendererSpec(
                      labelRotation: 20,
                      labelStyle: new charts.TextStyleSpec(
                        fontSize: 15,
                        color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                      ),
                      lineStyle: new charts.LineStyleSpec(
                        color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                      ),
                    ),
                  ),
                  primaryMeasureAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                    desiredTickCount: 5,
                  ),
                  renderSpec: new charts.GridlineRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                      fontSize: 15,
                      color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                    ),
                    lineStyle: new charts.LineStyleSpec(
                      color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                    ),
                  ),
                ),
              )
            )
          )
        )
      )
    );
  }*/

_getBSSeriesData(String id) {
    
    // bar graph data
    List<List<BarData>> data = [];
    for(int j=0;j<3;j++){data.add([]);}
    List<String> queryKey=["active", "recovered", "deceased"];
    List<Color> color=[Colors.red, Colors.green, Colors.black87];
      for(var i=0;i<distData.length;i++)
      {

        if(distData[i]["state"].toString().toUpperCase() == _selectedSubject.toUpperCase())
        {
          dstadd=i;
          for(int k=0;k<3;k++){
            for(var j=0;j<distData[i]["districtData"].length;j++){
              if(distData[i]["districtData"][j][queryKey[k]]>=0){
                data[k].add(BarData(title: distData[i]["districtData"][j]["district"], value: distData[i]["districtData"][j][queryKey[k]], barColor: charts.ColorUtil.fromDartColor(color[k])) );
              }
              else{
                data[k].add(BarData(title: distData[i]["districtData"][j]["district"], value: 0, barColor: charts.ColorUtil.fromDartColor(color[k])) );
              }
            
            }
          }
          gSLen=(distData[i]["districtData"].length*60).toDouble();
          break;
        }
      }
    
    
    List<charts.Series<BarData, String>> series = [
      new charts.Series(
        id: id,
        data: data[0],
        domainFn: (BarData region, _) => region.title,
        measureFn: (BarData region, _) => region.value,
        colorFn: (BarData region, _) => region.barColor
      ),
      new charts.Series(
        id: id,
        data: data[1],
        domainFn: (BarData region, _) => region.title,
        measureFn: (BarData region, _) => region.value,
        colorFn: (BarData region, _) => region.barColor
      ),
      new charts.Series(
        id: id,
        data: data[2],
        domainFn: (BarData region, _) => region.title,
        measureFn: (BarData region, _) => region.value,
        colorFn: (BarData region, _) => region.barColor
      ),
    ];
    return series;
  }

Widget gBarStack(String id, int graphBSN, ){
    return Container(
      color: Colors.grey.withOpacity(0.05),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*.6, 
          child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: SizedBox(
              //height: 200,
              width: (gSLen*2>MediaQuery.of(context).size.width)?gSLen*2:MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 50, 140, 100),
                //height: 200,
                child: charts.BarChart(
                  _getBSSeriesData(id), 
                  animate: false,
                  defaultRenderer: new charts.BarRendererConfig(
                    groupingType: charts.BarGroupingType.grouped, strokeWidthPx: 2.0,
                  ),
                  behaviors: [
                    new charts.LinePointHighlighter(symbolRenderer: gBarRender1,
                    dashPattern: [],
                    defaultRadiusPx: 0,
                    ),
                    new charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag)
                  ],
                  selectionModels: [
                    new charts.SelectionModelConfig(
                      type: charts.SelectionModelType.info,
                      changedListener: (charts.SelectionModel model) {
                        final selectedDatum = model.selectedDatum;
                        if(model.hasDatumSelection){
                            ToolTipMgr.setgraphBSN(graphBSN);
                            ToolTipMgr.setBSLabel(0, (model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString(), (selectedDatum.first.datum.title));
                            print(graphBSN.toString()+"|"+(model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString()+"|"+(selectedDatum.first.datum.title));

                        }
                      },
                    )
                  ],
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: new charts.GridlineRendererSpec(
                      labelRotation: 20,
                      labelStyle: new charts.TextStyleSpec(
                        fontSize: 15,
                        color: charts.MaterialPalette.black,
                      ),
                      lineStyle: new charts.LineStyleSpec(
                        color: charts.MaterialPalette.black,
                      ),
                    ),
                  ),
                  primaryMeasureAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                    desiredTickCount: 5,
                  ),
                  renderSpec: new charts.GridlineRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                      fontSize: 15,
                      color: charts.MaterialPalette.black,
                    ),
                    lineStyle: new charts.LineStyleSpec(
                      color: charts.MaterialPalette.black,
                    ),
                  ),
                ),
                layoutConfig: new charts.LayoutConfig(
                  leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
                  topMarginSpec: new charts.MarginSpec.fixedPixel(0),
                  rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
                  bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)
                )
              )
            )
          )
        )
      )
    );
  }

  _getPSeriesData() {
    final dataP = [
      PieData((100*(nConfirmed-nRecovered-nDeceased)/(nConfirmed)).toStringAsFixed(2), nConfirmed-nRecovered-nDeceased, pColorList[0]),
      PieData((100*(nRecovered)/(nConfirmed)).toStringAsFixed(2), nRecovered, pColorList[1]),
      PieData((100*(nDeceased)/(nConfirmed)).toStringAsFixed(2), nDeceased, pColorList[2]),
    ];
    List<charts.Series<PieData, String>> series = [
      charts.Series(
        id: "Pie",
        data: dataP,
        domainFn: (PieData pie, _) => pie.name,
        measureFn: (PieData pie, _) => pie.value,
        colorFn: (PieData pie, _) => charts.ColorUtil.fromDartColor(pie.color)
      )
    ];
    return series;
  }
  Widget gPie(){
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width*.5,
      child: charts.PieChart(
        _getPSeriesData(),
        animate: false,
        defaultRenderer: new charts.ArcRendererConfig(
          arcRatio: .7,
          /*arcRendererDecorators: [
          new charts.ArcLabelDecorator()
          ]*/
        ),
        behaviors: [
          new charts.LinePointHighlighter(
                drawFollowLinesAcrossChart: true,
                //showVerticalFollowLine: LinePointHighlighterFollowLineType,
                symbolRenderer:  gPieRender0,
                dashPattern: [],
                defaultRadiusPx: 10,
              ),
        ],
        selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: (charts.SelectionModel model) {
                  final selectedDatum = model.selectedDatum;
                  if(model.hasDatumSelection){
                    
                    print((model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString()+"|"+(selectedDatum.first.datum.name).toString());
                  }
                },
              )
            ],
        //behaviors: [new charts.DatumLegend()],
      ),
    );
  }
  Widget gMulTimeSeries(String title, String id, int graphMN, {color: Colors.blue}){
    var d1; 
  var d2;

StreamController<List<String>> controller = StreamController<List<String>>();
Stream stream = controller.stream;
    return Stack(
      children: <Widget>[
        Container(
          color: color.withOpacity(.05),
            padding: (title!="Tested")?EdgeInsets.fromLTRB(10, 80, 10, 20):EdgeInsets.fromLTRB(10, 130, 10, 20),
            height: 400,
            child: charts.TimeSeriesChart(
              _createSampleData2(title, id),
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
                    //symbolRenderer:  (_graphMN==graphMN)?gMulRenderX[graphMN]:null,
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
                        ToolTipMgr.setgraphMN(graphMN);
                        ToolTipMgr.setMulLabel(graphMN, (model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString(), dtToString((selectedDatum.first.datum.day)));
                        d1=(model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString();
                        d2=dtToString((selectedDatum.first.datum.day));
                        controller.add([d1,d2]);  
                      }
                    },
                  )
                ],
              dateTimeFactory: const charts.LocalDateTimeFactory(),
              domainAxis: new charts.DateTimeAxisSpec(
                  renderSpec: new charts.SmallTickRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                          fontSize: 15,
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                      lineStyle: new charts.LineStyleSpec(
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                )),
                primaryMeasureAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
                  renderSpec: new charts.GridlineRendererSpec(
                      labelStyle: new charts.TextStyleSpec(
                          fontSize: 15,
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                      lineStyle: new charts.LineStyleSpec(
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                  ),
                ),
            )
        ),
        StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center();
          } else {
            List<String> subCases=["","","","","","",""];
            if(d2!=null){
      if(title!="Tested")
      {
      List<int> tCL=[0,0,0,0,0,0,0];
      List<int> mulCSum=[0,0,0,0,0,0,0];
      for(var i=0;i<stateData["states_daily"].length;i++){
        if(title=="Active"){
          
          for(int j=0;j<7;j++){
            if(cldnSubjects[j]!=""){
              
              if(stateData["states_daily"][i]["status"]=="Confirmed"){
                tCL[j]=toINT(stateData["states_daily"][i][cldnSubjects[j]]);
                //if(j==2){print("c"+tCL[j].toString());}
              }
              else if(stateData["states_daily"][i]["status"]=="Recovered"){
                tCL[j]=tCL[j]-toINT(stateData["states_daily"][i][cldnSubjects[j]]);
                //if(j==2){print("r"+tCL[j].toString());}
              }
              else if(stateData["states_daily"][i]["status"]=="Deceased"){
                tCL[j]=tCL[j]-toINT(stateData["states_daily"][i][cldnSubjects[j]]);
                //if(j==2){print("d"+tCL[j].toString());}
                if(tCL[j]<0 && _dataSpread==1){tCL[j]=0;}
                subCases[j]=(tCL[j]+mulCSum[j]).toString();
                if(_dataSpread==0){mulCSum[j]+=tCL[j];}
                else{mulCSum[j]=0;}
                tCL[j]=0;
              }
            }
          }
          if(dtToString(toDT(stateData["states_daily"][i]["date"]))==d2.toString() && stateData["states_daily"][i]["status"]=="Deceased"){
            break;
          }
        }
        else if(stateData["states_daily"][i]["status"]==title){
          
          for(int j=0;j<7;j++){
            if(cldnSubjects[j]!=""){
              subCases[j]=((toINT(stateData["states_daily"][i][cldnSubjects[j]]))+mulCSum[j]).toString();
                
              if(_dataSpread==0){mulCSum[j]+=(toINT(stateData["states_daily"][i][cldnSubjects[j]]));}
            }
          }
          if(dtToString(toDT(stateData["states_daily"][i]["date"]))==d2.toString()){
            break;
          }
        }
      }
    }
    else{
      
      for(var i=0;i<sTstData["states_tested_data"].length;i++){
        if(dtToString(toDT(sTstData["states_tested_data"][i]["updatedon"]))==d2.toString()){
            for(int j=0;j<7;j++){
              if(cldnSubjects[j]!=""){
                if(sTstData["states_tested_data"][i]["state"].toString().toUpperCase()==codetoTitle(cldnSubjects[j]).toUpperCase()){
                  subCases[j]=(sTstData["states_tested_data"][i]["totaltested"]);
                  
                }
              }
            }
      }
        
      }
    }
            }
            
            return Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text((d2!=null)?d2.toString():"",style: TextStyle(color: color,fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(title.toUpperCase(),style: TextStyle(color: color,fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Wrap(
                    spacing: MediaQuery.of(context).size.width*.05,
                    children: <Widget>[
                      for(int j=0; j<7; j++)
                      Column(
                        children: <Widget>[
                          Text((d2!=null)?cldnSubjects[j].toUpperCase():"", style: TextStyle(color: colors7[j], fontSize: 16, fontWeight: FontWeight.bold)),
                          Text((d2!=null)?((subCases[j]!="")?subCases[j]:"-"):"", style: TextStyle(color: colors7[j], fontSize: 20, fontWeight: FontWeight.bold)),
                          ]
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
      ],
    );
  }


 
  
  Widget gTimeSeries(String title, String id, int graphN, String lKey, {color: Colors.red}){

  var d1=""; 
  var d2="";

StreamController<List<String>> controller = StreamController<List<String>>();
Stream stream = controller.stream;

  return Stack(
    children: <Widget>[
      Container(
              color: color.withOpacity(0.05),
              padding: EdgeInsets.fromLTRB(10, 60, 10, 20),
              height: 240,
              child: charts.TimeSeriesChart(
                _createDaySeriesData( title, id, lKey, color: color),
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
                    //symbolRenderer:  (_graphN==graphN)?grenderX[graphN]:null,
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
                          ToolTipMgr.setgraphN(graphN);
                          ToolTipMgr.setLabel(graphN, (model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString(), dtToString((selectedDatum.first.datum.day)));
                          d1=(model.selectedSeries[0].measureFn(model.selectedDatum[0].index)).toString();
                          d2=dtToString((selectedDatum.first.datum.day));
                          controller.add([d1,d2]);  
                      }
                    },
                  )
                ],
                dateTimeFactory: const charts.LocalDateTimeFactory(),
                domainAxis: new charts.DateTimeAxisSpec(
                  renderSpec: new charts.SmallTickRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                          fontSize: 15,
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                      lineStyle: new charts.LineStyleSpec(
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                )),
                primaryMeasureAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
                  renderSpec: new charts.GridlineRendererSpec(
                      labelStyle: new charts.TextStyleSpec(
                          fontSize: 15,
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                      lineStyle: new charts.LineStyleSpec(
                          color: (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
                        ),
                  ),
                ),
                
              ),
            ),
            StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
            return Container(
              padding: EdgeInsets.fromLTRB(15,15,10,0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text((d1.toString()!="")?"CASES : "+d1.toString():"",style: TextStyle(color: color,fontSize: 20, fontWeight: FontWeight.bold),),
               Text((d1.toString()!="")?d2.toString():"",style: TextStyle(color: color,fontSize: 15, fontWeight: FontWeight.bold)),
             ],
                    ),
                    Text(title.toUpperCase(),style: TextStyle(color: color,fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
              );
          
        },
      ),
      
    ],
  );
  }

  List<charts.Series<DaySeries, DateTime>> _createDaySeriesData(String queryKey, String id, String lKey, {color:Colors.blue}) {
      List<DaySeries> lines = [];
      List<DaySeries> points = [];
      print(queryKey);
      int _cummulativeSum=0;
      int gStart=0;
    //con, rec, dec for non total
      if(gKey!="tt" && queryKey!="Active" && queryKey!="Tested"){
      if(gRange==0){gStart=0;}
      else if(gRange==1){gStart=stateData["states_daily"].length-30*3;}
      else if(gRange==2){gStart=stateData["states_daily"].length-5*3;}
      gfirstDay=toDT(stateData["states_daily"][gStart]["date"]);
      glastDay=toDT(stateData["states_daily"][stateData["states_daily"].length-1]["date"]);


      for(var i=0;i<stateData["states_daily"].length;i++){
        
        if(i>=gStart && stateData["states_daily"][i]["status"]==queryKey){
            
            lines.add(new DaySeries( toDT(stateData["states_daily"][i]["date"]), (toINT(stateData["states_daily"][i][lKey])+_cummulativeSum)));
            points.add(new DaySeries( toDT(stateData["states_daily"][i]["date"]), (toINT(stateData["states_daily"][i][lKey])+_cummulativeSum)));
            
          //logValue=(log((toINT(stateData["states_daily"][i][lKey])+_cummulativeSum))).round();
            
          if(_dataSpread==0){_cummulativeSum+=toINT(stateData["states_daily"][i][lKey]);}
          else{_cummulativeSum=0;}
        }
        else if(i<gStart && stateData["states_daily"][i]["status"]==queryKey && _dataSpread==0){
          _cummulativeSum+=toINT(stateData["states_daily"][i][lKey]);
        }
      
      }
      if(queryKey=="Confirmed"){nConfirmed=_cummulativeSum;}
      else if(queryKey=="Recovered"){nRecovered=_cummulativeSum;}
      else if(queryKey=="Deceased"){nDeceased=_cummulativeSum;}
      

      }//active for total
      else if(queryKey=="Active" && gKey=="tt"){
        if(gRange==0){gStart=0;}
        else if(gRange==1){gStart=mainData["cases_time_series"].length-30;}
        else if(gRange==2){gStart=mainData["cases_time_series"].length-5;}
        
        String tdS="";
        int tC=0;
        if(_dataSpread==0){
          tdS="total";
        }
        else if(_dataSpread==1){
          tdS="daily";
        }
        for(var i=gStart;i<mainData["cases_time_series"].length;i++){
            tC=toINT(mainData["cases_time_series"][i][tdS+"confirmed"])-toINT(mainData["cases_time_series"][i][tdS+"recovered"])-toINT(mainData["cases_time_series"][i][tdS+"deceased"]);
            lines.add(new DaySeries( toDT(mainData["cases_time_series"][i]["date"]), tC));
            points.add(new DaySeries( toDT(mainData["cases_time_series"][i]["date"]), tC));
        }
      }//active for non total
      else if(queryKey=="Active"){
        if(gRange==0){gStart=0;}
        else if(gRange==1){gStart=stateData["states_daily"].length-30*3;}
        else if(gRange==2){gStart=stateData["states_daily"].length-5*3;}
        int tC=0;
        for(var i=0;i<stateData["states_daily"].length;i++){
          if(stateData["states_daily"][i]["status"]=="Confirmed"){
            tC=toINT(stateData["states_daily"][i][lKey]);
          }
          else if(stateData["states_daily"][i]["status"]=="Recovered"){
            tC=tC-toINT(stateData["states_daily"][i][lKey]);
          }
          else if(stateData["states_daily"][i]["status"]=="Deceased"){
            tC=tC-toINT(stateData["states_daily"][i][lKey]);
            if(tC<0 && _dataSpread==1){tC=0;}
            if(i>=gStart){
              lines.add(new DaySeries( toDT(stateData["states_daily"][i]["date"]), tC+_cummulativeSum));
              points.add(new DaySeries( toDT(stateData["states_daily"][i]["date"]), tC+_cummulativeSum));
            }
            
            
          if(_dataSpread==0){_cummulativeSum+=tC;}
          else{_cummulativeSum=0;}
          tC=0;
          }
        }
        nActive=_cummulativeSum;
      }//tested for non total
      else if(queryKey=="Tested" && gKey!="tt"){
        DateTime gDayStart;
        if(gRange==0){
          gDayStart=gfirstDay;
        }
        else if(gRange==1){
          gDayStart=glastDay.subtract(new Duration(days:30));
        }
        else if(gRange==2){
          gDayStart=glastDay.subtract(new Duration(days:5));
        }
        
        for(var i=0;i<sTstData["states_tested_data"].length;i++){
          if(toDT(sTstData["states_tested_data"][i]["updatedon"]).isAfter(gDayStart))
          {
            if(sTstData["states_tested_data"][i]["state"].toString().toUpperCase()==_selectedSubject.toUpperCase() && sTstData["states_tested_data"][i]["totaltested"]!=""){
              lines.add(new DaySeries( toDT(sTstData["states_tested_data"][i]["updatedon"]), (toINT(sTstData["states_tested_data"][i]["totaltested"]))));
              points.add(new DaySeries( toDT(sTstData["states_tested_data"][i]["updatedon"]), (toINT(sTstData["states_tested_data"][i]["totaltested"]))));
            }
          }
        }
      }//tested for total
      else if(queryKey=="Tested"){
        if(gRange==0){gStart=0;}
        else if(gRange==1){gStart=mainData["tested"].length-1-30;}
        else if(gRange==2){gStart=mainData["tested"].length-1-5;}
        for(var i=gStart;i<mainData["tested"].length-1;i++){
          if(mainData["tested"][i]["totalsamplestested"]!=""){
            lines.add(new DaySeries( toDT(mainData["tested"][i]["updatetimestamp"]), (toINT(mainData["tested"][i]["totalsamplestested"]))));
            points.add(new DaySeries( toDT(mainData["tested"][i]["updatetimestamp"]), (toINT(mainData["tested"][i]["totalsamplestested"]))));
          }
        }
        nTested=(toINT(mainData["tested"][mainData["tested"].length-1]["totalsamplestested"]));
      }//con, rec, dec for total
      else{
        if(gRange==0){gStart=0;}
        else if(gRange==1){gStart=mainData["cases_time_series"].length-30;}
        else if(gRange==2){gStart=mainData["cases_time_series"].length-5;}
        gfirstDay=toDT(mainData["cases_time_series"][gStart]["date"]);
        glastDay=toDT(mainData["cases_time_series"][mainData["cases_time_series"].length-1]["date"]);
        if(queryKey=="Confirmed"){nConfirmed=toINT(mainData["cases_time_series"][mainData["cases_time_series"].length-1]["totalconfirmed"]);}
        else if(queryKey=="Recovered"){nRecovered=toINT(mainData["cases_time_series"][mainData["cases_time_series"].length-1]["totalrecovered"]);}
        else if(queryKey=="Deceased"){nDeceased=toINT(mainData["cases_time_series"][mainData["cases_time_series"].length-1]["totaldeceased"]);}
        queryKey=queryKey.toLowerCase();
        if(_dataSpread==0){
          queryKey="total"+queryKey;
        }
        else if(_dataSpread==1){
          queryKey="daily"+queryKey;
        }
        for(var i=gStart;i<mainData["cases_time_series"].length;i++){
        
            lines.add(new DaySeries( toDT(mainData["cases_time_series"][i]["date"]), (toINT(mainData["cases_time_series"][i][queryKey])+_cummulativeSum)));
            points.add(new DaySeries( toDT(mainData["cases_time_series"][i]["date"]), (toINT(mainData["cases_time_series"][i][queryKey])+_cummulativeSum)));
        }
        
      }
      return [
        new charts.Series<DaySeries, DateTime>(
          id: 'Lines',
          colorFn: (_, __) => (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
          domainFn: (DaySeries day, _) => day.day,
          measureFn: (DaySeries day, _) => day.value,
          data: lines,
        ),
        new charts.Series<DaySeries, DateTime>(
          id: 'Points',
          colorFn: (_, __) => (color==Colors.blue)?charts.MaterialPalette.blue.shadeDefault:(color==Colors.green)?charts.MaterialPalette.green.shadeDefault:(color==Colors.red)?charts.MaterialPalette.red.shadeDefault:(color==Colors.indigo)?charts.MaterialPalette.indigo.shadeDefault:charts.MaterialPalette.black,
          domainFn: (DaySeries day, _) => day.day,
          measureFn: (DaySeries day, _) => day.value,
          data: points
        )
        ..setAttribute(charts.rendererIdKey, id),
      ];
    }

    
  List<charts.Series<BarData, String>> _createSampleData() {
    List<BarData> dataB = [];
    for(var i=0;i<distData.length;i++)
    {
      if(distData[i]["state"].toString().toUpperCase() == _selectedSubject.toUpperCase())
      {
        dstadd=i;
        for(var j=0;j<distData[i]["districtData"].length;j++){
        dataB.add(BarData(title: distData[i]["districtData"][j]["district"], value: distData[i]["districtData"][j]["confirmed"], barColor: charts.ColorUtil.fromDartColor(Colors.blue)) );
        }
        gSLen=(distData[i]["districtData"].length*50).toDouble();
        break;
      }
    }
    
    List<charts.Series<BarData, String>> series = [
      
      charts.Series(
        id: "Sales",
        data: dataB,
        domainFn: (BarData region, _) => region.title,
        measureFn: (BarData region, _) => region.value,
        colorFn: (BarData region, _) => region.barColor
      )
    ];
    return series;
  }

  List<charts.Series<DaySeries, DateTime>> _createSampleData2(String title, String id) {
    print(title+" 2");
    int gStart=0;
    List<List<DaySeries>> cld06=[];
    for(int j=0;j<7;j++){cld06.add([]);}
      if(title!="Tested")
      {
      if(gRange==0){gStart=0;}
      else if(gRange==1){gStart=stateData["states_daily"].length-30*3;}
      else if(gRange==2){gStart=stateData["states_daily"].length-5*3;}
      List<int> tCL=[0,0,0,0,0,0,0];
      List<int> mulCSum=[0,0,0,0,0,0,0];
      for(var i=0;i<stateData["states_daily"].length;i++){
        if(title=="Active"){
          
          for(int j=0;j<7;j++){
            if(cldnSubjects[j]!=""){
              
              if(stateData["states_daily"][i]["status"]=="Confirmed"){
                tCL[j]=toINT(stateData["states_daily"][i][cldnSubjects[j]]);
              }
              else if(stateData["states_daily"][i]["status"]=="Recovered"){
                tCL[j]=tCL[j]-toINT(stateData["states_daily"][i][cldnSubjects[j]]);
              }
              else if(stateData["states_daily"][i]["status"]=="Deceased"){
                
                tCL[j]=tCL[j]-toINT(stateData["states_daily"][i][cldnSubjects[j]]);
                if(tCL[j]<0 && _dataSpread==1){tCL[j]=0;}
                if(i>=gStart)
                {
                cld06[j].add(new DaySeries( toDT(stateData["states_daily"][i]["date"]), tCL[j]+mulCSum[j]));
                }
                if(_dataSpread==0){mulCSum[j]+=tCL[j];}
                else{mulCSum[j]=0;}
                tCL[j]=0;
                
              }
            
            }
            
          }
        
        
        }
        else if(stateData["states_daily"][i]["status"]==title){
          
          for(int j=0;j<7;j++){
            if(cldnSubjects[j]!=""){
              if(i>=gStart)
                {
              cld06[j].add(new DaySeries( toDT(stateData["states_daily"][i]["date"]), (toINT(stateData["states_daily"][i][cldnSubjects[j]]))+mulCSum[j]));
                }
              if(_dataSpread==0){mulCSum[j]+=(toINT(stateData["states_daily"][i][cldnSubjects[j]]));}
            }
          }
        }
      }
    }
    else{
      DateTime gDayStart;
      if(gRange==0){
        gDayStart=gfirstDay;
      }
      else if(gRange==1){
        gDayStart=glastDay.subtract(new Duration(days:30));
      }
      else if(gRange==2){
        gDayStart=glastDay.subtract(new Duration(days:5));
      }
      for(var i=0;i<sTstData["states_tested_data"].length;i++){
        if(toDT(sTstData["states_tested_data"][i]["updatedon"]).isAfter(gDayStart))
        {
          if(sTstData["states_tested_data"][i]["totaltested"]!=""){
            for(int j=0;j<7;j++){
              if(cldnSubjects[j]!=""){
                if(sTstData["states_tested_data"][i]["state"].toString().toUpperCase()==codetoTitle(cldnSubjects[j]).toUpperCase()){
                  cld06[j].add(new DaySeries( toDT(sTstData["states_tested_data"][i]["updatedon"]), (toINT(sTstData["states_tested_data"][i]["totaltested"]))));
                }
              }
            }
          }
        }
      }
    }
    print(title+" 2");
    return [
      new charts.Series<DaySeries,  DateTime>(
        id: 'C1',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(colors7[0]),
        domainFn: (DaySeries sales, _) => sales.day,
        measureFn: (DaySeries sales, _) => sales.value,
        data: cld06[0],
      ),
      new charts.Series<DaySeries,  DateTime>(
        id: 'C2',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(colors7[1]),
        domainFn: (DaySeries sales, _) => sales.day,
        measureFn: (DaySeries sales, _) => sales.value,
        data: cld06[1],
      ),
      new charts.Series<DaySeries,  DateTime>(
        id: 'C3',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(colors7[2]),
        domainFn: (DaySeries sales, _) => sales.day,
        measureFn: (DaySeries sales, _) => sales.value,
        data: cld06[2],
      ),
      new charts.Series<DaySeries, DateTime>(
        id: 'C4',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(colors7[3]),
        domainFn: (DaySeries day, _) => day.day,
        measureFn: (DaySeries day, _) => day.value,
        data: cld06[3],
      ),
      new charts.Series<DaySeries, DateTime>(
        id: 'C5',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(colors7[4]),
        domainFn: (DaySeries day, _) => day.day,
        measureFn: (DaySeries day, _) => day.value,
        data: cld06[4],
      ),
      new charts.Series<DaySeries, DateTime>(
        id: 'C6',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(colors7[5]),
        domainFn: (DaySeries day, _) => day.day,
        measureFn: (DaySeries day, _) => day.value,
        data: cld06[5],
      ),
      new charts.Series<DaySeries, DateTime>(
        id: 'C7',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(colors7[6]),
        domainFn: (DaySeries day, _) => day.day,
        measureFn: (DaySeries day, _) => day.value,
        data: cld06[6],
      )
      //..setAttribute(charts.rendererIdKey, id),
      
    ];
  }
  String codetoTitle(String code){
    String title="";
    if(code=="tt"){title="India";}
    else if(code=="ap"){title="Andhra Pradesh";}
    else if(code=="ar"){title="Arunachal Pradesh";}
    else if(code=="as"){title="Assam";}
    else if(code=="br"){title="Bihar";}
    else if(code=="Chhattisgarh"){title="ch";}
    else if(code=="ga"){title="Goa";}
    else if(code=="gj"){title="Gujarat";}
    else if(code=="hr"){title="Haryana";}
    else if(code=="hp"){title="Himachal Pradesh";}
    else if(code=="jh"){title="Jharkhand";}
    else if(code=="ka"){title="Karnataka";}
    else if(code=="kl"){title="Kerala";}
    else if(code=="mp"){title="Madhya Pradesh";}
    else if(code=="mh"){title="Maharashtra";}
    else if(code=="mn"){title="Manipur";}
    else if(code=="ml"){title="Meghalaya";}
    else if(code=="mz"){title="Mizoram";}
    else if(code=="nl"){title="Nagaland";}
    else if(code=="or"){title="Odisha";}
    else if(code=="pb"){title="Punjab";}
    else if(code=="rj"){title="Rajasthan";}
    else if(code=="sk"){title="Sikkim";}
    else if(code=="tn"){title="Tamil Nadu";}
    else if(code=="tg"){title="Telangana";}
    else if(code=="tr"){title="Tripura";}
    else if(code=="ut"){title="Uttarakhand";}
    else if(code=="up"){title="Uttar Pradesh";}
    else if(code=="wb"){title="West Bengal";} 
    else if(code=="an"){title="Andaman and Nicobar Islands";}
    else if(code=="dl"){title="Delhi";}
    else if(code=="jk"){title="Jammu and Kashmir";}
    else if(code=="la"){title="Ladakh";}
    else if(code=="py"){title="Puducherry";}
    return title;
  }
  String titleToCode(String title){
    String code="";
    if(title=="India"){code="tt";}
    else if(title=="Andhra Pradesh"){code="ap";}
    else if(title=="Arunachal Pradesh"){code="ar";}
    else if(title=="Assam"){code="as";}
    else if(title=="Bihar"){code="br";}
    else if(title=="Chhattisgarh"){code="ch";}
    else if(title=="Goa"){code="ga";}
    else if(title=="Gujarat"){code="gj";}
    else if(title=="Haryana"){code="hr";}
    else if(title=="Himachal Pradesh"){code="hp";}
    else if(title=="Jharkhand"){code="jh";}
    else if(title=="Karnataka"){code="ka";}
    else if(title=="Kerala"){code="kl";}
    else if(title=="Madhya Pradesh"){code="mp";}
    else if(title=="Maharashtra"){code="mh";}
    else if(title=="Manipur"){code="mn";}
    else if(title=="Meghalaya"){code="ml";}
    else if(title=="Mizoram"){code="mz";}
    else if(title=="Nagaland"){code="nl";}
    else if(title=="Odisha"){code="or";}
    else if(title=="Punjab"){code="pb";}
    else if(title=="Rajasthan"){code="rj";}
    else if(title=="Sikkim"){code="sk";}
    else if(title=="Tamil Nadu"){code="tn";}
    else if(title=="Telangana"){code="tg";}
    else if(title=="Tripura"){code="tr";}
    else if(title=="Uttarakhand"){code="ut";}
    else if(title=="Uttar Pradesh"){code="up";}
    else if(title=="West Bengal"){code="wb";} 
    else if(title=="Andaman and Nicobar Islands"){code="an";}
    else if(title=="Delhi"){code="dl";}
    else if(title=="Jammu and Kashmir"){code="jk";}
    else if(title=="Ladakh"){code="la";}
    else if(title=="Puducherry"){code="py";}
    else{code="";}
    return code;
  }
  @override
  Widget build(BuildContext context){
    
    
    //print(MediaQuery.of(context).size.width.toString()+"|"+MediaQuery.of(context).size.height.toString());
    ToolTipMgr.setLabel(0, "", "");
    ToolTipMgr.setLabel(1, "", "");
    ToolTipMgr.setLabel(2, "", "");
    ToolTipMgr.setLabel(3, "", "");
    ToolTipMgr.setLabel(4, "", "");

    ToolTipMgr.setMulLabel(0, "", "");
    ToolTipMgr.setMulLabel(1, "", "");
    ToolTipMgr.setMulLabel(2, "", "");
    ToolTipMgr.setMulLabel(3, "", "");
    ToolTipMgr.setMulLabel(4, "", "");

    ToolTipMgr.setBarLabel(0, "", "");
    ToolTipMgr.setBarLabel(1, "", "");
    ToolTipMgr.setBarLabel(2, "", "");
    ToolTipMgr.setBarLabel(3, "", "");

    stateData=Provider.of<GlobalData>(context, listen:false).getstategraph;
    mainData=Provider.of<GlobalData>(context, listen:false).getmainPayload;
    sTstData=Provider.of<GlobalData>(context, listen:false).getTestData;
    distData=Provider.of<GlobalData>(context, listen:false).getdistData;

    taps[0]=false;
    for(var i=0;i<distData.length;i++)
      {
        if(distData[i]["state"].toString().toUpperCase() == _selectedSubject.toUpperCase())
        {
          gSLen=(distData[i]["districtData"].length*60).toDouble();
          break;
        }
      }
    return Center(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: PageView(
              key: PageStorageKey<String>('graphTab'),
              scrollDirection: Axis.vertical,
              controller: graphsPageController,
              children: <Widget>[
                //graphs page 1
                SingleChildScrollView(
                    child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6)),border: Border.all(width:3)),
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: ListTile(
                              leading:
                                Text((gKey!="an")?_selectedSubject:_selectedSubject.substring(0,20),
                                  textAlign: TextAlign.left,
                                  style:  TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              trailing: Icon(Icons.keyboard_arrow_down, size: 40,),
                              
                            ),
                          ),
                          onTap: (){
                            return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          height: MediaQuery.of(context).size.height*.58,
                                          width: MediaQuery.of(context).size.width*.41,
                                          child: Column(
                                            children: <Widget>[
                                              if(_selectedSubject!="")
                                                ListTile(
                                                  title: Text(
                                                    _selectedSubject,
                                                    style: TextStyle(
                                                        color: Colors.blue
                                                      ),
                                                  ),
                                                  trailing: Icon(Icons.done, color:Colors.blue)
                                                ),
                                              Container(
                                                height: MediaQuery.of(context).size.height*.48,
                                                child: ListView.builder(
                                                  itemCount: sRDialList().length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                    title: Text(
                                                      sRDialList()[index],
                                                      style: TextStyle(
                                                        color: Colors.black
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedSubject=sRDialList()[index];
                                                        gKey=titleToCode(_selectedSubject);
                                                        Navigator.pop(context);
                                                      });                                  
                                                    }
                                                    );
                                                  }
                                                ),
                                          /*child: ListView.builder(
                                            itemCount: dataSubject.length,
                                            itemBuilder: (BuildContext context, int index) => ListTile(
                                              title: Text(dataSubject[index]),
                                              onTap: () {
                                                setState(() {
                                                  _selectedSubject=dataSubject[index];
                                                  gKey=titleToCode(_selectedSubject);
                                                  Navigator.pop(context);
                                                });                                     
                                              }
                                            )
                                          ),*/
                                        ),
                                            ]))
                                      );
                                    },                                
                                  );
                          },
                        ),

                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                        child: Row(
                          children: <Widget>[ 
                            
                            Expanded(
                              child: RadioListTile(
                                title: Text('CUMULATIVE',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)), value: 0, groupValue: _dataSpread, 
                                onChanged: (val){
                                  setState(() {
                                    if(_dataSpread==0){_dataSpread=1;}else{_dataSpread=0;}
                                  });
                                  
                                }
                              )
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: Text('DAILY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)), value: 1, groupValue: _dataSpread, 
                                onChanged: (val){
                                  setState(() {
                                    if(_dataSpread==0){_dataSpread=1;}else{_dataSpread=0;}
                                  });
                                  
                                }
                              )
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: 10,),
                      Container(
                          height: 30,
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(color: Colors.black38,width:2),
                            borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      gRange=0;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: (gRange==0)?Colors.black26:Colors.transparent,
                                    child: Text("ALL",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontSize: 15,
                                      )
                                    ),
                                  )
                                )
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      gRange=1;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: (gRange==1)?Colors.black26:Colors.transparent,
                                    child: Text("1M",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontSize: 15
                                      )
                                    ),
                                  )
                                )
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Container(color: Colors.white, width: 2)),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        gRange=2;
                                      });},
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: (gRange==2)?Colors.black26:Colors.transparent,
                                      child: Text("5D",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                            fontSize: 15)),
                                      )
                                    )
                                  )
                                ],
                              )
                            ),
                            SizedBox(height: 20,),
                            
                            //gTitle("CONFIRMED", Colors.blue),
                            gTimeSeries("Confirmed", "tConfirmedLine", 0, gKey, color: Colors.blue),
                            //gTitle("ACTIVE", Colors.red),
                            gTimeSeries("Active", "tActiveLine", 1, gKey, color: Colors.red),
                            //gTitle("RECOVERED", Colors.green),
                            gTimeSeries("Recovered", "tRecoveredLine", 2, gKey, color: Colors.green),
                            //gTitle("DECEASED", Colors.black),
                            gTimeSeries("Deceased", "tDeceasedLine", 3, gKey, color: Colors.black),
                            //gTitle("TESTED", Colors.indigo),
                            gTimeSeries("Tested", "tTestedLine", 4, gKey, color: Colors.indigo),
                            //SizedBox(height: 20,),
                            /*Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  child: Row(
                                    children: <Widget>[
                                      Container(color:pColorList[0], width:16, height: 16),
                                      SizedBox(width: 10,),
                                      Text("Confirmed", style: TextStyle(color: pColorList[0], fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  onTap: (){colorPalette("Confirmed", 0);},
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                GestureDetector(
                                  child: Row(
                                    children: <Widget>[
                                      Container(color:pColorList[1], width:16, height: 16),
                                      SizedBox(width: 10,),
                                      Text("Recovered", style: TextStyle(color: pColorList[1], fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  onTap: (){colorPalette("Recovered", 1);},
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                GestureDetector(
                                  child: Row(
                                    children: <Widget>[
                                      Container(color:pColorList[2], width:16, height: 16),
                                      SizedBox(width: 10,),
                                      Text("Deceased", style: TextStyle(color: pColorList[2], fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  onTap: (){colorPalette("Deceased", 2);},
                                ),
                              ],
                            ),*/
                                if(_dataSpread==0)
                                SizedBox(
                                  height: 180,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: <Widget>[
                                      gPie(),
                                      Container(
                                        height: 150,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              GestureDetector(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(color:pColorList[0], width:16, height: 16),
                                                    SizedBox(width: 10,),
                                                    Text((100*(nConfirmed-nRecovered-nDeceased)/(nConfirmed)).toStringAsFixed(2)+"%", style: TextStyle(color: pColorList[0], fontWeight: FontWeight.bold),),
                                                    SizedBox(width: 10,),
                                                    Text("Active", style: TextStyle(color: pColorList[0], fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                                onTap: (){colorPalette("Active", 0);},
                                              ),
                                              GestureDetector(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(color:pColorList[1], width:16, height: 16),
                                                    SizedBox(width: 10,),
                                                    Text((100*(nRecovered)/(nConfirmed)).toStringAsFixed(2)+"%", style: TextStyle(color: pColorList[1], fontWeight: FontWeight.bold),),
                                                    SizedBox(width: 10,),
                                                    Text("Recovered", style: TextStyle(color: pColorList[1], fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                                onTap: (){colorPalette("Recovered", 1);},
                                              ),
                                              GestureDetector(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(color:pColorList[2], width:16, height: 16),
                                                    SizedBox(width: 10,),
                                                    Text((100*(nDeceased)/(nConfirmed)).toStringAsFixed(2)+"%", style: TextStyle(color: pColorList[2], fontWeight: FontWeight.bold),),
                                                    SizedBox(width: 10,),
                                                    Text("Deceased", style: TextStyle(color: pColorList[2], fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                                onTap: (){colorPalette("Deceased", 2);},
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                            Visibility(
                              visible: (_selectedSubject=="India"),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  if(_dataSpread==0)
                                  SizedBox(height: 30,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    color: Colors.blue.withOpacity(.05),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        for(int j=0;j<7;j++)
                                          GestureDetector(
                                            child: Chip(
                                              backgroundColor: colors7[j].withOpacity(0.5),
                                              label: Text(
                                                cldnSubjects[j].toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            onTap: (){
                            return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: MediaQuery.of(context).size.height*.58,
                                            width: MediaQuery.of(context).size.width*.41,
                                            child: Column(
                                              children: <Widget>[
                                                if(cldnSubjects[j]!="")
                                                  ListTile(
                                                    title: Text(
                                                      codetoTitle(cldnSubjects[j]),
                                                      style: TextStyle(
                                                          color: Colors.blue
                                                        ),
                                                    ),
                                                    trailing: Icon(Icons.done, color:Colors.blue)
                                                  ),
                                                Container(
                                                  height: MediaQuery.of(context).size.height*.48,
                                                  child: ListView.builder(
                                                    itemCount: chipDialList(j).length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return ListTile(
                                                        
                                                      title: Text(
                                                        (chipDialList(j)[index]=="")?"None":chipDialList(j)[index],
                                                        style: TextStyle(
                                                          decoration: (chipChk(j, index))?TextDecoration.lineThrough:null,
                                                          color: (cldnSubjects[j]=="" && index==0)?Colors.blue:(chipChk(j, index))?Colors.grey:Colors.black
                                                        ),
                                                      ),
                                                      trailing: (index==0 && cldnSubjects[j]=="")?Icon(Icons.done, color:Colors.blue):null,
                                                      onTap: () {
                                                        if(index==0 && cldnSubjects[j]!=""){
                                                          print("mrao1");
                                                          setState(() {
                                                            print("mrao2");
                                                            cldnSubjects[j]="";
                                                            print("mrao3");
                                                            Navigator.pop(context);
                                                          });
                                                        }
                                                        else if(!(chipChk(j, index))){
                                                          setState(() {
                                                            cldnSubjects[j]=titleToCode(chipDialList(j)[index]);
                                                            Navigator.pop(context);
                                                          });
                                                        }                                   
                                                      }
                                                      );
                                                    
                                                    
                                                    }
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },                                
                                    );
                                    }
                                          )
                                      ],
                                    ),
                                  ),
                                  //gTitle("CONFIRMED", Colors.blue),
                                  gMulTimeSeries("Confirmed", "tMulCon", 0, color: Colors.blue),
                                  
                                  //gTitle("ACTIVE", Colors.red),
                                  gMulTimeSeries("Active", "tMulAct", 1, color: Colors.red),
                                  //gTitle("RECOVERED", Colors.green),
                                  gMulTimeSeries("Recovered", "tMulRec", 2, color: Colors.green),
                                  //gTitle("DECEASED", Colors.black),
                                  gMulTimeSeries("Deceased", "tMulDec", 3, color: Colors.black),
                                  //gTitle("TESTED", Colors.indigo),
                                  gMulTimeSeries("Tested", "tTesDec", 4, color: Colors.indigo),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: (_selectedSubject!="India"),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  
                                  /*gTitle("CONFIRMED", Colors.blue),
                                  gBar("confirmed", "tConBar", 0, color: Colors.blue),
                                  gTitle("ACTIVE", Colors.red),
                                  gBar("active", "tActBar", 1, color: Colors.red),
                                  gTitle("RECOVERED", Colors.green),
                                  gBar("recovered", "tRecBar", 2, color: Colors.green),
                                  gTitle("DECEASED", Colors.black),
                                  gBar("deceased", "tDecBar", 3, color: Colors.black),*/
                                  Container(
                                    color: Colors.grey.withOpacity(0.05),
                                    child: ListTile (
                                      trailing: RichText(
          text: TextSpan(
              text: '',
              style: TextStyle(
                fontFamily: "Lato",
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
              children: <TextSpan>[
                TextSpan(text: 'ACT',
                    style: TextStyle(
                        color: Colors.red,
                  fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: ' | ',
                    style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold)
                ),
                TextSpan(
                    text: ' REC',
                    style: TextStyle(
                        color: Colors.green,
                  fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: ' | ',
                    style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold)
                ),
                TextSpan(
                    text: ' DEC',
                    style: TextStyle(color: Colors.black54,
                  fontWeight: FontWeight.bold)
                ),
                TextSpan(
                    text: '',
                    style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold)
                ),
              ]
          ),
        ),
                                      ),
                                  ),
                                  //gTitle("COMBINED(ACT+REC+DEC)", Colors.black, bgColor: Colors.grey.withOpacity(0.125)),
                                  gBarStack("stackBarGraph", 0),
                                ],
                              ),
                            ),
                      ]
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      )   
    );
  }
  
  }



List<List<String>> _labelBox=List.generate(5, (i) => List(2), growable: false);
List<List<String>> _mullabelBox=List.generate(5, (i) => List(2), growable: false);
List<List<String>> _barlabelBox=List.generate(4, (i) => List(2), growable: false);
List<List<String>> _bSlabelBox=List.generate(3, (i) => List(2), growable: false);
int _graphN=0;
int _graphMN=0;
int _graphBN=0;
int _graphBSN=0;
List<String> tV=["",""];

class ToolTipMgr {
  static List<List<String>> get labelBox => _labelBox;
  static List<List<String>> get mullabelBox => _mullabelBox;
  static List<List<String>> get barlabelBox => _barlabelBox;
  static List<List<String>> get bSlabelBox => _bSlabelBox;

  static setLabel(int r, String cases, String day) {
    _labelBox[r][0]= cases;
    _labelBox[r][1]= day;
  }
  static setMulLabel(int r, String cases, String day) {
    _mullabelBox[r][0]= cases;
    _mullabelBox[r][1]= day;
  }
  static setBarLabel(int r, String cases, String title) {
    _barlabelBox[r][0]= cases;
    _barlabelBox[r][1]= title;
  }
  static setBSLabel(int r, String cases, String title) {
    _bSlabelBox[r][0]= cases;
    _bSlabelBox[r][1]= title;
  }
  static setgraphN(int n) {
    _graphN=n;
  }
  static setgraphMN(int n) {
    _graphMN=n;
  }
  static setgraphBN(int n) {
    _graphBN=n;
  }
  static setgraphBSN(int n) {
    _graphBSN=n;
  }

}
class GRendrer0 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);

    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;

    for(int i=0;i<5;i++){
      textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.labelBox[i][0], style: textStyle1),
          15,
          -54+255*(i),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.labelBox[i][1], style: textStyle2),
          15,
          -25+255*(i),
      );
    }
  }
}
class GRendrer1 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);

    var textStyle1=chartstyle.TextStyle(); textStyle1.fontSize = 22; textStyle1.fontFamily = 'Lato'; textStyle1.color = charts.Color.black;
    
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
  }
}

class GRendrer2 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);

    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;
    textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;
    textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    
    for(int i=0;i<5;i++){
      textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.labelBox[i][0], style: textStyle1),
          15,
          -54+255*(i-2),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.labelBox[i][1], style: textStyle2),
          15,
          -25+255*(i-2),
      );
    }
  }
}
class GRendrer3 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);

    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;
    textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;
    textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.labelBox[3][0], style: textStyle1),
          15,
          -54,//+255*(3-4),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.labelBox[3][1], style: textStyle2),
          15,
          -25,//+255*(3-4),
      );
  }
}
class GRendrer4 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);

    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;
    textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;
    textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    //for(int i=0;i<5;i++){
      /*textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");*/
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.labelBox[4][0], style: textStyle1),
          15,
          -54,//+255*(4-4),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.labelBox[4][1], style: textStyle2),
          15,
          -25,//+255*(4-4),
      );
    //}
  }
}
class GMulRendrer0 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    for(int i=0;i<5;i++){
      textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.mullabelBox[i][0], style: textStyle1),
          15,
          -54+455*(i),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.mullabelBox[i][1], style: textStyle2),
          15,
          -25+455*(i),
      );
    }
  }
}
class GMulRendrer1 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    for(int i=0;i<5;i++){
      textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.mullabelBox[i][0], style: textStyle1),
          15,
          15+255*(i),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.mullabelBox[i][1], style: textStyle2),
          15,
          35+255*(i),
      );
    }
  }
}
class GMulRendrer2 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    for(int i=0;i<5;i++){
      textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.mullabelBox[i][0], style: textStyle1),
          15,
          15+255*(i),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.mullabelBox[i][1], style: textStyle2),
          15,
          35+255*(i),
      );
    }
  }
}
class GMulRendrer3 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    for(int i=0;i<5;i++){
      textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.mullabelBox[i][0], style: textStyle1),
          15,
          15+255*(i),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.mullabelBox[i][1], style: textStyle2),
          15,
          35+255*(i),
      );
    }
  }
}
class GMulRendrer4 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    for(int i=0;i<5;i++){
      textStyle1.color = textStyle2.color = (i==0)?charts.Color.fromHex(code: "#0000FF"):(i==1)?charts.Color.fromHex(code: "#FF0000"):(i==2)?charts.Color.fromHex(code: "#008000"):(i==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
      canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.mullabelBox[i][0], style: textStyle1),
          15,
          15+255*(i),
      );
      canvas.drawText(
        charttext.TextElement(ToolTipMgr.mullabelBox[i][1], style: textStyle2),
          15,
          35+255*(i),
      );
    }
  }
}
/*class GBarRendrer0 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;

    textStyle1.color = textStyle2.color = (_graphBN==0)?charts.Color.fromHex(code: "#0000FF"):(_graphBN==1)?charts.Color.fromHex(code: "#FF0000"):(_graphBN==2)?charts.Color.fromHex(code: "#008000"):(_graphBN==3)?charts.Color.fromHex(code: "#000000"):charts.Color.fromHex(code: "#4b0082");
    canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.barlabelBox[_graphBN][0], style: textStyle1),
          (bounds.left-20).round(),
          -30+5*(0),
      );

    canvas.drawText(
      charttext.TextElement(ToolTipMgr.barlabelBox[_graphBN][1], style: textStyle2),
        (bounds.left-20).round(),
        -10+5*(0),
    );

  }
}*/
class GBarRendrer1 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    textStyle1.color = textStyle2.color = charts.Color.fromHex(code: "#000000");
    if(tV[0]!=ToolTipMgr.bSlabelBox[0][0] || tV[1]!=ToolTipMgr.bSlabelBox[0][1]){
    canvas.drawText(
        charttext.TextElement("CASES: "+ToolTipMgr.bSlabelBox[0][0], style: textStyle1),
          (bounds.left-20).round(),
          -50+5*(0),
      );

    canvas.drawText(
      charttext.TextElement(ToolTipMgr.bSlabelBox[0][1], style: textStyle2),
        (bounds.left-20).round(),
        -25+5*(0),
    );
    tV[0]=ToolTipMgr.bSlabelBox[0][0];
    tV[1]=ToolTipMgr.bSlabelBox[0][1];
    }
  }
}

class GPieRendrer0 extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, charts.Color fillColor, charts.FillPatternType fillPattern, charts.Color strokeColor, double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle1=chartstyle.TextStyle();textStyle1.fontSize = 22;textStyle1.fontFamily = 'Lato';textStyle1.color = charts.Color.black;
    var textStyle2=chartstyle.TextStyle();textStyle2.fontSize = 18;textStyle2.fontFamily = 'Lato';textStyle2.color = charts.Color.black;
    textStyle1.color = textStyle2.color = charts.Color.fromHex(code: "#000000");
    canvas.drawText(
        charttext.TextElement("CASES: "+"bxb", style: textStyle1),
          (bounds.left).round(),
          (bounds.top).round(),
      );

    canvas.drawText(
      charttext.TextElement(ToolTipMgr.bSlabelBox[0][1], style: textStyle2),
        (bounds.left).round(),
        (bounds.bottom).round(),
    );
    
  }
}
class BarData {
  String title;
  int value;
  charts.Color barColor;
  BarData({
    @required this.title, 
    @required this.value,
    @required this.barColor
  });
}

class DaySeries{
  DateTime day;
  int value;

  DaySeries(this.day, this.value);
}

class PieData{
  String name;
  int value;
  Color color;

  PieData(this.name, this.value, this.color);
}