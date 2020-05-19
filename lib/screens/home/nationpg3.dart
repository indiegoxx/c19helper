import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19stat/screens/utilsc/componets/padbox.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19stat/model/nation_state_model.dart';
import 'package:covid19stat/maps/india/indiamap_svg_data.dart';
import 'package:covid19stat/maps/india/andamanAndNicobarIslandsmap_svg_data.dart';
import 'package:covid19stat/maps/india/andhraPradeshmap_svg_data.dart';
import 'package:covid19stat/maps/india/arunachalPradeshmap_svg_data.dart';
import 'package:covid19stat/maps/india/assammap_svg_data.dart';
import 'package:covid19stat/maps/india/biharmap_svg_data.dart';
import 'package:covid19stat/maps/india/chhattisgarhmap_svg_data.dart';
import 'package:covid19stat/maps/india/delhimap_svg_data.dart';
import 'package:covid19stat/maps/india/goamap_svg_data.dart';
import 'package:covid19stat/maps/india/gujaratmap_svg_data.dart';
import 'package:covid19stat/maps/india/haryanamap_svg_data.dart';
import 'package:covid19stat/maps/india/himachalPradeshmap_svg_data.dart';
import 'package:covid19stat/maps/india/jammuAndKashmirmap_svg_data.dart';
import 'package:covid19stat/maps/india/jharkhandmap_svg_data.dart';
import 'package:covid19stat/maps/india/karnatakamap_svg_data.dart';
import 'package:covid19stat/maps/india/keralamap_svg_data.dart';
import 'package:covid19stat/maps/india/ladakhmap_svg_data.dart';
import 'package:covid19stat/maps/india/madhyaPradeshmap_svg_data.dart';
import 'package:covid19stat/maps/india/maharashtramap_svg_data.dart';
import 'package:covid19stat/maps/india/manipurmap_svg_data.dart';
import 'package:covid19stat/maps/india/meghalayamap_svg_data.dart';
import 'package:covid19stat/maps/india/mizorammap_svg_data.dart';
import 'package:covid19stat/maps/india/nagalandmap_svg_data.dart';
import 'package:covid19stat/maps/india/odishamap_svg_data.dart';
import 'package:covid19stat/maps/india/puducherrymap_svg_data.dart';
import 'package:covid19stat/maps/india/punjabmap_svg_data.dart';
import 'package:covid19stat/maps/india/rajasthanmap_svg_data.dart';
import 'package:covid19stat/maps/india/sikkimmap_svg_data.dart';
import 'package:covid19stat/maps/india/tamilNadumap_svg_data.dart';
import 'package:covid19stat/maps/india/telanganamap_svg_data.dart';
import 'package:covid19stat/maps/india/tripuramap_svg_data.dart';
import 'package:covid19stat/maps/india/uttarakhandmap_svg_data.dart';
import 'package:covid19stat/maps/india/uttarPradeshmap_svg_data.dart';
import 'package:covid19stat/maps/india/westBengalmap_svg_data.dart';


int mapN = 1;

class NationPage3Screen extends StatefulWidget {
  final mapT;
  final loc;
  const NationPage3Screen({this.mapT,this.loc});
  
  @override
  _NationPage3ScreenState createState() => _NationPage3ScreenState();
}

class _NationPage3ScreenState extends State<NationPage3Screen>  with TickerProviderStateMixin {



  _NationPage3ScreenState();
  Color mapColor;
  int hCon=0;
  int hAct=0;
  int hRec=0;
  int hDec=0;
  var stateData;
  int dIndiRange=0;
  int cardN=1;
  List<Color> conColorList=[Colors.blue[50], Colors.blue[100], Colors.blue[200], Colors.blue[300], Colors.blue[500], Colors.blue[700], Colors.blue[900]];
  List<Color> actColorList=[Colors.red[50], Colors.red[100], Colors.red[200], Colors.red[300], Colors.red[500], Colors.red[700], Colors.red[900]];
  List<Color> recColorList=[Colors.green[50], Colors.green[100], Colors.green[200], Colors.green[300], Colors.green[500], Colors.green[700], Colors.green[900]];
  List<Color> decColorList=[Colors.black12, Colors.black26, Colors.black38, Colors.black45, Colors.black54, Colors.black87, Colors.black];
  List<Color> colorList=[Colors.purple, Colors.pink, Colors.orange, Colors.yellow, Colors.cyan, Colors.green, Colors.grey, Colors.lime, Colors.blue];
  //builds india map
  List<Widget> _buildNationMap(List<Region> nation) {
    List<Widget> regions = List(nation.length);
    for (int i = 0; i < nation.length; i++) {
      try{
      regions[i] = _buildRegion(nation[i]);
      }
      catch(e){
        debugPrint("$e");
      }
    }
    return regions;
  }
  //builds state map
  List<Widget> _buildStateMap() {
    List<Region> state;
    if(_pressedStateName=='andaman and nicobar islands'){state=andamanAndNicobarIslands;}
    else if(_pressedStateName=='andhra pradesh'){state=andhraPradesh;}
    else if(_pressedStateName=='arunachal pradesh'){state=arunachalPradesh;}
    else if(_pressedStateName=='assam'){state=assam;}
    else if(_pressedStateName=='bihar'){state=bihar;}
    else if(_pressedStateName=='chhattisgarh'){state=chhattisgarh;}
    else if(_pressedStateName=='delhi'){state=delhi;}
    else if(_pressedStateName=='goa'){state=goa;}
    else if(_pressedStateName=='gujarat'){state=gujarat;}
    else if(_pressedStateName=='haryana'){state=haryana;}
    else if(_pressedStateName=='himachal pradesh'){state=himachalPradesh;}
    else if(_pressedStateName=='jammu and kashmir'){state=jammuAndKashmir;}
    else if(_pressedStateName=='jharkhand'){state=jharkhand;}
    else if(_pressedStateName=='karnataka'){state=karnataka;}
    else if(_pressedStateName=='kerala'){state=kerala;}
    else if(_pressedStateName=='ladakh'){state=ladakh;}
    else if(_pressedStateName=='madhya pradesh'){state=madhyaPradesh;}
    else if(_pressedStateName=='maharashtra'){state=maharashtra;}
    else if(_pressedStateName=='manipur'){state=manipur;}
    else if(_pressedStateName=='meghalaya'){state=meghalaya;}
    else if(_pressedStateName=='mizoram'){state=mizoram;}
    else if(_pressedStateName=='nagaland'){state=nagaland;}
    else if(_pressedStateName=='odisha'){state=odisha;}
    else if(_pressedStateName=='puducherry'){state=puducherry;}
    else if(_pressedStateName=='punjab'){state=punjab;}
    else if(_pressedStateName=='rajasthan'){state=rajasthan;}
    else if(_pressedStateName=='sikkim'){state=sikkim;}
    else if(_pressedStateName=='tamil nadu'){state=tamilNadu;}
    else if(_pressedStateName=='telangana'){state=telangana;}
    else if(_pressedStateName=='tripura'){state=tripura;}
    else if(_pressedStateName=='uttar pradesh'){state=uttarPradesh;}
    else if(_pressedStateName=='uttarakhand'){state=uttarakhand;}
    else if(_pressedStateName=='west bengal'){state=westBengal;}
    else{state=jharkhand;}

    List<Widget> regions = List(state.length);
    for (int i = 0; i < state.length; i++) {
      regions[i] = _buildRegion(state[i]);
    }
    return regions;
  }
  
  bool rPressed(String rName){
    return (((_pressedStateName == rName && mapN==1)||(_pressedDistrictName == rName && mapN==2)) && rName!='boundary');
  }
  
