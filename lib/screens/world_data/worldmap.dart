import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:covid19stat/maps/worldmap_svg_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:covid19stat/model/global_model.dart';
import 'package:http/http.dart' as http;




class GlobalHome extends StatefulWidget {
  @override
  _GlobalHomeState createState() => _GlobalHomeState();
}

class _GlobalHomeState extends State<GlobalHome> {

  int mapN = 1;
  var selectedRegion;
  Color mapColor= Colors.blue;
  int hCon=0;
  int hAct=0;
  int hRec=0;
  int hDec=0;
  var stateData;
  int dIndiRange=0;
  int cardN=0;
  List<Color> conColorList=[Colors.blue[50], Colors.blue[100], Colors.blue[200], Colors.blue[300], Colors.blue[400], Colors.blue, Colors.blue[600], Colors.blue[700], Colors.blue[800], Colors.blue[900]];

  List<Color> actColorList=[Colors.red[50], Colors.red[100], Colors.red[200], Colors.red[300], Colors.red[400], Colors.red, Colors.red[600], Colors.red[700], Colors.red[800], Colors.red[900]];

  List<Color> recColorList=[Colors.green[50], Colors.green[100], Colors.green[200], Colors.green[300], Colors.green[400], Colors.green, Colors.green[600], Colors.green[700], Colors.green[800], Colors.green[900]];

  List<Color> decColorList=[Color.fromRGBO(240, 240, 240, 1), Color.fromRGBO(220, 220, 220, 1), Color.fromRGBO(200, 200, 200, 1), Color.fromRGBO(185, 185, 185, 1), Color.fromRGBO(165, 165, 165, 1), Color.fromRGBO(150, 150, 150, 1), Color.fromRGBO(130, 130, 130, 1), Color.fromRGBO(100, 100, 100, 1), Color.fromRGBO(70, 70, 70, 1), Color.fromRGBO(70, 70, 70, 1)];

  List<Color> colorList=[Colors.purple, Colors.pink, Colors.orange, Colors.yellow, Colors.cyan, Colors.green, Colors.grey, Colors.lime, Colors.blue, Colors.green[500], Colors.green[700], Colors.green[900]];
  