  bool isBoundary(Region region){
    if(region.name=='boundary'){return true;}
    return false;
  }
  String rNameKey(_rName){
    String rKey;
    if(_rName=="andhra pradesh"){rKey="ap";}
    else if(_rName=="arunachal pradesh"){rKey="ar";}
    else if(_rName=="assam"){rKey="as";}
    else if(_rName=="bihar"){rKey="br";}
    else if(_rName=="chhattisgarh"){rKey="ch";}
    else if(_rName=="goa"){rKey="ga";}
    else if(_rName=="gujarat"){rKey="gj";}
    else if(_rName=="haryana"){rKey="hr";}
    else if(_rName=="himachal pradesh"){rKey="hp";}
    else if(_rName=="jharkhand"){rKey="jh";}
    else if(_rName=="karnataka"){rKey="ka";}
    else if(_rName=="kerala"){rKey="kl";}
    else if(_rName=="madhya pradesh"){rKey="mp";}
    else if(_rName=="maharashtra"){rKey="mh";}
    else if(_rName=="manipur"){rKey="mn";}
    else if(_rName=="meghalaya"){rKey="ml";}
    else if(_rName=="mizoram"){rKey="mz";}
    else if(_rName=="nagaland"){rKey="nl";}
    else if(_rName=="odisha"){rKey="or";}
    else if(_rName=="punjab"){rKey="pb";}
    else if(_rName=="rajasthan"){rKey="rj";}
    else if(_rName=="sikkim"){rKey="sk";}
    else if(_rName=="tamil nadu"){rKey="tn";}
    else if(_rName=="telangana"){rKey="tg";}
    else if(_rName=="tripura"){rKey="tr";}
    else if(_rName=="uttarakhand"){rKey="ut";}
    else if(_rName=="uttar pradesh"){rKey="up";}
    else if(_rName=="west bengal"){rKey="wb";} 
    else if(_rName=="andaman and nicobar islands"){rKey="an";}
    else if(_rName=="delhi"){rKey="dl";}
    else if(_rName=="jammu and kashmir"){rKey="jk";}
    else if(_rName=="ladakh"){rKey="la";}
    else if(_rName=="puducherry"){rKey="py";}
    else {rKey="tt";}
    return rKey;
  }
  int toINT(var a){
    String b=a.toString();
    return int.parse(b);
  }

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
    else return cL[0];
  }

  Color calcDensityColor(String rName){
    bool rValZero;
    int prAdd=0;
    int rAdd=0;
    int rValue=0;
    String qKey='';
    int hValue=0;
    if(dataMain!=null && mapN==1){
      if(cardN==0){qKey="confirmed";hValue=hCon;}
      else if(cardN==1){qKey="active";hValue=hAct;}
      else if(cardN==2){qKey="recovered";hValue=hRec;}
      else if(cardN==3){qKey="deaths";hValue=hDec;}
      for(var i=0;i<dataMain["statewise"].length;i++)//for State adress from API
      {
        if(dataMain["statewise"][i]["state"].toString().toUpperCase() == rName.toUpperCase())
        {
          rAdd=i;
        }
      }
      rValue=toINT(dataMain["statewise"][rAdd][qKey]);

      int n=(hValue/6).floor();
      int nDigit=0;
      while(n!=0){n=(n/10).floor();++nDigit;}
      n=(hValue/6).floor();
      if(n<6){dIndiRange=1;}
      else if(n<10){dIndiRange=int.parse((n.toString()).substring(0, 1));}
      else if(n<100){dIndiRange=int.parse((n.toString()).substring(0, 1))*10;}
      else if(n<500){dIndiRange=int.parse(((n.floor()).toString()).substring(0, 2))*10;}
      else{dIndiRange=int.parse((((hValue/6).floor()).toString()).substring(0, 1))*pow(10, (nDigit-1));}

      if(rValue>dIndiRange*5){return colLevelFunc(6);}
      else if(rValue>dIndiRange*4){return colLevelFunc(5);}
      else if(rValue>dIndiRange*3){return colLevelFunc(4);}
      else if(rValue>dIndiRange*2){return colLevelFunc(3);}
      else if(rValue>dIndiRange*1){return colLevelFunc(2);}
      else if(rValue>0){return colLevelFunc(1);}
    }
    else if(distData!=null && mapN==2){

      if(cardN==0){qKey="confirmed";hValue=hCon;}
      else if(cardN==1){qKey="active";hValue=hAct;}
      else if(cardN==2){qKey="recovered";hValue=hRec;}
      else if(cardN==3){qKey="deceased";hValue=hDec;}
      rValZero=true;
      for(var i=0;i<distData.length;i++){
        if(distData[i]["state"].toString().toUpperCase() == _pressedStateName.toUpperCase())
        {
          for(var j=0;j<distData[i]["districtData"].length;j++){
            if(distData[i]["districtData"][j]["district"].toUpperCase() == rName.toUpperCase()){
              rValZero=false;
              rAdd=j;
              prAdd=i;
            }
          }
        }
      }
      rValue=(rValZero)?0:distData[prAdd]["districtData"][rAdd][qKey];
      int n=(hValue/6).floor();
      int nDigit=0;
      while(n!=0){n=(n/10).floor();++nDigit;}
      n=(hValue/6).floor();
      if(n<6){dIndiRange=1;}
      else if(n<10){dIndiRange=int.parse((n.toString()).substring(0, 1));}
      else if(n<100){dIndiRange=int.parse((n.toString()).substring(0, 1))*10;}
      else if(n<500){dIndiRange=int.parse(((n.floor()).toString()).substring(0, 2))*10;}
      else{dIndiRange=int.parse((((hValue/6).floor()).toString()).substring(0, 1))*pow(10, (nDigit-1));}
      //print(dIndiRange.toString()+"yo"+n.toString()+"yo"+hValue.toString());
      if(rValue>dIndiRange*5){return colLevelFunc(6);}
      else if(rValue>dIndiRange*4){return colLevelFunc(5);}
      else if(rValue>dIndiRange*3){return colLevelFunc(4);}
      else if(rValue>dIndiRange*2){return colLevelFunc(3);}
      else if(rValue>dIndiRange*1){return colLevelFunc(2);}
      else if(rValue>0){return colLevelFunc(1);}
    }
    //print(MediaQuery.of(context).size.width.toString()+","+MediaQuery.of(context).size.height.toString());
    return colLevelFunc(0);
    
  }
  
  //returns regions as widget
  Widget _buildRegion(Region region) {
    return Container(
      child:ClipPath(
        child: Stack(
          children: <Widget>[
            
            GestureDetector(
              child: Container(
                color: !isBoundary(region)?calcDensityColor(region.name):Colors.transparent
                /*(((_pressedStateName == region.name && mapN==1)||(_pressedDistrictName == region.name && mapN==2)) && region.name!='boundary')?Colors.red:Colors.white,*/
              ),
              onTap: (){
                setState(() {
                  dValZero=true;
                  if(mapN==1)
                    { 
                      _pressedStateName = region.name;
                      _pressedDistrictName = region.name;
                       for(var i=0;i<dataMain["statewise"].length;i++)//for State adress from API
                          {
                            if(dataMain["statewise"][i]["state"].toString().toUpperCase() == _pressedStateName.toUpperCase())
                            {
                              stadd=i;
                            }
                          }
                    }
                    else if(mapN==2)
                    {
                      
                      _pressedDistrictName = region.name;
                      for(var i=0;i<distData.length;i++)//for District adress from API
                      {
                        if(distData[i]["state"].toString().toUpperCase() == _pressedStateName.toUpperCase())
                        {
                          dstadd=i;
                          for(var j=0;j<distData[i]["districtData"].length;j++){
                            if(distData[i]["districtData"][j]["district"].toUpperCase() == _pressedDistrictName.toUpperCase()){
                              dValZero=false;
                              ddsadd=j;
                            }
                          }
                        }
                      }
                    }  
                }); 
              },
              onDoubleTap: (){
                 setState(() {
                   if(mapN==1){ 
                    _pressedStateName = region.name;
                    _pressedDistrictName = region.name;
                    for(var i=0;i<dataMain["statewise"].length;i++){
                      if(dataMain["statewise"][i]["state"].toString().toUpperCase() == _pressedStateName.toUpperCase())
                      {
                        stadd=i;
                      }
                    }
                    mapN=2;
                    refreshColor();
                  }
                  else if(mapN==2){
                    _pressedDistrictName = region.name;
                  }
                 });
              }
            ),
            Visibility(
              visible: true,//isBoundary(region),
              child: CustomPaint(painter: PathPainter(region.path, isBoundary(region)?3:rPressed(region.name)?4:2, ((rPressed(region.name)?mapColor:mapColor.withOpacity(0.25)))))),
          ]
        ),
        clipper: PathClipper(region.path)
      )
    );
  }
  //prssed state
  String _pressedStateName;
  String _pressedDistrictName;


  List<Region> india=[];
  List<Region> andamanAndNicobarIslands=[];
  List<Region> andhraPradesh=[];
  List<Region> arunachalPradesh=[];
  List<Region> assam=[];
  List<Region> bihar=[];
  List<Region> chhattisgarh=[];
  List<Region> delhi=[];
  List<Region> goa=[];
  List<Region> gujarat=[];
  List<Region> haryana=[];
  List<Region> himachalPradesh=[];
  List<Region> jammuAndKashmir=[];
  List<Region> jharkhand=[];
  List<Region> karnataka=[];
  List<Region> kerala=[];
  List<Region> ladakh=[];
  List<Region> madhyaPradesh=[];
  List<Region> maharashtra=[];
  List<Region> manipur=[];
  List<Region> meghalaya=[];
  List<Region> mizoram=[];
  List<Region> nagaland=[];
  List<Region> odisha=[];
  List<Region> puducherry=[];
  List<Region> punjab=[];
  List<Region> rajasthan=[];
  List<Region> sikkim=[];
  List<Region> tamilNadu=[];
  List<Region> telangana=[];
  List<Region> tripura=[];
  List<Region> uttarakhand=[];
  List<Region> uttarPradesh=[];
  List<Region> westBengal=[];

  //returns stylized titles
  Widget dataTitle(String title){
    return Container(
      width: double.infinity,
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.left,
        style:  TextStyle(
          fontSize: 18,
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
    try{
    india.add(Region('boundary', IndiaMapSvgData.indiaBoundary));
    india.add(Region('andaman and nicobar islands', IndiaMapSvgData.andamanAndNicobarIslands));
    india.add(Region('andhra pradesh', IndiaMapSvgData.andhraPradesh));
    india.add(Region('arunachal pradesh', IndiaMapSvgData.arunachalPradesh));
    india.add(Region('assam', IndiaMapSvgData.assam));
    india.add(Region('bihar', IndiaMapSvgData.bihar));
    india.add(Region('chhattisgarh', IndiaMapSvgData.chattisgarh));
    india.add(Region('chandigarh', IndiaMapSvgData.chandigarh));
    india.add(Region('dadra and nagar haveli', IndiaMapSvgData.dadraAndNagarHaveli));
    india.add(Region('daman and diu', IndiaMapSvgData.damanAndDiu));
    india.add(Region('delhi', IndiaMapSvgData.delhi));
    india.add(Region('goa', IndiaMapSvgData.goa));
    india.add(Region('gujarat', IndiaMapSvgData.gujarat));
    india.add(Region('haryana', IndiaMapSvgData.haryana));
    india.add(Region('himachal pradesh', IndiaMapSvgData.himachalPradesh));
    india.add(Region('jammu and kashmir', IndiaMapSvgData.jammuAndKashmir));
    india.add(Region('jharkhand', IndiaMapSvgData.jharkhand));
    india.add(Region('karnataka', IndiaMapSvgData.karnataka));
    india.add(Region('kerala', IndiaMapSvgData.kerala));
    india.add(Region('ladakh', IndiaMapSvgData.ladakh));
    india.add(Region('lakshadweep', IndiaMapSvgData.lakshadweep));
    india.add(Region('madhya pradesh', IndiaMapSvgData.madhyaPradesh));
    india.add(Region('maharashtra', IndiaMapSvgData.maharashtra));
    india.add(Region('manipur', IndiaMapSvgData.manipur));
    india.add(Region('meghalaya', IndiaMapSvgData.meghalaya));
    india.add(Region('mizoram', IndiaMapSvgData.mizoram));
    india.add(Region('nagaland', IndiaMapSvgData.nagaland));
    india.add(Region('odisha', IndiaMapSvgData.odisha));
    india.add(Region('puducherry', IndiaMapSvgData.puducherry));
    india.add(Region('punjab', IndiaMapSvgData.punjab));
    india.add(Region('rajasthan', IndiaMapSvgData.rajasthan));
    india.add(Region('sikkim', IndiaMapSvgData.sikkim));
    india.add(Region('tamil nadu', IndiaMapSvgData.tamilNadu));
    india.add(Region('telangana', IndiaMapSvgData.telangana));
    india.add(Region('tripura', IndiaMapSvgData.tripura));
    india.add(Region('uttar pradesh', IndiaMapSvgData.uttarPradesh));
    india.add(Region('uttarakhand', IndiaMapSvgData.uttarakhand));
    india.add(Region('west bengal', IndiaMapSvgData.westBengal));

    
    andamanAndNicobarIslands.add(Region('boundary', AndamanAndNicobarIslandsMapSvgData.andamanAndNicobarIslandsBoundary));
    andamanAndNicobarIslands.add(Region('nicobars', AndamanAndNicobarIslandsMapSvgData.nicobars));
    andamanAndNicobarIslands.add(Region('north and middle andaman', AndamanAndNicobarIslandsMapSvgData.northAndMiddleAndaman));
    andamanAndNicobarIslands.add(Region('south andaman', AndamanAndNicobarIslandsMapSvgData.southAndaman));

    andhraPradesh.add(Region('boundary', AndhraPradeshMapSvgData.andhraPradeshBoundary));
    andhraPradesh.add(Region('Anantapur', AndhraPradeshMapSvgData.anantpur));
    andhraPradesh.add(Region('Chittoor', AndhraPradeshMapSvgData.chittoor));
    andhraPradesh.add(Region('East Godavari	Kakinada', AndhraPradeshMapSvgData.eastGodavari));
    andhraPradesh.add(Region('Guntur', AndhraPradeshMapSvgData.guntur));
    andhraPradesh.add(Region('YSR Kadapa district	Kadapa', AndhraPradeshMapSvgData.ysr));
    andhraPradesh.add(Region('Krishna', AndhraPradeshMapSvgData.krishna));
    andhraPradesh.add(Region('Kurnool', AndhraPradeshMapSvgData.kurnool));
    andhraPradesh.add(Region('Nellore', AndhraPradeshMapSvgData.spsNellore));
    andhraPradesh.add(Region('Prakasam	Ongole', AndhraPradeshMapSvgData.prakasam));
    andhraPradesh.add(Region('Srikakulam', AndhraPradeshMapSvgData.srikakulam));
    andhraPradesh.add(Region('Visakhapatnam', AndhraPradeshMapSvgData.vishakapatnam));
    andhraPradesh.add(Region('Vizianagaram', AndhraPradeshMapSvgData.vizianagaram));
    andhraPradesh.add(Region('West Godavari', AndhraPradeshMapSvgData.westGodavari));


    arunachalPradesh.add(Region('boundary', ArunachalPradeshMapSvgData.arunachalPradeshBoundary));
    arunachalPradesh.add(Region('AnjaW', ArunachalPradeshMapSvgData.anjaw));
    arunachalPradesh.add(Region('Changlang', ArunachalPradeshMapSvgData.changlang));
    arunachalPradesh.add(Region('East Kameng', ArunachalPradeshMapSvgData.eastKameng));
    arunachalPradesh.add(Region('East Siang', ArunachalPradeshMapSvgData.eastSiang));
    arunachalPradesh.add(Region('Kamle', ArunachalPradeshMapSvgData.kamle));
    arunachalPradesh.add(Region('kra Daadi', ArunachalPradeshMapSvgData.kraDaadi));
    arunachalPradesh.add(Region('kurung Kumey', ArunachalPradeshMapSvgData.kurungKumey));
    arunachalPradesh.add(Region('Lepa Rada', ArunachalPradeshMapSvgData.lepaRada));
    arunachalPradesh.add(Region('Lohit', ArunachalPradeshMapSvgData.lohit));
    arunachalPradesh.add(Region('Longding', ArunachalPradeshMapSvgData.longding));
    arunachalPradesh.add(Region('Lower Dibang Valley', ArunachalPradeshMapSvgData.lowerDibangValley));
    arunachalPradesh.add(Region('Lower Siang', ArunachalPradeshMapSvgData.lowerSiang));
    arunachalPradesh.add(Region('Lower Subansiri', ArunachalPradeshMapSvgData.lowerSubansiri));
    arunachalPradesh.add(Region('Namsai', ArunachalPradeshMapSvgData.namsai));
    arunachalPradesh.add(Region('Pakkek Kessang', ArunachalPradeshMapSvgData.pakkeKessang));
    arunachalPradesh.add(Region('Papum Pare', ArunachalPradeshMapSvgData.papumPare));
    arunachalPradesh.add(Region('Shi Yomi', ArunachalPradeshMapSvgData.shiYomi));
    arunachalPradesh.add(Region('Siang', ArunachalPradeshMapSvgData.siang));
    arunachalPradesh.add(Region('Tawang', ArunachalPradeshMapSvgData.tawang));
    arunachalPradesh.add(Region('Tirap', ArunachalPradeshMapSvgData.tirap));
    arunachalPradesh.add(Region('Upper Dibang Valley', ArunachalPradeshMapSvgData.upperDibangValley));
    arunachalPradesh.add(Region('Upper Siang', ArunachalPradeshMapSvgData.upperSiang));
    arunachalPradesh.add(Region('Upper Subansiri', ArunachalPradeshMapSvgData.upperSubansiri));
    arunachalPradesh.add(Region('West kameng', ArunachalPradeshMapSvgData.westKameng));
    arunachalPradesh.add(Region('West Siang', ArunachalPradeshMapSvgData.westSiang));

    assam.add(Region('baksa', AssamMapSvgData.baksa));
    assam.add(Region('barpeta', AssamMapSvgData.barpeta));
    assam.add(Region('biswanath', AssamMapSvgData.biswanath));
    assam.add(Region('bongaigaon', AssamMapSvgData.bongaigaon));
    assam.add(Region('cachar', AssamMapSvgData.cachar));
    assam.add(Region('charaideo', AssamMapSvgData.charaideo));
    assam.add(Region('chirang', AssamMapSvgData.chirang));
    assam.add(Region('darrang', AssamMapSvgData.darrang));
    assam.add(Region('dhemaji', AssamMapSvgData.dhemaji));
    assam.add(Region('dhubri', AssamMapSvgData.dhubri));
    assam.add(Region('dibrugarh', AssamMapSvgData.dibrugarh));
    assam.add(Region('dima hasao', AssamMapSvgData.dimaHasao));
    assam.add(Region('goalpara', AssamMapSvgData.goalpara));
    assam.add(Region('golaghat', AssamMapSvgData.golaghat));
    assam.add(Region('hailakandi', AssamMapSvgData.hailakandi));
    assam.add(Region('hojai', AssamMapSvgData.hojai));
    assam.add(Region('jorhat', AssamMapSvgData.jorhat));
    assam.add(Region('kamrup', AssamMapSvgData.kamrup));
    assam.add(Region('kamrup metropolitan', AssamMapSvgData.kamrupMetropolitan));
    assam.add(Region('kabri anglong', AssamMapSvgData.karbiAnglong));
    assam.add(Region('karimganj', AssamMapSvgData.karimganj));
    assam.add(Region('kokrajhar', AssamMapSvgData.kokrajhar));
    assam.add(Region('lakhimpur', AssamMapSvgData.lakhimpur));
    assam.add(Region('majuli', AssamMapSvgData.majuli));
    assam.add(Region('morigaon', AssamMapSvgData.morigaon));
    assam.add(Region('nagaon', AssamMapSvgData.nagaon));
    assam.add(Region('nalbari', AssamMapSvgData.nalbari));
    assam.add(Region('sivasagr', AssamMapSvgData.sivasagar));
    assam.add(Region('sonitpur', AssamMapSvgData.sonitpur));
    assam.add(Region('south salmara manachar', AssamMapSvgData.southSalmaraMancachar));
    assam.add(Region('tinsukia', AssamMapSvgData.tinsukia));
    assam.add(Region('udalguri', AssamMapSvgData.udalguri));
    assam.add(Region('west kabri anglong', AssamMapSvgData.westKarbiAnglong));

    //bihar.add(Region('boundary', BiharMapSvgData.biharBoundary));
    bihar.add(Region('Ararai', BiharMapSvgData.araria));
    bihar.add(Region('Arwal', BiharMapSvgData.arwal));
    bihar.add(Region('Aurangabad', BiharMapSvgData.aurangabad));
    bihar.add(Region('Banka', BiharMapSvgData.banka));
    bihar.add(Region('Begusarai', BiharMapSvgData.begusarai));
    bihar.add(Region('Bhagalpur', BiharMapSvgData.bhagalpur));
    bihar.add(Region('Bhojpur', BiharMapSvgData.bhojpur));
    bihar.add(Region('Buxar', BiharMapSvgData.buxar));
    bihar.add(Region('Darbhanga', BiharMapSvgData.darbhanga));
    bihar.add(Region('East Champaran', BiharMapSvgData.eastChamparan));
    bihar.add(Region('Gaya', BiharMapSvgData.gaya));
    bihar.add(Region('Gopalganj', BiharMapSvgData.gopalganj));
    bihar.add(Region('Jamui', BiharMapSvgData.jamui));
    bihar.add(Region('Jehanabad', BiharMapSvgData.jehanabad));
    bihar.add(Region('Kaimur Bhabhua', BiharMapSvgData.kaimurBhabhua));
    bihar.add(Region('Katihar', BiharMapSvgData.katihar));
    bihar.add(Region('Khagaria', BiharMapSvgData.khagaria));
    bihar.add(Region('Kishanganj', BiharMapSvgData.kishanganj));
    bihar.add(Region('Lakhisarai', BiharMapSvgData.lakhisarai));
    bihar.add(Region('Madhepura', BiharMapSvgData.madhepura));
    bihar.add(Region('Madhubani', BiharMapSvgData.madhubani));
    bihar.add(Region('Munger', BiharMapSvgData.munger));
    bihar.add(Region('Muzaffarpur', BiharMapSvgData.muzaffarpur));
    bihar.add(Region('Nalanda', BiharMapSvgData.nalanda));
    bihar.add(Region('Nawada', BiharMapSvgData.nawada));
    bihar.add(Region('Patna', BiharMapSvgData.patna));
    bihar.add(Region('Purnia', BiharMapSvgData.purnia));
    bihar.add(Region('Rohtas', BiharMapSvgData.rohtas));
    bihar.add(Region('Saharsa', BiharMapSvgData.saharsa));
    bihar.add(Region('Samastipur', BiharMapSvgData.samastipur));
    bihar.add(Region('Saran', BiharMapSvgData.saran));
    bihar.add(Region('Sheikhpur', BiharMapSvgData.sheikhpura));
    bihar.add(Region('Sheohar', BiharMapSvgData.sheohar));
    bihar.add(Region('Sitamarhi', BiharMapSvgData.sitamarhi));
    bihar.add(Region('Siwan', BiharMapSvgData.siwan));
    bihar.add(Region('Supaul', BiharMapSvgData.supaul));
    bihar.add(Region('Vaishali', BiharMapSvgData.vaishali));
    bihar.add(Region('West Champaran', BiharMapSvgData.westChamparan));

    chhattisgarh.add(Region('boundary', ChhattisgarhMapSvgData.chhattisgarhBoundary));
    chhattisgarh.add(Region('Balod', ChhattisgarhMapSvgData.balod));
    chhattisgarh.add(Region('Balod bazar', ChhattisgarhMapSvgData.balodBazar));
    chhattisgarh.add(Region('Balrampur', ChhattisgarhMapSvgData.balrampur));
    chhattisgarh.add(Region('Bastar', ChhattisgarhMapSvgData.bastar));
    chhattisgarh.add(Region('bemetara', ChhattisgarhMapSvgData.bametara));
    chhattisgarh.add(Region('Bijapur', ChhattisgarhMapSvgData.bijapur));
    chhattisgarh.add(Region('Bilaspur', ChhattisgarhMapSvgData.bilaspur));
    chhattisgarh.add(Region('Dantewada', ChhattisgarhMapSvgData.dakshinBastarDantewada));
    chhattisgarh.add(Region('Dhamtari', ChhattisgarhMapSvgData.dhamtari));
    chhattisgarh.add(Region('Durg', ChhattisgarhMapSvgData.durg));
    chhattisgarh.add(Region('Gariaband', ChhattisgarhMapSvgData.gariaband));
    chhattisgarh.add(Region('Janjgir-Champa', ChhattisgarhMapSvgData.janjgirChampa));
    chhattisgarh.add(Region('Jashpur', ChhattisgarhMapSvgData.jashpur));
    chhattisgarh.add(Region('Kabirdham', ChhattisgarhMapSvgData.kabeerdham));
    chhattisgarh.add(Region('Kanker', ChhattisgarhMapSvgData.uttarBastarKanker));
    chhattisgarh.add(Region('Kondagaon', ChhattisgarhMapSvgData.kondagaon));
    chhattisgarh.add(Region('Korba', ChhattisgarhMapSvgData.korba));
    chhattisgarh.add(Region('Koriya', ChhattisgarhMapSvgData.koriya));
    chhattisgarh.add(Region('Mahasamund', ChhattisgarhMapSvgData.mahasamund));
    chhattisgarh.add(Region('Mungeli', ChhattisgarhMapSvgData.mungeli));
    chhattisgarh.add(Region('Narayanpur', ChhattisgarhMapSvgData.narayanpur));
    chhattisgarh.add(Region('Raigarh', ChhattisgarhMapSvgData.raigarh));
    chhattisgarh.add(Region('Raipur', ChhattisgarhMapSvgData.raipur));
    chhattisgarh.add(Region('Rajnandgaon', ChhattisgarhMapSvgData.rajnandgaon));
    chhattisgarh.add(Region('Sukma', ChhattisgarhMapSvgData.sukma));
    chhattisgarh.add(Region('Surajpur', ChhattisgarhMapSvgData.surajpur));
    chhattisgarh.add(Region('Surguja', ChhattisgarhMapSvgData.surguja));

    delhi.add(Region('boundary', DelhiMapSvgData.delhiBoundary));
    delhi.add(Region('Central Delhi',DelhiMapSvgData.centralDelhi));
    delhi.add(Region('East Delhi',DelhiMapSvgData.eastDelhi));
    delhi.add(Region('New Delhi',DelhiMapSvgData.newDelhi));
    delhi.add(Region('North Delhi',DelhiMapSvgData.northDelhi));
    delhi.add(Region('North East Delhi',DelhiMapSvgData.northEastDelhi));
    delhi.add(Region('North West Delhi',DelhiMapSvgData.northWestDelhi));
    delhi.add(Region('Shahdara',DelhiMapSvgData.shahdara));
    delhi.add(Region('South Delhi',DelhiMapSvgData.southDelhi));
    delhi.add(Region('South East Delhi ',DelhiMapSvgData.southEastDelhi));
    delhi.add(Region('South West Delhi',DelhiMapSvgData.southWestDelhi));
    delhi.add(Region('West Delhi',DelhiMapSvgData.westDelhi));

    goa.add(Region('boundary', GoaMapSvgData.goaBoundary));
    goa.add(Region('north goa', GoaMapSvgData.northGoa));
    goa.add(Region('south goa', GoaMapSvgData.southGoa));

    gujarat.add(Region('Ahmadabad',GujaratMapSvgData.ahmedabad));
    gujarat.add(Region('Amreli',GujaratMapSvgData.amreli));
    gujarat.add(Region('Anand',GujaratMapSvgData.anand));
    gujarat.add(Region('Aravalli',GujaratMapSvgData.aravalli));
    gujarat.add(Region('Banas kantha',GujaratMapSvgData.banasKantha)); 
    gujarat.add(Region('Botad',GujaratMapSvgData.botad));
    gujarat.add(Region('Bharuch',GujaratMapSvgData.bharuch));
    gujarat.add(Region('Bhavnagar',GujaratMapSvgData.bhavnagar));
    gujarat.add(Region('Chhota Udaipur',GujaratMapSvgData.chotaUdaipur)); 	 	 
    gujarat.add(Region('Dohad',GujaratMapSvgData.dohad));
    gujarat.add(Region('Devbhoomi Dwarka',GujaratMapSvgData.devbhumiDwarka)); 	 	 
    gujarat.add(Region('Gandhinagar',GujaratMapSvgData.gandhinagar));
    gujarat.add(Region('Gir Somnath',GujaratMapSvgData.girSomnath));
    gujarat.add(Region('Jamnagar',GujaratMapSvgData.jamnagar));
    gujarat.add(Region('Junagadh',GujaratMapSvgData.junagadh));
    gujarat.add(Region('Kheda',GujaratMapSvgData.kheda));
    gujarat.add(Region('Kachchh',GujaratMapSvgData.kachchh)); 	 
    gujarat.add(Region('Mahesana',GujaratMapSvgData.mahesana));
    gujarat.add(Region('Mahisagar',GujaratMapSvgData.mahisagar));	
    gujarat.add(Region('Morbi',GujaratMapSvgData.morbi));	 	 
    gujarat.add(Region('Narmada',GujaratMapSvgData.narmada));
    gujarat.add(Region('Navsari',GujaratMapSvgData.navsari));
    gujarat.add(Region('Panchmahal',GujaratMapSvgData.panchMahal));
    gujarat.add(Region('Patan',GujaratMapSvgData.patan));
    gujarat.add(Region('Porbandar',GujaratMapSvgData.porbandar));
    gujarat.add(Region('Rajkot',GujaratMapSvgData.rajkot));
    gujarat.add(Region('Sabarkantha	Himatnagar',GujaratMapSvgData.sabarKantha));
    gujarat.add(Region('Surat',GujaratMapSvgData.surat));
    gujarat.add(Region('Surendranagar',GujaratMapSvgData.surendranagar));
    gujarat.add(Region('Tapi',GujaratMapSvgData.tapi));
    gujarat.add(Region('The Dangs	Ahwa',GujaratMapSvgData.theDangs));
    gujarat.add(Region('Vadodara',GujaratMapSvgData.vadodhara));
    gujarat.add(Region('Valsad',GujaratMapSvgData.valsad));

    haryana.add(Region('boundary', HaryanaMapSvgData.haryanaBoundary));
    haryana.add(Region('Ambala',HaryanaMapSvgData.ambala));
    haryana.add(Region('Bhiwani',HaryanaMapSvgData.bhiwani));
    haryana.add(Region('Charki Dadri',HaryanaMapSvgData.charkiDadri));
    haryana.add(Region('Faridabad',HaryanaMapSvgData.faridabad));
    haryana.add(Region('Fatehabad',HaryanaMapSvgData.fatehabad));
    haryana.add(Region('Gurugram',HaryanaMapSvgData.gurugram));
    haryana.add(Region('Hisar',HaryanaMapSvgData.hisar));
    haryana.add(Region('Jhajjar',HaryanaMapSvgData.jhajjar));
    haryana.add(Region('Jind',HaryanaMapSvgData.jind));
    haryana.add(Region('Kaithal',HaryanaMapSvgData.kaithal));
    haryana.add(Region('karnal',HaryanaMapSvgData.karnal));
    haryana.add(Region('kurukshetra',HaryanaMapSvgData.kurukshetra));
    haryana.add(Region('Mahebdragarh',HaryanaMapSvgData.mahendragarh));
    haryana.add(Region('Nuh',HaryanaMapSvgData.nuh));
    haryana.add(Region('Palwal',HaryanaMapSvgData.palwal));
    haryana.add(Region('Panchkula',HaryanaMapSvgData.panchkula));
    haryana.add(Region('Panipat',HaryanaMapSvgData.panipat));
    haryana.add(Region('Rewari',HaryanaMapSvgData.rewari));
    haryana.add(Region('Rohtak',HaryanaMapSvgData.rohtak));
    haryana.add(Region('Sirsa',HaryanaMapSvgData.sirsa));
    haryana.add(Region('Sonipat',HaryanaMapSvgData.sonipat));
    haryana.add(Region('YamunanagarS',HaryanaMapSvgData.yamunanagar));
    
    himachalPradesh.add(Region('boundary', HimachalPradeshMapSvgData.himachalPradeshBoundary));
    himachalPradesh.add(Region('Chamba', HimachalPradeshMapSvgData.chamba));
    himachalPradesh.add(Region('Hamirpur', HimachalPradeshMapSvgData.hamirpur));
    himachalPradesh.add(Region('kangra', HimachalPradeshMapSvgData.kangra));
    himachalPradesh.add(Region('Kinnaur', HimachalPradeshMapSvgData.kinnaur));
    himachalPradesh.add(Region('Kullu', HimachalPradeshMapSvgData.kullu));
    himachalPradesh.add(Region('Lahul And Spiti', HimachalPradeshMapSvgData.lahulAndSpiti));
    himachalPradesh.add(Region('Mandi', HimachalPradeshMapSvgData.mandi));
    himachalPradesh.add(Region('Shimla', HimachalPradeshMapSvgData.shimla));
    himachalPradesh.add(Region('Sirmaur', HimachalPradeshMapSvgData.sirmaur));
    himachalPradesh.add(Region('Solan', HimachalPradeshMapSvgData.solan));
    himachalPradesh.add(Region('Una', HimachalPradeshMapSvgData.una));
    himachalPradesh.add(Region('Bilaspur', HimachalPradeshMapSvgData.bilaspur));

    jammuAndKashmir.add(Region('boundary', JammuAndKashmirMapSvgData.jammuAndKashmirBoundary));
    jammuAndKashmir.add(Region('Anantnag',JammuAndKashmirMapSvgData.anantnag));
    jammuAndKashmir.add(Region('Badgam',JammuAndKashmirMapSvgData.badgam));
    jammuAndKashmir.add(Region('Bandipore',JammuAndKashmirMapSvgData.bandipore));
    jammuAndKashmir.add(Region('Baramula',JammuAndKashmirMapSvgData.baramula));
    jammuAndKashmir.add(Region('Doda',JammuAndKashmirMapSvgData.doda));
    jammuAndKashmir.add(Region('Ganderbal',JammuAndKashmirMapSvgData.ganderbal));
    jammuAndKashmir.add(Region('Jamu',JammuAndKashmirMapSvgData.jammu));
    jammuAndKashmir.add(Region('Kathua',JammuAndKashmirMapSvgData.kathua));
    jammuAndKashmir.add(Region('Kishtwar',JammuAndKashmirMapSvgData.kishtwar));
    jammuAndKashmir.add(Region('Kulgam',JammuAndKashmirMapSvgData.kulgam));
    jammuAndKashmir.add(Region('Kupwara',JammuAndKashmirMapSvgData.kupwara));
    jammuAndKashmir.add(Region('Mirpur',JammuAndKashmirMapSvgData.mirpur));
    jammuAndKashmir.add(Region('Muzaffarabad',JammuAndKashmirMapSvgData.muzaffarabad));
    jammuAndKashmir.add(Region('Pulwama',JammuAndKashmirMapSvgData.pulwama));
    jammuAndKashmir.add(Region('Punch',JammuAndKashmirMapSvgData.punch));
    jammuAndKashmir.add(Region('Rajouri',JammuAndKashmirMapSvgData.rajouri));
    jammuAndKashmir.add(Region('Ramban',JammuAndKashmirMapSvgData.ramban));
    jammuAndKashmir.add(Region('Reasi',JammuAndKashmirMapSvgData.reasi));
    jammuAndKashmir.add(Region('Samba',JammuAndKashmirMapSvgData.samba));
    jammuAndKashmir.add(Region('Shupiyan',JammuAndKashmirMapSvgData.shupiyan));
    jammuAndKashmir.add(Region('Srinagar',JammuAndKashmirMapSvgData.srinagar));
    jammuAndKashmir.add(Region('Udhampur',JammuAndKashmirMapSvgData.udhampur));

    jharkhand.add(Region('boundary', JharkhandMapSvgData.jharkhandBoundary));
    jharkhand.add(Region('ranchi', JharkhandMapSvgData.ranchi));
    jharkhand.add(Region('dhanbad', JharkhandMapSvgData.dhanbad));
    jharkhand.add(Region('giridih', JharkhandMapSvgData.giridih));
    jharkhand.add(Region('east singhbhum', JharkhandMapSvgData.purbiSinghbhum));
    jharkhand.add(Region('bokaro', JharkhandMapSvgData.bokaro));
    jharkhand.add(Region('palamu', JharkhandMapSvgData.palamu));
    jharkhand.add(Region('hazaribagh', JharkhandMapSvgData.hazaribagh));
    jharkhand.add(Region('west singhbhum', JharkhandMapSvgData.paschimiSinghbhum));
    jharkhand.add(Region('deoghar', JharkhandMapSvgData.deoghar));
    jharkhand.add(Region('garhwa', JharkhandMapSvgData.garhwa));
    jharkhand.add(Region('dumka', JharkhandMapSvgData.dumka));
    jharkhand.add(Region('godda', JharkhandMapSvgData.godda));
    jharkhand.add(Region('sahibganj', JharkhandMapSvgData.sahibganj));
    jharkhand.add(Region('saraikela-kharsawan', JharkhandMapSvgData.saraikelaKharsawan));
    jharkhand.add(Region('chatra', JharkhandMapSvgData.chatra));
    jharkhand.add(Region('gumla', JharkhandMapSvgData.gumla));
    jharkhand.add(Region('ramgarh', JharkhandMapSvgData.ramgarh));
    jharkhand.add(Region('pakur', JharkhandMapSvgData.pakur));
    jharkhand.add(Region('jamtara', JharkhandMapSvgData.jamtara));
    jharkhand.add(Region('latehar', JharkhandMapSvgData.latehar));
    jharkhand.add(Region('kodarma', JharkhandMapSvgData.kodarma));
    jharkhand.add(Region('simdega', JharkhandMapSvgData.simdega));
    jharkhand.add(Region('khunti', JharkhandMapSvgData.khunti));
    jharkhand.add(Region('lohardaga', JharkhandMapSvgData.lohardaga));

    //karnataka.add(Region('boundary', KarnatakaMapSvgData.karnatakaBoundary));
    karnataka.add(Region('bagalkote', KarnatakaMapSvgData.bagalkote));
    karnataka.add(Region('ballari', KarnatakaMapSvgData.ballari));
    karnataka.add(Region('belagavi', KarnatakaMapSvgData.belagavi));
    karnataka.add(Region('bengaluru', KarnatakaMapSvgData.bengaluru));
    karnataka.add(Region('bengaluru rural', KarnatakaMapSvgData.bengaluruRural));
    karnataka.add(Region('bidar', KarnatakaMapSvgData.bidar));
    karnataka.add(Region('chamarajanagara', KarnatakaMapSvgData.chamarajanagara));
    karnataka.add(Region('chikkaballapura', KarnatakaMapSvgData.chikkaballapura));
    karnataka.add(Region('chikkamagaluru', KarnatakaMapSvgData.chikkamagaluru));
    karnataka.add(Region('chitradurga', KarnatakaMapSvgData.chitradurga));
    karnataka.add(Region('darkshina kannada', KarnatakaMapSvgData.dakshinaKannada));
    karnataka.add(Region('devanagree', KarnatakaMapSvgData.davanageree));
    karnataka.add(Region('dharwad', KarnatakaMapSvgData.dharwad));
    karnataka.add(Region('gadag', KarnatakaMapSvgData.gadag));
    karnataka.add(Region('hassan', KarnatakaMapSvgData.hassan));
    karnataka.add(Region('haveri', KarnatakaMapSvgData.haveri));
    karnataka.add(Region('kalaburagi', KarnatakaMapSvgData.kalaburagi));
    karnataka.add(Region('kodagu', KarnatakaMapSvgData.kodagu));
    karnataka.add(Region('kolar', KarnatakaMapSvgData.kolar));
    karnataka.add(Region('koppal', KarnatakaMapSvgData.koppal));
    karnataka.add(Region('mandya', KarnatakaMapSvgData.mandya));
    karnataka.add(Region('mysuru', KarnatakaMapSvgData.mysuru));
    karnataka.add(Region('raichur', KarnatakaMapSvgData.raichur));
    karnataka.add(Region('ramanagara', KarnatakaMapSvgData.ramanagara));
    karnataka.add(Region('shivamogga', KarnatakaMapSvgData.shivamogga));
    karnataka.add(Region('tumakuru', KarnatakaMapSvgData.tumakuru));
    karnataka.add(Region('udupi', KarnatakaMapSvgData.udupi));
    karnataka.add(Region('uttara kannada', KarnatakaMapSvgData.uttaraKannada));
    karnataka.add(Region('vijaypura', KarnatakaMapSvgData.vijaypura));
    karnataka.add(Region('yadgir', KarnatakaMapSvgData.yadgir));

    kerala.add(Region('boundary', KeralaMapSvgData.keralaBoundary));
    kerala.add(Region('Alappuzha', KeralaMapSvgData.alappuzha));
    kerala.add(Region('Ernakulam', KeralaMapSvgData.ernakulam));
    kerala.add(Region('Idukki', KeralaMapSvgData.idukki));
    kerala.add(Region('Kannur', KeralaMapSvgData.kannur));
    kerala.add(Region('Kasaragod', KeralaMapSvgData.kasaragod));
    kerala.add(Region('Kollam', KeralaMapSvgData.kollam));
    kerala.add(Region('Kottayam', KeralaMapSvgData.kottayam));
    kerala.add(Region('Kozhikode', KeralaMapSvgData.kozhikode));
    kerala.add(Region('Malappuram', KeralaMapSvgData.malappuram));
    kerala.add(Region('Palakkad', KeralaMapSvgData.palakkad));
    kerala.add(Region('Pathanamthitta', KeralaMapSvgData.pathanamthitta));
    kerala.add(Region('Thiruvananthapuram', KeralaMapSvgData.thiruvanathpuram));
    kerala.add(Region('Thrissur', KeralaMapSvgData.thrissur));
    kerala.add(Region('Wayanad', KeralaMapSvgData.wayanad));

    ladakh.add(Region('boundary', LadakhMapSvgData.ladakhBoundary));
    ladakh.add(Region('Leh', LadakhMapSvgData.leh));
    ladakh.add(Region('Kargil', LadakhMapSvgData.kargil));

    //madhyaPradesh.add(Region('bounary', MadhyaPradeshMapSvgData.madhyaPradeshBoundary));
    madhyaPradesh.add(Region('Agar Malwa', MadhyaPradeshMapSvgData.agarMalwa));
    madhyaPradesh.add(Region('Alirajpur', MadhyaPradeshMapSvgData.alirajpur));
    madhyaPradesh.add(Region('Anuppur', MadhyaPradeshMapSvgData.anupur));
    madhyaPradesh.add(Region('Ashoknagar', MadhyaPradeshMapSvgData.ashoknagar));
    madhyaPradesh.add(Region('Balaghat', MadhyaPradeshMapSvgData.balaghat));
    madhyaPradesh.add(Region('Barwani', MadhyaPradeshMapSvgData.barwari));
    madhyaPradesh.add(Region('Betul', MadhyaPradeshMapSvgData.betul));
    madhyaPradesh.add(Region('Bhind', MadhyaPradeshMapSvgData.bhind));
    madhyaPradesh.add(Region('Bhopal', MadhyaPradeshMapSvgData.bhopal));
    madhyaPradesh.add(Region('Burhanpur', MadhyaPradeshMapSvgData.bhopal));
    madhyaPradesh.add(Region('Chhatarpur', MadhyaPradeshMapSvgData.chhatarpur));
    madhyaPradesh.add(Region('Chhindwara', MadhyaPradeshMapSvgData.chhindwara));
    madhyaPradesh.add(Region('Damoh', MadhyaPradeshMapSvgData.damoh));
    madhyaPradesh.add(Region('Datia', MadhyaPradeshMapSvgData.datia));
    madhyaPradesh.add(Region('Dewas', MadhyaPradeshMapSvgData.dewas));
    madhyaPradesh.add(Region('Dhar', MadhyaPradeshMapSvgData.dhar));
    madhyaPradesh.add(Region('Dindori', MadhyaPradeshMapSvgData.dindori));
    madhyaPradesh.add(Region('Katni', MadhyaPradeshMapSvgData.katni));
    madhyaPradesh.add(Region('Khandwa', MadhyaPradeshMapSvgData.khandwa));
    madhyaPradesh.add(Region('Khargone', MadhyaPradeshMapSvgData.khargone));
    madhyaPradesh.add(Region('Guna', MadhyaPradeshMapSvgData.guna));
    madhyaPradesh.add(Region('Gwalior', MadhyaPradeshMapSvgData.gwalior));
    madhyaPradesh.add(Region('Harda', MadhyaPradeshMapSvgData.harda));
    madhyaPradesh.add(Region('Hoshangabad', MadhyaPradeshMapSvgData.hoshangabad));
    madhyaPradesh.add(Region('Indore', MadhyaPradeshMapSvgData.indore));
    madhyaPradesh.add(Region('Jabalpur', MadhyaPradeshMapSvgData.jabalpur));
    madhyaPradesh.add(Region('Jhabua', MadhyaPradeshMapSvgData.jhabua));
    madhyaPradesh.add(Region('Mandla', MadhyaPradeshMapSvgData.mandla));
    madhyaPradesh.add(Region('Mandsaur', MadhyaPradeshMapSvgData.mandsaur));
    madhyaPradesh.add(Region('Morena', MadhyaPradeshMapSvgData.morena));
    madhyaPradesh.add(Region('Narsinghpur', MadhyaPradeshMapSvgData.narsimhapur));
    madhyaPradesh.add(Region('Neemuch', MadhyaPradeshMapSvgData.neemuch));
    madhyaPradesh.add(Region('Niwari', MadhyaPradeshMapSvgData.niwari));
    madhyaPradesh.add(Region('Panna', MadhyaPradeshMapSvgData.panna));
    madhyaPradesh.add(Region('Raisen', MadhyaPradeshMapSvgData.raisen));
    madhyaPradesh.add(Region('Rajgarh', MadhyaPradeshMapSvgData.rajgarh));
    madhyaPradesh.add(Region('Ratlam', MadhyaPradeshMapSvgData.ratlam));
    madhyaPradesh.add(Region('Rewa', MadhyaPradeshMapSvgData.rewa));
    madhyaPradesh.add(Region('Sagar', MadhyaPradeshMapSvgData.sagar));
    madhyaPradesh.add(Region('Satna', MadhyaPradeshMapSvgData.satna));
    madhyaPradesh.add(Region('Sehore', MadhyaPradeshMapSvgData.sehore));
    madhyaPradesh.add(Region('Seoni', MadhyaPradeshMapSvgData.seoni));
    madhyaPradesh.add(Region('Shahdol', MadhyaPradeshMapSvgData.shahdol));
    madhyaPradesh.add(Region('Shajapur', MadhyaPradeshMapSvgData.shajapur));
    madhyaPradesh.add(Region('Sheopur', MadhyaPradeshMapSvgData.sheopur));
    madhyaPradesh.add(Region('Shivpuri', MadhyaPradeshMapSvgData.shivpuri));
    madhyaPradesh.add(Region('Sidhi', MadhyaPradeshMapSvgData.sidhi));
    madhyaPradesh.add(Region('Singrauli', MadhyaPradeshMapSvgData.singrauli));
    madhyaPradesh.add(Region('Tikamgarh', MadhyaPradeshMapSvgData.tikamgarh));
    madhyaPradesh.add(Region('Ujjain', MadhyaPradeshMapSvgData.ujjain));
    madhyaPradesh.add(Region('Umaria', MadhyaPradeshMapSvgData.umaria));
    madhyaPradesh.add(Region('Vidisha', MadhyaPradeshMapSvgData.vidisha));

    maharashtra.add(Region('ahmad', MaharashtraMapSvgData.ahmadnagar));
    maharashtra.add(Region('akola', MaharashtraMapSvgData.akola));
    maharashtra.add(Region('amravati', MaharashtraMapSvgData.amravati));
    maharashtra.add(Region('aurangabad', MaharashtraMapSvgData.aurangabad));
    maharashtra.add(Region('bhandra', MaharashtraMapSvgData.bhandra));
    maharashtra.add(Region('bid', MaharashtraMapSvgData.bid));
    maharashtra.add(Region('buldana', MaharashtraMapSvgData.buldana));
    maharashtra.add(Region('chandrapur', MaharashtraMapSvgData.chandrapur));
    maharashtra.add(Region('dhule', MaharashtraMapSvgData.dhule));
    maharashtra.add(Region('hingoli', MaharashtraMapSvgData.hingoli));
    maharashtra.add(Region('jalgaon', MaharashtraMapSvgData.jalgaon));
    maharashtra.add(Region('jalna', MaharashtraMapSvgData.jalna));
    maharashtra.add(Region('kolhapur', MaharashtraMapSvgData.kolhapur));
    maharashtra.add(Region('latur', MaharashtraMapSvgData.latur));
    maharashtra.add(Region('mumbai', MaharashtraMapSvgData.mumbai));
    maharashtra.add(Region('mumbai suburban', MaharashtraMapSvgData.mumbaiSuburban));
    maharashtra.add(Region('nagpur', MaharashtraMapSvgData.nagpur));
    maharashtra.add(Region('nanded', MaharashtraMapSvgData.nanded));
    maharashtra.add(Region('nandurbar', MaharashtraMapSvgData.nandurbar));
    maharashtra.add(Region('nashik', MaharashtraMapSvgData.nashik));
    maharashtra.add(Region('osmanabad', MaharashtraMapSvgData.osmanabad));
    maharashtra.add(Region('palghar', MaharashtraMapSvgData.palghar));
    maharashtra.add(Region('parbhani', MaharashtraMapSvgData.parbhani));
    maharashtra.add(Region('pune', MaharashtraMapSvgData.pune));
    maharashtra.add(Region('raigarh', MaharashtraMapSvgData.raigarh));
    maharashtra.add(Region('ratnagiri', MaharashtraMapSvgData.ratnagiri));
    maharashtra.add(Region('sangli', MaharashtraMapSvgData.sangli));
    maharashtra.add(Region('satara', MaharashtraMapSvgData.satara));
    maharashtra.add(Region('sindhudurg', MaharashtraMapSvgData.sindhudurg));
    maharashtra.add(Region('solapur', MaharashtraMapSvgData.solapur));
    maharashtra.add(Region('thane', MaharashtraMapSvgData.thane));
    maharashtra.add(Region('wardha', MaharashtraMapSvgData.wardha));
    maharashtra.add(Region('washim', MaharashtraMapSvgData.washim));
    maharashtra.add(Region('yavatmal', MaharashtraMapSvgData.yavatmal));
    

    manipur.add(Region('boundary',  ManipurMapSvgData. manipurBoundary));
    manipur.add(Region('Bishnupur', ManipurMapSvgData.bishnupur));
    manipur.add(Region('Churachandpur', ManipurMapSvgData.churachandpur));
    manipur.add(Region('Chandel', ManipurMapSvgData.chandel));
    manipur.add(Region('Imphal East', ManipurMapSvgData.imphalEast));
    manipur.add(Region('Imphal West', ManipurMapSvgData.imphalWest));
    manipur.add(Region('Jiribam', ManipurMapSvgData.jiribam));
    manipur.add(Region('Kakching', ManipurMapSvgData.kakching));
    manipur.add(Region('Kamjong', ManipurMapSvgData.kamjong));
    manipur.add(Region('Kangpokpi', ManipurMapSvgData.kangpokpi));
    manipur.add(Region('Noney', ManipurMapSvgData.noney));
    manipur.add(Region('Pherzawl', ManipurMapSvgData.pherzawl));
    manipur.add(Region('Senapati', ManipurMapSvgData.senapati));
    manipur.add(Region('Tamenglong', ManipurMapSvgData.tamenglong));
    manipur.add(Region('Tengnoupal', ManipurMapSvgData.tengnoupal));
    manipur.add(Region('Thoubal', ManipurMapSvgData.thoubal));
    manipur.add(Region('Ukhrul', ManipurMapSvgData.ukhrul));

    mizoram.add(Region('boundary', MizoramMapSvgData.mizoramBoundary));
    mizoram.add(Region('Aizawl', MizoramMapSvgData.aizawl));
    mizoram.add(Region('Champhai', MizoramMapSvgData.champhai));
    mizoram.add(Region('Hnahthial', MizoramMapSvgData.hnahthial));
    mizoram.add(Region('Khawzawl', MizoramMapSvgData.khawzawl));
    mizoram.add(Region('Kolasib', MizoramMapSvgData.kolasib));
    mizoram.add(Region('Lawngtlai', MizoramMapSvgData.lawngtlai));
    mizoram.add(Region('Lunglei', MizoramMapSvgData.lunglei));
    mizoram.add(Region('Mamit', MizoramMapSvgData.mamit));
    mizoram.add(Region('Saiha', MizoramMapSvgData.saiha));
    mizoram.add(Region('Serchhip', MizoramMapSvgData.serchhip));

    meghalaya.add(Region('boundary', MeghalayaMapSvgData.meghalayaBoundary));
    meghalaya.add(Region('East Garo Hills',MeghalayaMapSvgData.eastGaroHills));
    meghalaya.add(Region('East Jaint Hills',MeghalayaMapSvgData.eastJaintiaHills));
    meghalaya.add(Region('East khasi Hills',MeghalayaMapSvgData.eastKhasiHills));
    meghalaya.add(Region('North garo Hills',MeghalayaMapSvgData.northGaroHills));
    meghalaya.add(Region('Ribhoi',MeghalayaMapSvgData.ribhoi));
    meghalaya.add(Region('South Garo Hills',MeghalayaMapSvgData.southGaroHills));
    meghalaya.add(Region('South West Garo Hills',MeghalayaMapSvgData.southWestGaroHills));
    meghalaya.add(Region('South Wesh Khasi Hills',MeghalayaMapSvgData.southWestKhasiHills));
    meghalaya.add(Region('West garo Hills',MeghalayaMapSvgData.westGaroHills));
    meghalaya.add(Region('West Jaintia Hills',MeghalayaMapSvgData.westJaintiaHills));
    meghalaya.add(Region('West Khasi Hills',MeghalayaMapSvgData.westKhasiHills));

    nagaland.add(Region('boundary', NagalandMapSvgData.nagalandBoundary));
    nagaland.add(Region('Dimapur', NagalandMapSvgData.dimapur));
    nagaland.add(Region('Kiphire', NagalandMapSvgData.kiphire));
    nagaland.add(Region('Kohima', NagalandMapSvgData.kohima));
    nagaland.add(Region('Longleng', NagalandMapSvgData.longleng));
    nagaland.add(Region('Mokokchung', NagalandMapSvgData.mokokchung));
    nagaland.add(Region('Mon', NagalandMapSvgData.mon));
    nagaland.add(Region('Peren', NagalandMapSvgData.peren));
    nagaland.add(Region('Phek', NagalandMapSvgData.phek));
    nagaland.add(Region('Tuensang', NagalandMapSvgData.tuensang));
    nagaland.add(Region('Wokha', NagalandMapSvgData.wokha));
    nagaland.add(Region('Zunheboto', NagalandMapSvgData.zunheboto));

    odisha.add(Region('Malkangiri', OdishaMapSvgData.malkangiri));
    odisha.add(Region('Koraput',OdishaMapSvgData.koraput));
    odisha.add(Region('Kalahandi',OdishaMapSvgData.kalahandi));
    odisha.add(Region('Nabarangapur', OdishaMapSvgData.nabarangapur));
    odisha.add(Region('Nuapanda', OdishaMapSvgData.nuapanda));
    odisha.add(Region('Kandhmal', OdishaMapSvgData.kandhamal));
    odisha.add(Region('Kendrapara', OdishaMapSvgData.kendrapara));
    odisha.add(Region('Kendujhar', OdishaMapSvgData.kendujhar));
    odisha.add(Region('Khordha', OdishaMapSvgData.khurda));
    odisha.add(Region('Mayurbhanj', OdishaMapSvgData.mayurbhanj));
    odisha.add(Region('Nayagarh', OdishaMapSvgData.nayagarh));
    odisha.add(Region('Puri', OdishaMapSvgData.puri));
    odisha.add(Region('Rayagada', OdishaMapSvgData.rayagada));
    odisha.add(Region('Sambalpur', OdishaMapSvgData.sambalpur));
    odisha.add(Region('Subarnapur', OdishaMapSvgData.subarnapur));
    odisha.add(Region('Sundargarh', OdishaMapSvgData.sundargarh));
    odisha.add(Region('Anugul', OdishaMapSvgData.anugul));
    odisha.add(Region('Balangir', OdishaMapSvgData.balangir));
    odisha.add(Region('Baleshwar', OdishaMapSvgData.baleshwar));
    odisha.add(Region('bargarh', OdishaMapSvgData.bargarh));
    odisha.add(Region('Baudh', OdishaMapSvgData.baudh));
    odisha.add(Region('Bhadrak', OdishaMapSvgData.bhadrak));
    odisha.add(Region('Cuttack', OdishaMapSvgData.cuttack));
    odisha.add(Region('Debagarh', OdishaMapSvgData.debagarh));
    odisha.add(Region('Dhenkanal', OdishaMapSvgData.dhenkanal));
    odisha.add(Region('Gajapati', OdishaMapSvgData.gajapati));
    odisha.add(Region('Ganjam', OdishaMapSvgData.ganjam));
    odisha.add(Region('Jagatsinghpur', OdishaMapSvgData.jagatsinghpur));
    odisha.add(Region('Jajpur', OdishaMapSvgData.jajapur));
    odisha.add(Region('Jharsuguda', OdishaMapSvgData.jharsuguda));

    puducherry.add(Region('boundary', PuducherryMapSvgData.puducherryBoundary));

    punjab.add(Region('boundary', PunjabMapSvgData.punjabBoundary));
    punjab.add(Region('Amritsar',PunjabMapSvgData.amritsar));
    punjab.add(Region('Barnala',PunjabMapSvgData.barnala));
    punjab.add(Region('Bathinda',PunjabMapSvgData.bathinda));
    punjab.add(Region('Faridkot',PunjabMapSvgData.faridkot));
    punjab.add(Region('Fatehgarh Sahib',PunjabMapSvgData.fatehgarhSahib));
    punjab.add(Region('Fazilka',PunjabMapSvgData.fazilka));
    punjab.add(Region('Firozpur',PunjabMapSvgData.firozpur));
    punjab.add(Region('Gurdaspur',PunjabMapSvgData.gurdaspur));
    punjab.add(Region('Hoshiarpur',PunjabMapSvgData.hoshiarpur));
    punjab.add(Region('Jalandar',PunjabMapSvgData.jalandar));
    punjab.add(Region('Kapurthala',PunjabMapSvgData.kapurthala));
    punjab.add(Region('Ludhiana',PunjabMapSvgData.ludhiana));
    punjab.add(Region('Mansa',PunjabMapSvgData.mansa));
    punjab.add(Region('Moga',PunjabMapSvgData.moga));
    punjab.add(Region('Pathankot',PunjabMapSvgData.pathankot));
    punjab.add(Region('Patiala',PunjabMapSvgData.patiala));
    punjab.add(Region('Rupnagar',PunjabMapSvgData.rupnagar));
    punjab.add(Region('Sangrur',PunjabMapSvgData.sangrur));
    punjab.add(Region('S.A.S Nagar',PunjabMapSvgData.sasNagar));
    punjab.add(Region('Shahid Bhagat Singh Nagar',PunjabMapSvgData.shahidBhagatSinghNagar));
    punjab.add(Region('Sri Muktsar Sahib',PunjabMapSvgData.sriMuktsarSahib));
    punjab.add(Region('Tan Taran',PunjabMapSvgData.tanTaran));

    rajasthan.add(Region('ajmer', RajasthanMapSvgData.ajmer));
    rajasthan.add(Region('alwar', RajasthanMapSvgData.alwar));
    rajasthan.add(Region('banswara', RajasthanMapSvgData.banswara));
    rajasthan.add(Region('baran', RajasthanMapSvgData.baran));
    rajasthan.add(Region('barmer', RajasthanMapSvgData.barmer));
    rajasthan.add(Region('bharatpur', RajasthanMapSvgData.bharatpur));
    rajasthan.add(Region('bhilwara', RajasthanMapSvgData.bhilwara));
    rajasthan.add(Region('bikaner', RajasthanMapSvgData.bikaner));
    rajasthan.add(Region('bundi', RajasthanMapSvgData.bundi));
    rajasthan.add(Region('chittaurgarh', RajasthanMapSvgData.chittaurgarh));
    rajasthan.add(Region('churu', RajasthanMapSvgData.churu));
    rajasthan.add(Region('dausa', RajasthanMapSvgData.dausa));
    rajasthan.add(Region('dhaulpur', RajasthanMapSvgData.dhaulpur));
    rajasthan.add(Region('dungarpur', RajasthanMapSvgData.dungarpur));
    rajasthan.add(Region('ganganagar', RajasthanMapSvgData.ganganagar));
    rajasthan.add(Region('hanumangarh', RajasthanMapSvgData.hanumangarh));
    rajasthan.add(Region('jaipur', RajasthanMapSvgData.jaipur));
    rajasthan.add(Region('jaisalmer', RajasthanMapSvgData.jaisalmer));
    rajasthan.add(Region('jalor', RajasthanMapSvgData.jalor));
    rajasthan.add(Region('jhalwar', RajasthanMapSvgData.jhalawar));
    rajasthan.add(Region('jhunjhunu', RajasthanMapSvgData.jhunjhunu));
    rajasthan.add(Region('jodhpur', RajasthanMapSvgData.jodhpur));
    rajasthan.add(Region('karauli', RajasthanMapSvgData.karauli));
    rajasthan.add(Region('kota', RajasthanMapSvgData.kota));
    rajasthan.add(Region('nagaur', RajasthanMapSvgData.nagaur));
    rajasthan.add(Region('pali', RajasthanMapSvgData.pali));
    rajasthan.add(Region('pratapgarh', RajasthanMapSvgData.pratapgarh));
    rajasthan.add(Region('rajsamand', RajasthanMapSvgData.rajsamand));
    rajasthan.add(Region('sawai Madhopur', RajasthanMapSvgData.sawaiMadhopur));
    rajasthan.add(Region('sikar', RajasthanMapSvgData.sikar));
    rajasthan.add(Region('sirohi', RajasthanMapSvgData.sirohi));
    rajasthan.add(Region('tonk', RajasthanMapSvgData.tonk));
    rajasthan.add(Region('udaipur', RajasthanMapSvgData.udaipur));

    sikkim.add(Region('boundary',  SikkimMapSvgData. sikkimBoundary));
    sikkim.add(Region('East District', SikkimMapSvgData.eastDistrict));
    sikkim.add(Region('North District', SikkimMapSvgData.northDistrict));
    sikkim.add(Region('South District', SikkimMapSvgData.southDistrict));
    sikkim.add(Region('West District', SikkimMapSvgData.westDistrict));

    tamilNadu.add(Region('boundary', TamilNaduMapSvgData.tamilNaduBoundary));
    tamilNadu.add(Region('Ariyalur', TamilNaduMapSvgData.ariyalur));
    tamilNadu.add(Region('Chengalpattu', TamilNaduMapSvgData.chengalpattu));
    tamilNadu.add(Region('Chennai', TamilNaduMapSvgData.chennai));
    tamilNadu.add(Region('Coimbatore', TamilNaduMapSvgData.coimbatore));
    tamilNadu.add(Region('Cuddalore', TamilNaduMapSvgData.cuddalore));
    tamilNadu.add(Region('Dharmapuri', TamilNaduMapSvgData.dharmapuri));
    tamilNadu.add(Region('Dindigul', TamilNaduMapSvgData.dindigul));
    tamilNadu.add(Region('Erode', TamilNaduMapSvgData.erode));
    tamilNadu.add(Region('Kallakurichi', TamilNaduMapSvgData.kallakurichi));
    tamilNadu.add(Region('Kancheepuram', TamilNaduMapSvgData.kancheepuram));
    tamilNadu.add(Region('Karur', TamilNaduMapSvgData.karur));
    tamilNadu.add(Region('Krishnagiri', TamilNaduMapSvgData.krishnagiri));
    tamilNadu.add(Region('Madurai', TamilNaduMapSvgData.madurai));
    tamilNadu.add(Region('Nagapattinam', TamilNaduMapSvgData.nagapattinam));
    tamilNadu.add(Region('Kanyakumari', TamilNaduMapSvgData.kanniyakumari));
    tamilNadu.add(Region('Namakkal', TamilNaduMapSvgData.namakkal));
    tamilNadu.add(Region('Perambalur', TamilNaduMapSvgData.perambalur));
    tamilNadu.add(Region('Pudukottai', TamilNaduMapSvgData.pudukkottai));
    tamilNadu.add(Region('Ramanathapuram', TamilNaduMapSvgData.ramnathapuram));
    tamilNadu.add(Region('Ranipet', TamilNaduMapSvgData.ranipet));
    tamilNadu.add(Region('Salem', TamilNaduMapSvgData.salem));
    tamilNadu.add(Region('Sivagangai', TamilNaduMapSvgData.sivaganga));
    tamilNadu.add(Region('Tenkasi', TamilNaduMapSvgData.tenkasi));
    tamilNadu.add(Region('Thanjavur', TamilNaduMapSvgData.thanjavur));
    tamilNadu.add(Region('Theni', TamilNaduMapSvgData.theni));
    tamilNadu.add(Region('Thiruvallur', TamilNaduMapSvgData.thiruvallur));
    tamilNadu.add(Region('Thiruvarur', TamilNaduMapSvgData.thiruvarur));
    tamilNadu.add(Region('TuticorinThoothukudi', TamilNaduMapSvgData.thoothukkudi));
    tamilNadu.add(Region('Trichirappalli', TamilNaduMapSvgData.tiruchirappalli));
    tamilNadu.add(Region('Thirunelveli', TamilNaduMapSvgData.tirunelveli));
    tamilNadu.add(Region('Tirupattur', TamilNaduMapSvgData.tirupathur));
    tamilNadu.add(Region('Tiruppur', TamilNaduMapSvgData.tiruppur));
    tamilNadu.add(Region('Thiruvannamalai', TamilNaduMapSvgData.tiruvannamelai));
    tamilNadu.add(Region('The Nilgiris', TamilNaduMapSvgData.theNilgiris));
    tamilNadu.add(Region('Vellore', TamilNaduMapSvgData.vellore));
    tamilNadu.add(Region('Viluppuram', TamilNaduMapSvgData.viluppuram));
    tamilNadu.add(Region('Virudhunagar', TamilNaduMapSvgData.virudhnagar));

    telangana.add(Region('boundary', TelanganaMapSvgData.telanganaBoundary));
    telangana.add(Region('Adilabad', TelanganaMapSvgData.adilabad));
    telangana.add(Region('Bhadradri Kothagudem', TelanganaMapSvgData.bhadradriKothagudem));
    telangana.add(Region('Hyderabad', TelanganaMapSvgData.hyderabad));
    telangana.add(Region('jagitial', TelanganaMapSvgData.jagitial));
    telangana.add(Region('Jangaon', TelanganaMapSvgData.janagaon));
    telangana.add(Region('Jayashankar', TelanganaMapSvgData.jayashankar));
    telangana.add(Region('Jogulamba Gadwal', TelanganaMapSvgData.jogulambaGadwal));
    telangana.add(Region('Kamareddy', TelanganaMapSvgData.kamareddy));
    telangana.add(Region('Karimnagar', TelanganaMapSvgData.karimnagar));
    telangana.add(Region('Khammam', TelanganaMapSvgData.khammam));
    telangana.add(Region('Komaram Bheem	Asifabad', TelanganaMapSvgData.kumuramBheemAsifabad));
    telangana.add(Region('Mahabubabad', TelanganaMapSvgData.mahbubabad));
    telangana.add(Region('Mahabubnagar', TelanganaMapSvgData.mahbubnagar));
    telangana.add(Region('Mancherial', TelanganaMapSvgData.mancherial));
    telangana.add(Region('Medak', TelanganaMapSvgData.medak));
    telangana.add(Region('Malkajgiri', TelanganaMapSvgData.malkajgiri));
    telangana.add(Region('Mulugu', TelanganaMapSvgData.mulugu));
    telangana.add(Region('Nagarkurnool', TelanganaMapSvgData.nagarkurnool));
    telangana.add(Region('Narayanpe', TelanganaMapSvgData.narayanpet));
    telangana.add(Region('Nalgonda', TelanganaMapSvgData.nalgonda));
    telangana.add(Region('Nirmal', TelanganaMapSvgData.nirmal));
    telangana.add(Region('Nizamabad', TelanganaMapSvgData.nizamabad));
    telangana.add(Region('Peddapalli', TelanganaMapSvgData.peddapalli));
    telangana.add(Region('Rajanna', TelanganaMapSvgData.rajanna));
    telangana.add(Region('Ranga Reddy	Shamshabad', TelanganaMapSvgData.rangareddy));
    telangana.add(Region('Sangareddy	Sangareddy', TelanganaMapSvgData.sangareddy));
    telangana.add(Region('Siddipet', TelanganaMapSvgData.siddipet));
    telangana.add(Region('Suryapet', TelanganaMapSvgData.suryapet));
    telangana.add(Region('Vikarabad', TelanganaMapSvgData.vikarabad));
    telangana.add(Region('Wanaparthy', TelanganaMapSvgData.wanaparthy));
    telangana.add(Region('Warangal Rural', TelanganaMapSvgData.warangalRural));
    telangana.add(Region('Warangal Urban', TelanganaMapSvgData.warangalUrban));
    telangana.add(Region('Yadadri Bhuvanagiri', TelanganaMapSvgData.yadadriBhuvangiri));
    
    tripura.add(Region('boundary', TripuraMapSvgData.tripuraBoundary));
    tripura.add(Region('Dhalai',TripuraMapSvgData.dhalai));
    tripura.add(Region('Gomati',TripuraMapSvgData.gomati));
    tripura.add(Region('Khowai',TripuraMapSvgData.khowai));
    tripura.add(Region('North Tripura',TripuraMapSvgData.northTripura));
    tripura.add(Region('Sipahijala',TripuraMapSvgData.sipahijala));
    tripura.add(Region('South Tripura',TripuraMapSvgData.southTripura));
    tripura.add(Region('Unotoki',TripuraMapSvgData.unotoki));
    tripura.add(Region('West Tripura',TripuraMapSvgData.westTripura));

    //uttarakhand.add(Region('boundary', UttarakhandMapSvgData.uttarakhandBoundary));
    uttarakhand.add(Region('Almora',UttarakhandMapSvgData.almora));
    uttarakhand.add(Region('Bageshwar',UttarakhandMapSvgData.bageshwar));
    uttarakhand.add(Region('Vhamoli',UttarakhandMapSvgData.chamoli));
    uttarakhand.add(Region('Champawat',UttarakhandMapSvgData.champawat));
    uttarakhand.add(Region('Dehradun',UttarakhandMapSvgData.dehradun));
    uttarakhand.add(Region('Haridwar',UttarakhandMapSvgData.haridwar));
    uttarakhand.add(Region('Nainital',UttarakhandMapSvgData.nainital));
    uttarakhand.add(Region('Pauri Garhwal',UttarakhandMapSvgData.pauriGarhwal));
    uttarakhand.add(Region('Pithoragarh',UttarakhandMapSvgData.pithoragarh));
    uttarakhand.add(Region('Rudraprayag',UttarakhandMapSvgData.rudraprayag));
    uttarakhand.add(Region('Teri Garhwal',UttarakhandMapSvgData.teriGarhwal));
    uttarakhand.add(Region('Udham Singh Nagar',UttarakhandMapSvgData.udhamSinghNagar));
    uttarakhand.add(Region('Uttarkashi',UttarakhandMapSvgData.uttarkashi));

    //uttarPradesh.add(Region('boundary', UttarPradeshMapSvgData.uttarPradeshBoundary));
    uttarPradesh.add(Region('Agra',UttarPradeshMapSvgData.agra));
    uttarPradesh.add(Region('Aligarh',UttarPradeshMapSvgData.aligarh));
    uttarPradesh.add(Region('Amnedkar Nagar',UttarPradeshMapSvgData.ambedkarNagar));
    uttarPradesh.add(Region('Amethi',UttarPradeshMapSvgData.amethi));
    uttarPradesh.add(Region('Amroha',UttarPradeshMapSvgData.amroha));
    uttarPradesh.add(Region('Auraiya',UttarPradeshMapSvgData.auraiya));
    uttarPradesh.add(Region('Azamgarh',UttarPradeshMapSvgData.azamgarh));
    uttarPradesh.add(Region('Baghpat',UttarPradeshMapSvgData.baghpat));
    uttarPradesh.add(Region('Bahraich',UttarPradeshMapSvgData.bahraich));
    uttarPradesh.add(Region('Ballia',UttarPradeshMapSvgData.ballia));
    uttarPradesh.add(Region('Balrampur',UttarPradeshMapSvgData.balrampur));
    uttarPradesh.add(Region('Banda',UttarPradeshMapSvgData.banda));
    uttarPradesh.add(Region('Bara Banki',UttarPradeshMapSvgData.baraBanki));
    uttarPradesh.add(Region('Bareilly',UttarPradeshMapSvgData.bareilly));
    uttarPradesh.add(Region('Basti',UttarPradeshMapSvgData.basti));
    uttarPradesh.add(Region('Bhadohi',UttarPradeshMapSvgData.bhadohi));
    uttarPradesh.add(Region('Bijnor',UttarPradeshMapSvgData.bijnor));
    uttarPradesh.add(Region('Budaun',UttarPradeshMapSvgData.budaun));
    uttarPradesh.add(Region('Bulandshahr',UttarPradeshMapSvgData.bulandshahr));
    uttarPradesh.add(Region('Chandauli',UttarPradeshMapSvgData.chandauli));
    uttarPradesh.add(Region('Chitrakoot',UttarPradeshMapSvgData.chitrakoot));
    uttarPradesh.add(Region('Deoria',UttarPradeshMapSvgData.deoria));
    uttarPradesh.add(Region('Etah',UttarPradeshMapSvgData.etah));
    uttarPradesh.add(Region('Etawah',UttarPradeshMapSvgData.etawah));
    uttarPradesh.add(Region('Faizabad',UttarPradeshMapSvgData.faizabad));
    uttarPradesh.add(Region('Farrukhabad',UttarPradeshMapSvgData.farrukhabad));
    uttarPradesh.add(Region('Fatehpur',UttarPradeshMapSvgData.fatehpur));
    uttarPradesh.add(Region('Firozabad',UttarPradeshMapSvgData.firozabad));
    uttarPradesh.add(Region('Gautam Buddha Nagar',UttarPradeshMapSvgData.gautamBuddhaNagar));
    uttarPradesh.add(Region('Ghaziabad',UttarPradeshMapSvgData.ghaziabad));
    uttarPradesh.add(Region('Ghazipur',UttarPradeshMapSvgData.ghazipur));
    uttarPradesh.add(Region('Gonda',UttarPradeshMapSvgData.gonda));
    uttarPradesh.add(Region('Gorakhpur',UttarPradeshMapSvgData.gorakhpur));
    uttarPradesh.add(Region('Hamirpur',UttarPradeshMapSvgData.hamirpur));
    uttarPradesh.add(Region('Hapur',UttarPradeshMapSvgData.hapur));
    uttarPradesh.add(Region('Hardoi',UttarPradeshMapSvgData.hardoi));
    uttarPradesh.add(Region('Hathras',UttarPradeshMapSvgData.hathras));
    uttarPradesh.add(Region('Jalaun',UttarPradeshMapSvgData.jalaun));
    uttarPradesh.add(Region('Jaunpur',UttarPradeshMapSvgData.jaunpur));
    uttarPradesh.add(Region('Jhansi',UttarPradeshMapSvgData.jhansi));
    uttarPradesh.add(Region('Kannauji',UttarPradeshMapSvgData.kannauj));
    uttarPradesh.add(Region('Kanpur Dehat',UttarPradeshMapSvgData.kanpurDehat));
    uttarPradesh.add(Region('Kanpur Nagar',UttarPradeshMapSvgData.kanpurNagar));
    uttarPradesh.add(Region('Kasganj',UttarPradeshMapSvgData.kasganj));
    uttarPradesh.add(Region('Kaushambi',UttarPradeshMapSvgData.kaushambi));
    uttarPradesh.add(Region('Kheri',UttarPradeshMapSvgData.kheri));
    uttarPradesh.add(Region('Kushinagar',UttarPradeshMapSvgData.kushinagar));
    uttarPradesh.add(Region('Lalitpur',UttarPradeshMapSvgData.lalitpur));
    uttarPradesh.add(Region('Lucknow',UttarPradeshMapSvgData.lucknow));
    uttarPradesh.add(Region('Mahoba',UttarPradeshMapSvgData.mahoba));
    uttarPradesh.add(Region('Maharjganj',UttarPradeshMapSvgData.mahrajganj));
    uttarPradesh.add(Region('Mainpuri',UttarPradeshMapSvgData.mainpuri));
    uttarPradesh.add(Region('Mathura',UttarPradeshMapSvgData.mathura));
    uttarPradesh.add(Region('Mau',UttarPradeshMapSvgData.mau));
    uttarPradesh.add(Region('Meerut',UttarPradeshMapSvgData.meerut));
    uttarPradesh.add(Region('Mirzapur',UttarPradeshMapSvgData.mirzapur));
    uttarPradesh.add(Region('Moradabad',UttarPradeshMapSvgData.moradabad));
    uttarPradesh.add(Region('Muzaffaranagar',UttarPradeshMapSvgData.muzaffaranagar));
    uttarPradesh.add(Region('Pilibhit',UttarPradeshMapSvgData.pilibhit));
    uttarPradesh.add(Region('Pratapgarh',UttarPradeshMapSvgData.pratapgarh));
    uttarPradesh.add(Region('Prayagraj',UttarPradeshMapSvgData.prayagraj));
    uttarPradesh.add(Region('Rae Bareli',UttarPradeshMapSvgData.raeBareli));
    uttarPradesh.add(Region('Rampur',UttarPradeshMapSvgData.rampur));
    uttarPradesh.add(Region('Saharnpur',UttarPradeshMapSvgData.saharanpur));
    uttarPradesh.add(Region('Sambhal',UttarPradeshMapSvgData.sambhal));
    uttarPradesh.add(Region('Sant Kabir Nagar',UttarPradeshMapSvgData.santKabirNagar));
    uttarPradesh.add(Region('Shahjahanpur',UttarPradeshMapSvgData.shahjahanpur));
    uttarPradesh.add(Region('Shamli',UttarPradeshMapSvgData.shamli));
    uttarPradesh.add(Region('Siddhartnagar',UttarPradeshMapSvgData.siddharthnagar));
    uttarPradesh.add(Region('Sitapur',UttarPradeshMapSvgData.sitapur));
    uttarPradesh.add(Region('Sonbhadra',UttarPradeshMapSvgData.sonbhadra));
    uttarPradesh.add(Region('Sultanpur',UttarPradeshMapSvgData.sultanpur));
    uttarPradesh.add(Region('Unnao',UttarPradeshMapSvgData.unnao));
    uttarPradesh.add(Region('Varanashi',UttarPradeshMapSvgData.varanashi));
    westBengal.add(Region('Alipurduar', WestBengalMapSvgData.alipurduar));
    westBengal.add(Region('Bankura', WestBengalMapSvgData.bankura));
    westBengal.add(Region('Birbhum', WestBengalMapSvgData.birbhum));
    westBengal.add(Region('Cooch Behar', WestBengalMapSvgData.coochBehar));
    westBengal.add(Region('Dakshin Dinajpur', WestBengalMapSvgData.dakshinDinajpur));
    westBengal.add(Region('Darjiling', WestBengalMapSvgData.darjiling));
    westBengal.add(Region('East Medinipur', WestBengalMapSvgData.eastMedinipur));
    westBengal.add(Region('Hoogli', WestBengalMapSvgData.hoogli));
    westBengal.add(Region('Howrah', WestBengalMapSvgData.howrah));
    westBengal.add(Region('Jalpaiguri', WestBengalMapSvgData.jalpaiguri));
    westBengal.add(Region('Jhargram', WestBengalMapSvgData.jhargram));
    westBengal.add(Region('Kalimpong', WestBengalMapSvgData.kalimpong));
    westBengal.add(Region('Maldah', WestBengalMapSvgData.maldah));
    westBengal.add(Region('Murshidabad', WestBengalMapSvgData.murshidabad));
    westBengal.add(Region('Naida', WestBengalMapSvgData.naida));
    westBengal.add(Region('North 24 Parganas', WestBengalMapSvgData.northTwentyFourParganas));
    westBengal.add(Region('Paschim Barddhaman', WestBengalMapSvgData.paschimBarddhaman));
    westBengal.add(Region('Purba Barddhaman', WestBengalMapSvgData.purbaBarddhaman));
    westBengal.add(Region('Puruliya', WestBengalMapSvgData.puruliya));
    westBengal.add(Region('South 24 Parganas', WestBengalMapSvgData.southTwentyFourParganas));
    westBengal.add(Region('Uttar Dinajpur', WestBengalMapSvgData.uttarDinajpur));
    westBengal.add(Region('West Medinipur', WestBengalMapSvgData.westMedinipur));

    
      
                if(widget.mapT==2)
    {
      setState(() {
        mapN=2;
        debugPrint("State Namex :"+widget.loc);
        _pressedStateName=widget.loc;
        _pressedDistrictName=widget.loc;
      });

    }
    else
    setState(() {
      mapN=1;
    _pressedStateName='india';
    _pressedDistrictName='';

    });
      }
      catch(e){

      }


    super.initState();
  }

  var scl=1.5;
  var dataMain;
  var distData;
  var stadd=0;
  var locX=0.0;
  var locY=0.0;
  var dstadd=0;
  var ddsadd=0;
  bool dValZero=false;
  var init=0;
  @override
  Widget build(BuildContext context){
     if(init==0){
      locX=MediaQuery.of(context).size.width/3.5;
    locY=MediaQuery.of(context).size.height/3.4;
    stateData=Provider.of<GlobalData>(context, listen:false).getstategraph;
    distData=Provider.of<GlobalData>(context, listen:false).getdistData;
    dataMain=Provider.of<GlobalData>(context, listen:false).getmainPayload;
    init++;
    }
    if(cardN==0){mapColor=Colors.blue;}
    else if(cardN==1){mapColor=Colors.red;}
    else if(cardN==2){mapColor=Colors.green;}
    else if(cardN==3){mapColor=Colors.black87;}
     if(mapN==1){
      for(var i=0;i<dataMain["statewise"].length;i++)
        {
          if((dataMain["statewise"][i]["state"]).toString()!="Total")
          {
            if(toINT(dataMain["statewise"][i]["confirmed"])>hCon){hCon=toINT(dataMain["statewise"][i]["confirmed"]);}
            if(toINT(dataMain["statewise"][i]["active"])>hAct){hAct=toINT(dataMain["statewise"][i]["active"]);}
            if(toINT(dataMain["statewise"][i]["recovered"])>hRec){hRec=toINT(dataMain["statewise"][i]["recovered"]);}
            if(toINT(dataMain["statewise"][i]["deaths"])>hDec){hDec=toINT(dataMain["statewise"][i]["deaths"]);}
          }
          
        }
    }
    else if(mapN==2){



      hCon=0;hAct=0;hRec=0;hDec=0;
      for(var i=0;i<distData.length;i++)//for District adress from API
      {
        if(distData[i]["state"].toString().toUpperCase() == _pressedStateName.toUpperCase())
        {
          for(var j=0;j<distData[i]["districtData"].length;j++){
            if(distData[i]["districtData"][j]["confirmed"]>hCon){hCon=distData[i]["districtData"][j]["confirmed"];}
            if(distData[i]["districtData"][j]["active"]>hAct){hAct=distData[i]["districtData"][j]["active"];}
            if(distData[i]["districtData"][j]["recovered"]>hRec){hRec=distData[i]["districtData"][j]["recovered"];}
            if(distData[i]["districtData"][j]["deceased"]>hDec){hDec=distData[i]["districtData"][j]["deceased"];}
          }
        }
      }
    }

    
    return Container(
              child: Stack(
                children:[
                  Stack(
                    children: [
                      SizedBox(height: 135,),
                      Visibility(
                        visible: mapN==1,
                          child: Transform.scale(
                              scale: scl,
                              child: Transform.translate(
                                offset: Offset(locX,locY),
                                child: Stack(children: 
                                        _buildNationMap(india)
                                
                                )
                              )                           
                          )
                      ),
                      Visibility(
                        visible: mapN==2,
                        child: Transform.scale(
                            scale: scl,
                            child: Transform.translate(
                                offset: Offset(locX,locY),
                                child: Stack(
                                  children: _buildStateMap()
                                )
                            )
                          ),
                      ),
                    ]
                  ),
                  Align(
                    alignment: Alignment.topRight,
                        child: Card(color: Colors.transparent,
                        elevation: 0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height/4,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //SizedBox(height: 130,),
                                     Padding(
                                padding: const EdgeInsets.fromLTRB(10,5,0,5),
                                child: (mapN==1)?dataTitle(_pressedStateName):dataTitle(_pressedDistrictName),
                              ),
                               Row(
                                children: <Widget>[
                                GestureDetector(
                                  onTap: ()
                                  {
                                    setState(() {
                                      cardN=0;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    color: cardN==0?Colors.blue.withOpacity(0.2):Colors.transparent,
                                    child: Padbox("CNFMD", (mapN==1 || _pressedDistrictName==_pressedStateName)?dataMain["statewise"][stadd]["confirmed"]: (dValZero)?"0":(distData[dstadd]["districtData"][ddsadd]["confirmed"]).toString(), (mapN==1 || _pressedDistrictName==_pressedStateName)?"[+"+dataMain["statewise"][stadd]["deltaconfirmed"]+"]":(dValZero)?"0":(distData[dstadd]["districtData"][ddsadd]["delta"]["confirmed"]).toString(),Colors.blue,MediaQuery.of(context).size.height/15,MediaQuery.of(context).size.width/4.5))),
                                
                                GestureDetector(
                                  onTap: ()
                                  {
                                    setState(() {
                                      cardN=1;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    color: cardN==1?Colors.red.withOpacity(0.2):Colors.transparent,
                                    child: Padbox("ACTV", (mapN==1 || _pressedDistrictName==_pressedStateName)?dataMain["statewise"][stadd]["active"]:(dValZero)?"0":(distData[dstadd]["districtData"][ddsadd]["active"]).toString(),"",Colors.red,MediaQuery.of(context).size.height/15,MediaQuery.of(context).size.width/4.5))),

                                GestureDetector(
                                  onTap: ()
                                  {
                                    setState(() {
                                      cardN=2;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    color: cardN==2?Colors.green.withOpacity(0.2):Colors.transparent,
                                    child: Padbox("RECVD", (mapN==1 || _pressedDistrictName==_pressedStateName)?dataMain["statewise"][stadd]["recovered"]:(dValZero)?"0":(distData[dstadd]["districtData"][ddsadd]["recovered"]).toString(), (mapN==1 || _pressedDistrictName==_pressedStateName)?"[+"+dataMain["statewise"][stadd]["deltarecovered"]+"]":(dValZero)?"0":(distData[dstadd]["districtData"][ddsadd]["delta"]["recovered"]).toString(),Colors.green,MediaQuery.of(context).size.height/15,MediaQuery.of(context).size.width/4.5))),

                                GestureDetector(
                                  onTap: ()
                                  {
                                    setState(() {
                                      cardN=3;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    color: cardN==3?Colors.black.withOpacity(0.2):Colors.transparent,
                                    child: Padbox("DECSD", (mapN==1 || _pressedDistrictName==_pressedStateName)?dataMain["statewise"][stadd]["deaths"]:(dValZero)?"0":(distData[dstadd]["districtData"][ddsadd]["deceased"]).toString(), (mapN==1 || _pressedDistrictName==_pressedStateName)?"[+"+dataMain["statewise"][stadd]["deltadeaths"]+"]":(dValZero)?"0":(distData[dstadd]["districtData"][ddsadd]["delta"]["deceased"]).toString(),Colors.black87,MediaQuery.of(context).size.height/15,MediaQuery.of(context).size.width/4.5))), 

                                ],
                                ),
                            ]
                      ),
                          ),
        
                    ),
                  ),
                  Align(
                    alignment: (mapN==2)? Alignment.bottomLeft: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0,0,0,20),
                          width: (mapN==2)? MediaQuery.of(context).size.width*.825: double.infinity,
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18,0,20,5),
                              child: Row(
                              children: <Widget>[
                                Expanded(child: Text("0")),
                                Expanded(child: Text(dIndiRange.toString())),
                                Expanded(child: Text((dIndiRange*2).toString())),
                                Expanded(child: Text((dIndiRange*3).toString())),
                                Expanded(child: Text((dIndiRange*4).toString())),
                                Expanded(child: Text((dIndiRange*5).toString()+"+")),
                              ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                              GestureDetector(child: Container(color: colLevelFunc(0), height: 25,width: 10,), onTap: (){colorPalette("0",0);},),
                              Expanded(child: GestureDetector(child: Container(color:colLevelFunc(1), height: 15,), onTap: (){colorPalette("1-"+(dIndiRange*1).toString(),1);},)),
                              Container(color: Colors.black, height: 25,width: 2,),
                              Expanded(child: GestureDetector(child: Container(color:colLevelFunc(2), height: 15,), onTap: (){colorPalette((dIndiRange*1+1).toString()+"-"+(dIndiRange*2).toString(),2);},)),
                              Container(color: Colors.black, height: 25,width: 2,),
                              Expanded(child: GestureDetector(child: Container(color:colLevelFunc(3), height: 15,), onTap: (){colorPalette((dIndiRange*2+1).toString()+"-"+(dIndiRange*3).toString(),3);},)),
                              Container(color: Colors.black, height: 25,width: 2,),
                              Expanded(child: GestureDetector(child: Container(color:colLevelFunc(4), height: 15,), onTap: (){colorPalette((dIndiRange*3+1).toString()+"-"+(dIndiRange*4).toString(),4);},)),
                              Container(color: Colors.black, height: 25,width: 2,),
                              Expanded(child: GestureDetector(child: Container(color:colLevelFunc(5), height: 15,), onTap: (){colorPalette((dIndiRange*4+1).toString()+"-"+(dIndiRange*5).toString(),5);},)),
                              Container(color: Colors.black, height: 25,width: 2,),
                              Expanded(child: GestureDetector(child: Container(color:colLevelFunc(6), height: 15,), onTap: (){colorPalette((dIndiRange*5+1).toString()+"+",6);},)),
                              ],
                              ),
                            ),
                          ]
                      ),
                        ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Visibility(
                        visible: mapN==2,
                        child: 
                        FloatingActionButton(
                          backgroundColor: Theme.of(context).accentColor,
                          child: new Icon(Icons.arrow_back),
                          onPressed: (){
                            setState(() {
                              mapN=1;
                              refreshColor();
                            });
                          },
                          heroTag: null,
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 110,
                    right: 0,
                    child:Transform.scale(
                      scale: 0.5,
                      child: Row(
                          children: <Widget>[
                            Container(
                              child: IconButton(icon: Icon(Icons.add),onPressed: (){
                                setState(() {
                                  scl+=0.05;
                                });

                              },),
                              color:Colors.black12
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: IconButton(icon: Icon(Icons.remove),onPressed: (){
                                  setState(() {
                                  scl-=0.05;
                                });
                                },),
                                color:Colors.black12
                              ),
                            ),
                          ],
                        ),
                    ),
                    ),
                    Positioned(
                    bottom: 100,
                    left: 0,
                    child:Transform.scale(
                          scale: 0.7,
                          child: Row(
                          children: <Widget>[
                            Container(
                              child: IconButton(icon: Icon(Icons.chevron_left),onPressed: (){
                                setState(() {
                                  locX+=5;
                                });
                              },),
                              // color:Colors.grey
                            ),
                            Column(
                              children: <Widget>[
                               Container(
                              child: IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){
                                setState(() {
                                  locY+=5;
                                });
                              },),
                              // color:Colors.grey
                            ),
                            Container(
                              child: IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){
                                setState(() {
                                  locY-=5;
                                });
                              },),
                              
                              // color:Colors.grey
                            ),
                              ],
                            ),
                            Container(
                              child: IconButton(icon: Icon(Icons.chevron_right),onPressed: (){
                                setState(() {
                                  locX-=5;
                                });
                              },),
                              // color:Colors.grey
                            ),
                          ],
                        ),
                    ),
                    ),
                ]
              )
                  
                
            );
  }


  Widget padBox(String labl,String cnt,String dcnt,col,context)
  {
    final boxHT=MediaQuery.of(context).size.width/5.5;
    final boxWD=MediaQuery.of(context).size.width/6;
    return Center(
                child: GestureDetector(
                                  child: Card(
                                    //borderOnForeground: true,
                    color: col.withOpacity(0.2),
                    elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: (mapColor==col)?mapColor:Colors.transparent,width:5),),
                      height: boxHT,
                      width: boxWD,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AutoSizeText(
                              dcnt,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2,color: col),
                              maxLines: 1,
                              ),
                            AutoSizeText(
                              dataMain!=null? cnt: "null",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: col),maxLines: 1,
                              ),
                              AutoSizeText(
                              labl,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,letterSpacing: 1,color: col),maxLines: 1,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      if(labl=="CNFMD"){cardN=0;}
                      else if(labl=="ACTV"){cardN=1;}
                      else if(labl=="RECVD"){cardN=2;}
                      else if(labl=="DECSD"){cardN=3;}
                    });                    
                  },
              )
            );
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
                                            Navigator.pop(context);
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
        conColorList[0]=Colors.blue[50];conColorList[1]=Colors.blue[100];conColorList[2]=Colors.blue[200];conColorList[3]=Colors.blue[300];conColorList[4]=Colors.blue[500];conColorList[5]=Colors.blue[700];conColorList[6]=Colors.blue[900];
      }
      else if(cardN==1){
        actColorList[0]=Colors.red[50];actColorList[1]=Colors.red[100];actColorList[2]=Colors.red[200];actColorList[3]=Colors.red[300];actColorList[4]=Colors.red[500];actColorList[5]=Colors.red[700];actColorList[6]=Colors.red[900];
      }
      else if(cardN==2){
        recColorList[0]=Colors.green[50];recColorList[1]=Colors.green[100];recColorList[2]=Colors.green[200];recColorList[3]=Colors.green[300];recColorList[4]=Colors.green[500];recColorList[5]=Colors.green[700];recColorList[6]=Colors.green[900];
      }
      else if(cardN==3){
        decColorList[0]=Colors.black12;decColorList[1]=Colors.black26;decColorList[2]=Colors.black38;decColorList[3]=Colors.black45;decColorList[4]=Colors.black54;decColorList[5]=Colors.black87;decColorList[6]=Colors.black;
      }
  }

}

//paints regionpath
class PathPainter extends CustomPainter {
  
  final Path _path;
  final double _strokeWidth;
  final Color _color;
  PathPainter(this._path, this._strokeWidth, this._color);

  

  @override
  void paint(Canvas canvas, Size size) {
    Path path = _path;

    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = _color
          ..strokeWidth = _strokeWidth);
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
    return _path;
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