  String _pressedCountryName;
  List<Region> globe=[];
  static var countriesdata;
  static var globalData;
  Future<void> getCountryCodes() async {
    if(countriesdata==null)
    {
    final response = await http.get("https://raw.githubusercontent.com/indiegoxx/jsonhosting/master/countries_code.json");
    // final response1= await http.get("https://corona.lmao.ninja/v2/countries/");
    if (response.statusCode == 200) {
      countriesdata=json.decode(response.body);
    }
  }

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
                        height: MediaQuery.of(context).size.height*.4,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  GestureDetector(
                                        child: Icon(Icons.refresh, size: 20,),
                                        onTap: (){
                                          setState(() {
                                            refreshColor();
                                          });
                                        },
                                      ),
                              ],
                            ),
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
                                        
                                        //boxpack.color=colorList[index];
                                        if(cardN==0){conColorList[bxN]=colorList[index];}
                                        else if(cardN==1){actColorList[bxN]=colorList[index];}
                                        else if(cardN==2){recColorList[bxN]=colorList[index];}
                                        else if(cardN==3){decColorList[bxN]=colorList[index];}
                                        // Navigator.pop(context);
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

  void refreshColor(){
      if(cardN==0){
        actColorList[0]=Colors.blue[50];actColorList[1]=Colors.blue[100];actColorList[2]=Colors.blue[200];actColorList[3]=Colors.blue[300];actColorList[4]=Colors.blue[500];actColorList[5]=Colors.blue[700];actColorList[6]=Colors.blue[900];
      }
      else if(cardN==1){
        conColorList[0]=Colors.red[50];conColorList[1]=Colors.red[100];conColorList[2]=Colors.red[200];conColorList[3]=Colors.red[300];conColorList[4]=Colors.red[500];conColorList[5]=Colors.red[700];conColorList[6]=Colors.red[900];
      }
      else if(cardN==2){
        recColorList[0]=Colors.green[50];recColorList[1]=Colors.green[100];recColorList[2]=Colors.green[200];recColorList[3]=Colors.green[300];recColorList[4]=Colors.green[500];recColorList[5]=Colors.green[700];recColorList[6]=Colors.green[900];
      }
      else if(cardN==3){
        decColorList[0]=Colors.black12;decColorList[1]=Colors.black26;decColorList[2]=Colors.black38;decColorList[3]=Colors.black45;decColorList[4]=Colors.black54;decColorList[5]=Colors.black87;decColorList[6]=Colors.black;
      }
      Navigator.pop(context);
  }


  Map mainPayload;

  //returns regions as widget
  Widget _buildRegion(Region region) {
    cardN=Provider.of<WorldDataContainer>(context, listen:false).getcarnN;
    mainPayload=Provider.of<WorldDataContainer>(context, listen:false).getWorldData;
    if(cardN==0){mapColor=Colors.blue;}
    else if(cardN==1){mapColor=Colors.red;}
    else if(cardN==2){mapColor=Colors.green;}
    else if(cardN==3){mapColor=Colors.black;}
    return Container(
      child:ClipPath(
        child: Stack(
          children: <Widget>[
            
              GestureDetector(
                  child: Container(
                  // color: Colors.red,
                  color: calcDensityColor(region.name)
                  //color: (_pressedCountryName == region.name) ? Colors.red:Colors.transparent,
                ),
                onTap: (){
                getCountryCodes();
                setState(() {
                  if(_pressedCountryName == region.name)
                  {
                    Provider.of<WorldDataContainer>(context, listen:false).updateSelected("GLOB");
                    _pressedCountryName = "";
                  }
                  else{
                  _pressedCountryName = region.name;
                  Provider.of<WorldDataContainer>(context, listen:false).updateSelected(region.name);
                  }
                  debugPrint(countriesdata[region.name]["title"]+"$cardN");
                }); 
              },
              ),
              Visibility(
              visible: true,//isBoundary(region),
              child: CustomPaint(painter: PathPainter(region.path,MediaQuery.of(context).size.height,MediaQuery.of(context).size.width, (_pressedCountryName==region.name)?2.5:1, (((_pressedCountryName==region.name)?mapColor:mapColor.withOpacity(0.125)))))),
          ]
        ),
        clipper: PathClipper(region.path)
      )
    );
  }

  //builds world map
  List<Widget> _buildWorldMap() {

    List<Widget> regions = List(globe.length);
    for (int i = 0; i < globe.length; i++) {
      regions[i] = _buildRegion(globe[i]);
    }
    return regions;    

  }

  //returns stylized titles
  Widget dataTitle(String title){
    return Container(
      width: double.infinity,
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.left,
        style:  TextStyle(
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
  //returns stylized data boxes
  Widget dataRect(String title, String data, Color color, {Alignment align: Alignment.center}){
    return Expanded(
      child: Container(
        alignment: align,
              child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              data,
              style: TextStyle(
                color: color,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      )
      
    );
  }
  @override
  void initState(){

    getCountryCodes();
    globe.add(Region("AE",worldMapSvgData.AE));
    globe.add(Region("AF",worldMapSvgData.AF));
    globe.add(Region("AL",worldMapSvgData.AL));
    globe.add(Region("AM",worldMapSvgData.AM));
    globe.add(Region("AO",worldMapSvgData.AO));
    globe.add(Region("AR",worldMapSvgData.AR));
    globe.add(Region("AT",worldMapSvgData.AT));
    globe.add(Region("AU",worldMapSvgData.AU));
    globe.add(Region("AZ",worldMapSvgData.AZ));
    globe.add(Region("BA",worldMapSvgData.BA));
    globe.add(Region("BD",worldMapSvgData.BD));
    globe.add(Region("BE",worldMapSvgData.BE));
    globe.add(Region("BF",worldMapSvgData.BF));
    globe.add(Region("BG",worldMapSvgData.BG));
    globe.add(Region("BI",worldMapSvgData.BI));
    globe.add(Region("BJ",worldMapSvgData.BJ));
    globe.add(Region("BN",worldMapSvgData.BN));
    globe.add(Region("BO",worldMapSvgData.BO));
    globe.add(Region("BR",worldMapSvgData.BR));
    globe.add(Region("BS",worldMapSvgData.BS));
    globe.add(Region("BT",worldMapSvgData.BT));
    globe.add(Region("BW",worldMapSvgData.BW));
    globe.add(Region("BY",worldMapSvgData.BY));
    globe.add(Region("BZ",worldMapSvgData.BZ));
    globe.add(Region("CA",worldMapSvgData.CA));
    globe.add(Region("CD",worldMapSvgData.CD));
    globe.add(Region("CF",worldMapSvgData.CF));
    globe.add(Region("CG",worldMapSvgData.CG));
    globe.add(Region("CH",worldMapSvgData.CH));
    globe.add(Region("CI",worldMapSvgData.CI));
    globe.add(Region("CL",worldMapSvgData.CL));
    globe.add(Region("CM",worldMapSvgData.CM));
    globe.add(Region("CN",worldMapSvgData.CN));
    globe.add(Region("CO",worldMapSvgData.CO));
    globe.add(Region("CR",worldMapSvgData.CR));
    globe.add(Region("CU",worldMapSvgData.CU));
    globe.add(Region("CY",worldMapSvgData.CY));
    globe.add(Region("CZ",worldMapSvgData.CZ));
    globe.add(Region("DE",worldMapSvgData.DE));
    globe.add(Region("DJ",worldMapSvgData.DJ));
    globe.add(Region("DK",worldMapSvgData.DK));
    globe.add(Region("DO",worldMapSvgData.DO));
    globe.add(Region("DZ",worldMapSvgData.DZ));
    globe.add(Region("EC",worldMapSvgData.EC));
    globe.add(Region("EE",worldMapSvgData.EE));
    globe.add(Region("EG",worldMapSvgData.EG));
    globe.add(Region("ER",worldMapSvgData.ER));
    globe.add(Region("ES",worldMapSvgData.ES));
    globe.add(Region("ET",worldMapSvgData.ET));
    globe.add(Region("FK",worldMapSvgData.FK));
    globe.add(Region("FI",worldMapSvgData.FI));
    globe.add(Region("FJ",worldMapSvgData.FJ));
    globe.add(Region("FR",worldMapSvgData.FR));
    globe.add(Region("GA",worldMapSvgData.GA));
    globe.add(Region("GB",worldMapSvgData.GB));
    globe.add(Region("GE",worldMapSvgData.GE));
    globe.add(Region("GF",worldMapSvgData.GF));
    globe.add(Region("GH",worldMapSvgData.GH));
    globe.add(Region("GL",worldMapSvgData.GL));
    globe.add(Region("GM",worldMapSvgData.GM));
    globe.add(Region("GN",worldMapSvgData.GN));
    globe.add(Region("GQ",worldMapSvgData.GQ));
    globe.add(Region("GR",worldMapSvgData.GR));
    globe.add(Region("GT",worldMapSvgData.GT));
    globe.add(Region("GW",worldMapSvgData.GW));
    globe.add(Region("GY",worldMapSvgData.GY));
    globe.add(Region("HN",worldMapSvgData.HN));
    globe.add(Region("HR",worldMapSvgData.HR));
    globe.add(Region("HT",worldMapSvgData.HT));
    globe.add(Region("HU",worldMapSvgData.HU));
    globe.add(Region("ID",worldMapSvgData.ID));
    globe.add(Region("IE",worldMapSvgData.IE));
    globe.add(Region("IL",worldMapSvgData.IL));
    globe.add(Region("IN",worldMapSvgData.IN));
    globe.add(Region("IQ",worldMapSvgData.IQ));
    globe.add(Region("IR",worldMapSvgData.IR));
    globe.add(Region("IS",worldMapSvgData.IS));
    globe.add(Region("IT",worldMapSvgData.IT));
    globe.add(Region("JM",worldMapSvgData.JM));
    globe.add(Region("JO",worldMapSvgData.JO));
    globe.add(Region("JP",worldMapSvgData.JP));
    globe.add(Region("KE",worldMapSvgData.KE));
    globe.add(Region("KG",worldMapSvgData.KG));
    globe.add(Region("KH",worldMapSvgData.KH));
    globe.add(Region("KP",worldMapSvgData.KP));
    globe.add(Region("KR",worldMapSvgData.KR));
    globe.add(Region("XK",worldMapSvgData.XK));
    globe.add(Region("KW",worldMapSvgData.KW));
    globe.add(Region("KZ",worldMapSvgData.KZ));
    globe.add(Region("LA",worldMapSvgData.LA));
    globe.add(Region("LB",worldMapSvgData.LB));
    globe.add(Region("LK",worldMapSvgData.LK));
    globe.add(Region("LR",worldMapSvgData.LR));
    globe.add(Region("LS",worldMapSvgData.LS));
    globe.add(Region("LT",worldMapSvgData.LT));
    globe.add(Region("LU",worldMapSvgData.LU));
    globe.add(Region("LV",worldMapSvgData.LV));
    globe.add(Region("LY",worldMapSvgData.LY));
    globe.add(Region("MA",worldMapSvgData.MA));
    globe.add(Region("MD",worldMapSvgData.MD));
    globe.add(Region("ME",worldMapSvgData.ME));
    globe.add(Region("MG",worldMapSvgData.MG));
    globe.add(Region("MK",worldMapSvgData.MK));
    globe.add(Region("ML",worldMapSvgData.ML));
    globe.add(Region("MM",worldMapSvgData.MM));
    globe.add(Region("MN",worldMapSvgData.MN));
    globe.add(Region("MR",worldMapSvgData.MR));
    globe.add(Region("MW",worldMapSvgData.MW));
    globe.add(Region("MX",worldMapSvgData.MX));
    globe.add(Region("MY",worldMapSvgData.MY));
    globe.add(Region("MZ",worldMapSvgData.MZ));
    globe.add(Region("NA",worldMapSvgData.NA));
    globe.add(Region("NC",worldMapSvgData.NC));
    globe.add(Region("NE",worldMapSvgData.NE));
    globe.add(Region("NG",worldMapSvgData.NG));
    globe.add(Region("NI",worldMapSvgData.NI));
    globe.add(Region("NL",worldMapSvgData.NL));
    globe.add(Region("NO",worldMapSvgData.NO));
    globe.add(Region("NP",worldMapSvgData.NP));
    globe.add(Region("NZ",worldMapSvgData.NZ));
    globe.add(Region("OM",worldMapSvgData.OM));
    globe.add(Region("PA",worldMapSvgData.PA));
    globe.add(Region("PE",worldMapSvgData.PE));
    globe.add(Region("PG",worldMapSvgData.PG));
    globe.add(Region("PH",worldMapSvgData.PH));
    globe.add(Region("PL",worldMapSvgData.PL));
    globe.add(Region("PK",worldMapSvgData.PK));
    globe.add(Region("PR",worldMapSvgData.PR));
    globe.add(Region("PS",worldMapSvgData.PS));
    globe.add(Region("PT",worldMapSvgData.PT));
    globe.add(Region("PY",worldMapSvgData.PY));
    globe.add(Region("QA",worldMapSvgData.QA));
    globe.add(Region("RO",worldMapSvgData.RO));
    globe.add(Region("RS",worldMapSvgData.RS));
    globe.add(Region("RU",worldMapSvgData.RU));
    globe.add(Region("RW",worldMapSvgData.RW));
    globe.add(Region("SA",worldMapSvgData.SA));
    globe.add(Region("SB",worldMapSvgData.SB));
    globe.add(Region("SD",worldMapSvgData.SD));
    globe.add(Region("SE",worldMapSvgData.SE));
    globe.add(Region("SI",worldMapSvgData.SI));
    globe.add(Region("SJ",worldMapSvgData.SJ));
    globe.add(Region("SK",worldMapSvgData.SK));
    globe.add(Region("SL",worldMapSvgData.SL));
    globe.add(Region("SN",worldMapSvgData.SN));
    globe.add(Region("SO",worldMapSvgData.SO));
    globe.add(Region("SR",worldMapSvgData.SR));
    globe.add(Region("SS",worldMapSvgData.SS));
    globe.add(Region("SV",worldMapSvgData.SV));
    globe.add(Region("SY",worldMapSvgData.SY));
    globe.add(Region("SZ",worldMapSvgData.SZ));
    globe.add(Region("TD",worldMapSvgData.TD));
    globe.add(Region("TF",worldMapSvgData.TF));
    globe.add(Region("TG",worldMapSvgData.TG));
    globe.add(Region("TH",worldMapSvgData.TH));
    globe.add(Region("TJ",worldMapSvgData.TJ));
    globe.add(Region("TL",worldMapSvgData.TL));
    globe.add(Region("TM",worldMapSvgData.TM));
    globe.add(Region("TN",worldMapSvgData.TN));
    globe.add(Region("TR",worldMapSvgData.TR));
    globe.add(Region("TT",worldMapSvgData.TT));
    globe.add(Region("TW",worldMapSvgData.TW));
    globe.add(Region("TZ",worldMapSvgData.TZ));
    globe.add(Region("UA",worldMapSvgData.UA));
    globe.add(Region("UG",worldMapSvgData.UG));
    globe.add(Region("US",worldMapSvgData.US));
    globe.add(Region("UY",worldMapSvgData.UY));
    globe.add(Region("UZ",worldMapSvgData.UZ));
    globe.add(Region("VE",worldMapSvgData.VE));
    globe.add(Region("VN",worldMapSvgData.VN));
    globe.add(Region("VU",worldMapSvgData.VU));
    globe.add(Region("YE",worldMapSvgData.YE));
    globe.add(Region("ZA",worldMapSvgData.ZA));
    globe.add(Region("ZM",worldMapSvgData.ZM));
    globe.add(Region("ZW",worldMapSvgData.ZW));
    _pressedCountryName='';
    super.initState();
  }
  var zoom = 0.0;

  Color colLevelFunc(int i){
    List<Color> cL=[];
    if(cardN==0){cL=conColorList;}
    else if(cardN==1){cL=actColorList;}
    else if(cardN==2){cL=recColorList;}
    else if(cardN==3){cL=decColorList;}
    if(i==1){return cL[1];}
    else if(i==2){return cL[2];}
    else if(i==3){return cL[3];}
    else if(i==4){return cL[4];}
    else if(i==5){return cL[5];}
    else if(i==6){return cL[6];}
    else if(i==7){return cL[7];}
    else if(i==8){return cL[8];}
    else if(i==9){return cL[9];}
    
    else return cL[0];
  }

  Color calcDensityColor(String rName){
    int rValue=0;
    String qKey='';
    int hValue=0;
    if(mainPayload!=null && mapN==1 && mainPayload[rName]!=null){
      if(cardN==0){qKey="cases";hValue=hCon;}
      else if(cardN==1){qKey="active";hValue=hAct;}
      else if(cardN==2){qKey="recovered";hValue=hRec;}
      else if(cardN==3){qKey="deaths";hValue=hDec;}
      rValue=int.parse(mainPayload[rName][qKey]);
      int n=(hValue/10).floor();
      int nDigit=0;
      while(n!=0){n=(n/10).floor();++nDigit;}
      n=(hValue/10).floor();
      if(n<6){dIndiRange=1;}
      else if(n<10){dIndiRange=int.parse((n.toString()).substring(0, 1));}
      else if(n<100){dIndiRange=int.parse((n.toString()).substring(0, 1))*10;}
      else if(n<500){dIndiRange=int.parse(((n.floor()).toString()).substring(0, 2))*10;}
      else{dIndiRange=int.parse((((hValue/10).floor()).toString()).substring(0, 1))*pow(10, (nDigit-1));}

      if(rValue>dIndiRange*8){return colLevelFunc(9);}
      else if(rValue>dIndiRange*7){return colLevelFunc(8);}
      else if(rValue>dIndiRange*6){return colLevelFunc(7);}
      else if(rValue>dIndiRange*5){return colLevelFunc(6);}
      else if(rValue>dIndiRange*4){return colLevelFunc(5);}
      else if(rValue>dIndiRange*3){return colLevelFunc(4);}
      else if(rValue>dIndiRange*2){return colLevelFunc(3);}
      else if(rValue>dIndiRange*1){return colLevelFunc(2);}
      else if(rValue>0){return colLevelFunc(1);}
    }
    else if(mapN==2){

    }
    //print(MediaQuery.of(context).size.width.toString()+","+MediaQuery.of(context).size.height.toString());
    return colLevelFunc(0);
    
  }
  var locX=0.0;
  var locY=0.0;
  var scl=1.0;
      var processed=true;
    static bool mapvtable=true;
    int cnt=0;
    double xPosition = 0;
    double yPosition = 0;
    var cardX=0;

    var zoomstate= 2.1;
  @override
  Widget build(BuildContext context){
    cardN=Provider.of<WorldDataContainer>(context,listen: false).getcarnN;
    mainPayload=Provider.of<WorldDataContainer>(context, listen:false).getWorldData;
    selectedRegion = Provider.of<WorldDataContainer>(context, listen:false).getselected;
    if(mapN==1 && mainPayload!=null){
      mainPayload.forEach((k,v){
        if(k.toString()!="GLOB")
        {
          if(int.parse(v["cases"])>hCon){hCon=int.parse(v["cases"]);}
          if(int.parse(v["active"])>hAct){hAct=int.parse(v["active"]);}
          if(int.parse(v["recovered"])>hRec){hRec=int.parse(v["recovered"]);}
          if(int.parse(v["deaths"])>hDec){hDec=int.parse(v["deaths"]);}
        }
      });
    }

    return Stack(
          children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/1.4,
                          height: MediaQuery.of(context).size.height/4,
                          // color: Colors.black.withOpacity(0.2),
                          child: Transform.scale(
                                      scale: 1.0,
                                        child: Container(
                                      width: MediaQuery.of(context).size.width/1.4,
                                      height: MediaQuery.of(context).size.height/4,
                                      // color:Colors.green,
                                      child: Stack(
                                        children: [
                                          Stack(
                                          children: _buildWorldMap(),
                                        ),
                                        ]
                                      ),
                                      ),
                                    ),
                        ),
                    Positioned(
                               top: MediaQuery.of(context).size.height/9,
                               left: 0,
                               child: Transform.translate(
                                    offset: Offset(0,50),
                                    child: Transform.scale(
                                    scale: 0.8,
                                    child: Container(
                                      // color: Colors.grey,
                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    height: MediaQuery.of(context).size.height/15,
                                    width: MediaQuery.of(context).size.width/2.5,
                                    // width: (mapN==2)? MediaQuery.of(context).size.width*.825: double.infinity,
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(child: Text("0", style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format(dIndiRange), style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format((dIndiRange*2)), style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format((dIndiRange*3)), style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format((dIndiRange*4)), style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format((dIndiRange*5)), style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format((dIndiRange*6)), style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format((dIndiRange*7)), style: TextStyle(fontSize: 5),)),
                                          Expanded(child: Text(NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format((dIndiRange*8))+"+", style: TextStyle(fontSize: 5),)),
                                        ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                        GestureDetector(child: Container(color: colLevelFunc(0), height: 10,width: 1,), onTap: (){print("yo");colorPalette("0",0);},),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(1), height: 8,), onTap: (){print("yo");colorPalette("1-"+(dIndiRange*1).toString(),1);},)),
                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(2), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*1+1).toString()+"-"+(dIndiRange*2).toString(),2);},)),
                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(3), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*2+1).toString()+"-"+(dIndiRange*3).toString(),3);},)),

                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(4), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*3+1).toString()+"-"+(dIndiRange*4).toString(),4);},)),

                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(5), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*4+1).toString()+"-"+(dIndiRange*5).toString(),5);},)),

                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(6), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*5+1).toString()+"-"+(dIndiRange*6).toString(),6);},)),

                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(7), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*6+1).toString()+"-"+(dIndiRange*7).toString(),7);},)),

                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(8), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*7+1).toString()+"-"+(dIndiRange*8).toString(),8);},)),

                                        Container(color: Colors.black, height: 10,width: 1,),
                                        Expanded(child: GestureDetector(child: Container(color:colLevelFunc(9), height: 8,), onTap: (){print("yo");colorPalette((dIndiRange*8+1).toString()+"+",9);},)),
                                        ],
                                        ),
                                      ),
                                    ]
                            ),
                 ),
                                 ),
                               ),
                    ),
            //        Positioned(
            //          top: 100,
            //          right: 50,
            //         // alignment: Alignment.bottomRight,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(0.0),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   children: <Widget>[
            //                     Row(
            //                       children: <Widget>[
            //                         IconButton(icon: Icon(Icons.add_circle), onPressed: (){
            //                           setState(() {
            //                             zoomstate+=0.2;
            //                           });
            //                           debugPrint("zoom in $zoomstate");}),
            //                           IconButton(icon: Icon(Icons.remove_circle), onPressed: (){
            //                       setState(() {
            //                         zoomstate-=0.2;
            //                       });
            //                       debugPrint("zoom out");}),
            //                       ],
                                  
            //                     ),
                                
            //                   ],
            //                 ),
            //               ),
            // ),
          ],
        ); 
  }
}

//paints regionpath
class PathPainter extends CustomPainter {
  final Path _path;
  final double ht;
  final double wd;
  final double _strokeWidth;
  final Color _color;
  static var scl;
  PathPainter(this._path,this.ht,this.wd, this._strokeWidth, this._color)
  {
    if(wd<=400)
    scl=0.15;
    else
    scl=0.25;
  }
  @override
  void paint(Canvas canvas, Size size) {
    Path path = _path;
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(scl);
    canvas.drawPath(
        path.transform(matrix4.storage),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black38
          ..strokeWidth = _strokeWidth
          );
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}

//clips regionpath
class PathClipper extends CustomClipper<Path> {
  final Path _path;
  PathClipper(this._path);

  @override
  Path getClip(Size size) {
    // return _path;

    // debugPrint(size.toString());\
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(PathPainter.scl);
    // debugPrint(pathBounds.toString());

    return _path.transform(matrix4.storage);// path is returned to ClipPath clipper
    


  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Region {
  Region(this._name,this._path);
  Path _path;
  String _name;

  String get name => _name;
  Path get path => _path;
}



class ZoomableWidget extends StatefulWidget {
  final Widget child;

  const ZoomableWidget({Key key, this.child}) : super(key: key);
  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  Matrix4 matrix = Matrix4.identity();
  Matrix4 zerada =  Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        setState(() {
          matrix = zerada;
        });
      },
      child: MatrixGestureDetector(
        shouldRotate: true,
        onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
          setState(() {
            matrix = m;
          });
        },
        child: Transform(
          transform: matrix,
          child: widget.child,
        ),
      ),
    );
  }
}
