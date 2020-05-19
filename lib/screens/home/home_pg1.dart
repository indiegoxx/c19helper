import 'package:animate_do/animate_do.dart';
import 'package:animated_card/animated_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19stat/model/nation_state_model.dart';
import 'package:covid19stat/screens/graphs/homegraph.dart';
import 'package:covid19stat/screens/graphs/homegrmin.dart';
import 'package:covid19stat/screens/graphs/stategraph.dart';
import 'package:covid19stat/screens/home/detailsContainer.dart';
import 'package:covid19stat/screens/utilsc/componets/datTable.dart';
import 'package:covid19stat/screens/utilsc/componets/districtTable.dart';
import 'package:covid19stat/screens/utilsc/componets/padbox2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:covid19stat/screens/utilsc/componets/padbox.dart';
import 'package:package_info/package_info.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'nationpg3.dart';



class MainHome extends StatefulWidget {
 final PageController pgCtrl;

  const MainHome(this.pgCtrl);
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var dataMain;
  var dataMainx;
  var distData; 
  var homeChartMsg;
  var testData;

  var scurl;
  String homeGraphType="CNFMD";
  String homeStateGraphType="CNFMD";
  static var versionDetails;


  static String version;
  static String lversion;

  Future<String> versionDetail() async{
    // if(versionDetails==null){
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // version= packageInfo.version;
    // // versionDetails=await dbr.collection("UPDATES").document("version").get();
    // lversion=versionDetails.data["latest_version"];
    // debugPrint("from Server"+versionDetails.data["latest_version"]);
    // debugPrint("from app"+version);
    // }

    return "ok";
  }
  var stCode;
  @override
  Widget build(BuildContext context) {
    
    // if(versionDetails==null)
    // versionDetail();
    dataMain=Provider.of<GlobalData>(context, listen:false).getmainPayload;
    dataMainx=Provider.of<GlobalData>(context, listen:false).getstategraph;
    distData=Provider.of<GlobalData>(context, listen:false).getdistData;
    testData=Provider.of<GlobalData>(context, listen:false).getTestData;
    var usrState = Provider.of<GlobalData>(context,listen: false).getuserState;
    var usrDist = Provider.of<GlobalData>(context,listen: false).getuserDist;
    var stadd;
    var tstadd;  
    var dstadd;
    for(var i=0;i<dataMain["statewise"].length;i++)//for State adress from API
    {
      if(dataMain["statewise"][i]["state"].toString().toUpperCase() == usrState.toUpperCase())
      {
        stadd=i;
      }
    }

  for(var i=0;i<testData["states_tested_data"].length;i++)//for TestCountState adress from API
    {
      if(testData["states_tested_data"][i]["state"].toString().toUpperCase() == usrState.toUpperCase())
      {
        if(testData["states_tested_data"][i]["totaltested"]=="")
        tstadd=i-1;
        else
        tstadd=i;
      }
    }
    scurl=testData["states_tested_data"][tstadd]["source1"];

    for(var i=0;i<distData.length;i++)//for District adress from API
    {
      if(distData[i]["state"].toString().toUpperCase() == usrState.toUpperCase())
      {
        dstadd=i;
      }
    }

    List<String> distNames=[];
    List<String> confirmed=[];
    List<String> active=[];
    List<String> recovered=[];
    List<String> deceased=[];
    List<String> delactive=[];
    List<String> delconfirmed=[];
    List<String> delrecovered=[];
    List<String> deldeceased=[];
  
    var usrDistCnt="";
    var usrDistdata;

    var unknownCount;
    // var dusrDistCnt="";
    // int distadd;

    for(var i=0;i<distData[dstadd]["districtData"].length;i++)
    {

      if(distData[dstadd]["districtData"][i]["district"].toString().toUpperCase()=="UNKNOWN")
      unknownCount=distData[dstadd]["districtData"][i]["confirmed"].toString();

      // debugPrint(distData[dstadd]["districtData"][i]["district"]);
      if(usrDist.contains(distData[dstadd]["districtData"][i]["district"]))
      {
      debugPrint("match found");
      // distadd=i;
      usrDistCnt=distData[dstadd]["districtData"][i]["confirmed"].toString();
      // dusrDistCnt=distData[dstadd]["districtData"][i]["delta"]["confirmed"].toString();
      usrDistdata=distData[dstadd]["districtData"][i];
    }
    else
    {
          distNames.add(distData[dstadd]["districtData"][i]["district"].toString());
          active.add(distData[dstadd]["districtData"][i]["active"].toString());
          confirmed.add(distData[dstadd]["districtData"][i]["confirmed"].toString());
          recovered.add(distData[dstadd]["districtData"][i]["recovered"].toString());
          deceased.add(distData[dstadd]["districtData"][i]["deceased"].toString());
          delconfirmed.add(distData[dstadd]["districtData"][i]["delta"]["confirmed"].toString());
          delrecovered.add(distData[dstadd]["districtData"][i]["delta"]["recovered"].toString());
          deldeceased.add(distData[dstadd]["districtData"][i]["delta"]["deceased"].toString());
          delactive.add("0");
    }
    }

      bool isNumeric(String s) {
 if (s == null) {
   return false;
 }
 return double.tryParse(s) != null;
}

    DateFormat inputFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    DateTime dateTime = inputFormat.parse(dataMain["statewise"][stadd]["lastupdatedtime"]);
    DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String dateInString = outputFormat.format(dateTime);
    var timeUpdate=DateTime.parse(dateInString);

    DateFormat inputFormat2 = DateFormat("dd/MM/yyyy HH:mm:ss");
    DateTime dateTime2 = inputFormat2.parse(dataMain["statewise"][0]["lastupdatedtime"]);
    DateFormat outputFormat2 = DateFormat("yyyy-MM-dd HH:mm:ss");
    String dateInString2 = outputFormat2.format(dateTime2);
    var timeUpdate2=DateTime.parse(dateInString2);
    var stcnt=testData["states_tested_data"][tstadd]["totaltested"]!="" ? testData["states_tested_data"][tstadd]["totaltested"] : "N/A";
    var testCount=testData["states_tested_data"][tstadd]["totaltested"];
    var c=dataMain["statewise"][stadd]["confirmed"];
    var cnt=dataMain["tested"][dataMain["tested"].length - 1]["totalsamplestested"].toString();
    if(isNumeric(cnt))
    {
    var format = NumberFormat.currency(locale: 'HI');
    cnt=format.format(int.parse(cnt));
    cnt=cnt.substring(3,cnt.length-3);
    }

    if(isNumeric(stcnt))
    {
    var format = NumberFormat.currency(locale: 'HI');
    stcnt=format.format(int.parse(stcnt));
    stcnt=stcnt.substring(3,stcnt.length-3);
    }
    try{
    return  FutureBuilder(
          future: versionDetail(),
          builder: (context,snapshot){
            if(snapshot.hasData)
            return FadeInUp(
              duration: Duration(milliseconds: 300),
            child: true?Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  if(versionDetails!=null)
                  if(lversion!=version)
                  AnimatedCard(
                      direction: AnimatedCardDirection.left, //Initial animation direction
                      initDelay: Duration(milliseconds: 0), //Delay to initial animation
                      duration: Duration(seconds: 2), //Initial animation duration
                      onRemove: () {lversion=version;}, //Implement this action to active dismiss
                      curve: Curves.fastLinearToSlowEaseIn, //Animation curve
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,10,0),
                                    child: Text(versionDetails.data["update_message"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.green),),
                                  )),
                                  FlatButton(onPressed: ()=>launch(versionDetails.data["updateLink"]),child: Text("UPDATE",style: TextStyle(color:Colors.white,fontSize: 12)),color: Colors.green,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                  Container(
                    color: Colors.white,
                              height: 10,
                            ),
                  InkWell(
                        onTap: ()
                        {
                          // widget.npc.jumpToPage(1);
                        },
                        child: Container(
                          // color:  Colors.grey,
                        width: MediaQuery.of(context).size.width/1.06,
                        child: Card(
                            margin: EdgeInsets.all(0),
                            child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                  Padding(
                                padding: const EdgeInsets.fromLTRB(10,12,0,5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("INDIA",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1,fontSize: 16),),
                                    Spacer(),
                                  ],
                                ),
                              ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    homeGraphType="CNFMD";
                                                  });
                                                },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            color: homeGraphType=="CNFMD" ?Colors.blue.withOpacity(0.2) : Colors.transparent,
                                            child: Padbox("CNFMD",dataMain["statewise"][0]["confirmed"]," +"+dataMain["statewise"][0]["deltaconfirmed"]+"",Colors.blue,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7))),
                                        GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    homeGraphType="ACTV";
                                                  });
                                                },                                    
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            color: homeGraphType=="ACTV" ?Colors.red.withOpacity(0.2) : Colors.transparent,
                                            child: Padbox("ACTV",dataMain["statewise"][0]["active"],"",Colors.red,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7))),
                                        GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    homeGraphType="RECVD";
                                                  });
                                                },                                    
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            color: homeGraphType=="RECVD" ?Colors.green.withOpacity(0.2) : Colors.transparent,
                                            child: Padbox("RECVD",dataMain["statewise"][0]["recovered"]," +"+dataMain["statewise"][0]["deltarecovered"]+"",Colors.green,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7))),
                                        GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    homeGraphType="DECSD";
                                                  });
                                                },                                    
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            color: homeGraphType=="DECSD" ?Colors.black.withOpacity(0.2) : Colors.transparent,
                                            child: Padbox("DECSD",dataMain["statewise"][0]["deaths"]," +"+dataMain["statewise"][0]["deltadeaths"]+"",Colors.black,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7))),
                                      ],
                                    ),

                                  ],
                                ),
                              ),

                                  Container(
                                    height: 3,
                                  ),
                                  Container(
                                    // color: Colors.grey,
                                    height: MediaQuery.of(context).size.height/5,
                                    width: MediaQuery.of(context).size.width,
                                    child: HomeCharts(createSampleData(homeGraphType)),
                                  ),
                                  Container(
                                    height: 10,
                                  ),
                            // SingleChildScrollView(
                            //     scrollDirection: Axis.horizontal,
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.end,
                            //         crossAxisAlignment: CrossAxisAlignment.end,
                            //         children: <Widget>[
                            //           Container(       
                            //              height: MediaQuery.of(context).size.height/3,
                            //              width: MediaQuery.of(context).size.width/2.5, 
                            //             child: SingleChildScrollView(
                            //                                                 child: Column(
                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                 mainAxisAlignment: MainAxisAlignment.start,
                            //                 children: <Widget>[
                            //                   Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   mainAxisAlignment: MainAxisAlignment.start,
                            //                   children: <Widget>[
                            //                   InkWell(
                            //                     child: Padbox2("CNFMD",dataMain["statewise"][0]["confirmed"]," +"+dataMain["statewise"][0]["deltaconfirmed"]+"",Color.fromRGBO(2,131,255, 1),MediaQuery.of(context).size.height/13,MediaQuery.of(context).size.width/4.8),
                                                // onTap: (){
                                                //   setState(() {
                                                //     homeGraphType="CNFMD";
                                                //   });
                                                // },
                            //                     ),
                            //                   InkWell(
                            //                     onTap: (){
                            //                       setState(() {
                            //                         homeGraphType="ACTV";
                            //                       });
                            //                     },
                            //                     child: Padbox2("ACTV",dataMain["statewise"][0]["active"],"",Color.fromRGBO(225, 0, 3, 1),MediaQuery.of(context).size.height/13,MediaQuery.of(context).size.width/4.8)),
                            //                   InkWell(
                            //                     onTap: (){
                            //                       setState(() {
                            //                         homeGraphType="RECVD";
                            //                       });
                            //                     },
                            //                     child: Padbox2("RECVD",dataMain["statewise"][0]["recovered"]," +"+dataMain["statewise"][0]["deltarecovered"]+"",Colors.green[700],MediaQuery.of(context).size.height/13,MediaQuery.of(context).size.width/4.8)),
                            //                   InkWell(
                            //                     onTap: (){
                            //                       setState(() {
                            //                         homeGraphType="DECSD";
                            //                       });
                            //                     },
                            //                     child: Padbox2("DECSD",dataMain["statewise"][0]["deaths"]," +"+dataMain["statewise"][0]["deltadeaths"]+"",Colors.black87,MediaQuery.of(context).size.height/13,MediaQuery.of(context).size.width/4.8)),    
                            //                   ],
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //  ),
                            //  Stack(
                            //    children: <Widget>[
                                //  Container(
                                //     // color: Colors.grey,
                                //     height: MediaQuery.of(context).size.height/3,
                                //     width: MediaQuery.of(context).size.width/1.6,
                                //     child: HomeCharts(createSampleData(homeGraphType)),
                                //   )
                            //    ],
                            //  ),
                            // ],
                            //       ),
                            // ),
                      

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                            Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10.0,10,20,0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        
                                      ],
                                    ),
                                            Row(
                                              children: <Widget>[
                                                Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(cnt, style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                                child: Text("Tested as of " + dataMain["tested"][dataMain["tested"].length - 1]["updatetimestamp"].toString().substring(0,5),style: TextStyle(fontSize: 10,color: Colors.black),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                child: Text("Positivity Rate  -  "+(int.parse(dataMain["statewise"][0]["confirmed"])/int.parse(dataMain["tested"][dataMain["tested"].length - 1]["totalsamplestested"])*100).toStringAsFixed(2)+"%",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: Colors.black87.withOpacity(0.7)),),
                                              ),
                                            ],
                                          ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 08, 0),
                                                child: IconButton(iconSize: 19,icon: Icon(Icons.show_chart),color: Colors.black87, onPressed: (){
                                                  Provider.of<GlobalData>(context, listen:false).updategraphT("tt");
                                                  widget.pgCtrl.jumpToPage(1);
                                                  // Navigator.pushNamed(context, '/details');
                                                }, focusColor: Colors.black,),
                                              ),
                                              IconButton(iconSize: 19,icon: Icon(Icons.dashboard),color: Colors.black87, onPressed: (){
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => DetailsContainer(target: "table",)),
                                                        );
                                                }, focusColor: Colors.black,),
                                                IconButton(iconSize: 25,icon: Icon(Icons.zoom_out_map),color: Colors.black87, onPressed: (){
                                                  Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => DetailsContainer(target: "map",mapT: 1,)),
                                                      );
                                                }, focusColor: Colors.black,),
                                            ],),
                                          ],
                                        ),
                                      ),
                                    ],
                                ),
                                ),

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Updated : "+Jiffy(timeUpdate2).fromNow(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 10),),
                                        IconButton(iconSize: 19,icon: Icon(Icons.link), onPressed: (){launch(dataMain["tested"][dataMain["tested"].length - 1]["source"]); })
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ) 
                        ),
                      ),
  Card(
        elevation: 0,
        child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        child:   Container(
                        width: MediaQuery.of(context).size.width/1.06,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0,12,0,5),
                                child: Text(usrDist.toUpperCase(),style: TextStyle(
                                  fontWeight: FontWeight.bold,letterSpacing: 1,fontSize: 16,
                                  color: Colors.black,
                                ),),
                              ),
                              Center(
                              child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                                child: Container(//was card
                                  child: Center(
                                  child: Container(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>
                                    [
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[],
                                        ),
                                        Container(
                                          child: ((usrDistCnt==null)|| (usrDistCnt==0) || (usrDistCnt=="0"))? Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                          Padbox("          No Cases Yet          ","-","",Colors.green[700],MediaQuery.of(context).size.height/12,MediaQuery.of(context).size.width/1.18),
                                          ],
                                          ) :

                                          Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                          Padbox("CNFRMD",usrDistdata["confirmed"].toString(),"[+"+usrDistdata["delta"]["confirmed"].toString()+"]",Color.fromRGBO(2,131,255, 1),MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7),
                                          Padbox("ACTV",usrDistdata["active"].toString(),"",Color.fromRGBO(225, 0, 3, 1),MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7),
                                          Padbox("RECVD",usrDistdata["recovered"].toString(),"[+"+usrDistdata["delta"]["recovered"].toString()+"]",Colors.green[700],MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7),
                                          Padbox("DECSD",usrDistdata["deceased"].toString(),"[+"+usrDistdata["delta"]["deceased"].toString()+"]",Colors.black87,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7),    
                                          ],
                                          )
                                          ,
                                        ),
                                        
                              ],
                              ),
                                  ),
                                        ),
                                ),
                          ),
                            ),
                          ],
                        )
                        ),
),
  ),


  Card(
  child:   Container(
                      width: MediaQuery.of(context).size.width/1.06,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,12,0,5),
                                  child: Text(usrState.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1,fontSize: 18),),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(//was card
                                child: Center(
                                child: Container(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>
                                  [
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        color: homeStateGraphType=="CNFMD" ?Colors.blue.withOpacity(0.2) : Colors.transparent,
                                          child: GestureDetector(
                                          onTap: (){
                                                    setState(() {
                                                      homeStateGraphType="CNFMD";
                                                    });
                                                  },     
                                          child: Padbox("CNFMD",dataMain["statewise"][stadd]["confirmed"],"[+"+dataMain["statewise"][stadd]["deltaconfirmed"]+"]",Color.fromRGBO(2,131,255, 1),MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7)),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        color: homeStateGraphType=="ACTV" ?Colors.red.withOpacity(0.2) : Colors.transparent,
                                          child: GestureDetector(
                                          onTap: (){
                                                    setState(() {
                                                      homeStateGraphType="ACTV";
                                                    });
                                                  },     
                                          child: Padbox("ACTV",dataMain["statewise"][stadd]["active"],"",Color.fromRGBO(225, 0, 3, 1),MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7)),
                                      ),
                                      AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                            color: homeStateGraphType=="RECVD" ?Colors.green.withOpacity(0.2) : Colors.transparent,
                                          child: GestureDetector(
                                          onTap: (){
                                                    setState(() {
                                                      homeStateGraphType="RECVD";
                                                    });
                                                  },     
                                          child: Padbox("RECVD",dataMain["statewise"][stadd]["recovered"],"[+"+dataMain["statewise"][stadd]["deltarecovered"]+"]",Colors.green[700],MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7)),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                            color: homeStateGraphType=="DECSD" ?Colors.black.withOpacity(0.2) : Colors.transparent,
                                            child: GestureDetector(
                                          onTap: (){
                                                    setState(() {
                                                      homeStateGraphType="DECSD";
                                                    });
                                                  },     
                                          child: Padbox("DECSD",dataMain["statewise"][stadd]["deaths"],"[+"+dataMain["statewise"][stadd]["deltadeaths"]+"]",Colors.black87,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/4.7)),
                                      ),    
                                      ],
                                      ),
                                  Container(
                                  
                                  child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10.0,10,20,0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                    Container(
                                    // color: Colors.grey,
                                    width: MediaQuery.of(context).size.width/1.2,
                                    height: MediaQuery.of(context).size.height/5,
                                    child: HomeCharts(createSampleStateData(homeStateGraphType,usrState.toString())),
                                  ),
                                ],
                              ),
                                  Container(
                                    height: 20,
                                  ),
                                          Row(
                                            children: <Widget>[
                                              Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(stcnt, style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                              child: Text("Tested as of " + testData["states_tested_data"][tstadd]["updatedon"].toString().substring(0,5),style: TextStyle(fontSize: 10,color: Colors.black),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                              child: Text("Positivity Rate "+(int.parse(c)/int.parse(testCount)*100).toStringAsFixed(2)+"%",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: Colors.black87.withOpacity(0.7)),),
                                            ),
                                            ],
                                        ),
                                        
                                            Spacer(),
                                            Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 08, 0),
                                                child: IconButton(iconSize: 19,icon: Icon(Icons.show_chart),color: Colors.black87, onPressed: (){
                                                  stCode=titleToCode(usrState);
                                                  Provider.of<GlobalData>(context, listen:false).updategraphT(stCode);
                                                  // Provider.of<GlobalData>(context, listen:false).updategraphT("tt");
                                                  widget.pgCtrl.jumpToPage(1);
                                                  // Navigator.pushNamed(context, '/details');
                                                }, focusColor: Colors.black,),
                                              ),
                                                IconButton(iconSize: 25,icon: Icon(Icons.zoom_out_map),color: Colors.black87, onPressed: (){
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => DetailsContainer(target: "map",loc: usrState.toLowerCase(),mapT: 2,)),
                                                      );
                                                }, focusColor: Colors.black,),
                                          ],),
                                        ],
                                      ),
                                    ),
                                
                                  ],
                              ),
                                ),
                            ],
                            ),
                                ),
                                      ),
                              ),
                          ),
                          
                          Container(
                                  width: MediaQuery.of(context).size.width/1,
                                  child: Column(
                                  children: <Widget>[
                             Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("Updated : "+Jiffy(timeUpdate).fromNow(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 11),),
                              IconButton(iconSize: 19,icon: Icon(Icons.link), onPressed: () {
                                launch(testData["states_tested_data"][tstadd]["source1"]);
                                debugPrint(scurl);
                                })
                            ],
                          ),
                          ],
                              ),
                                ),
                        ],
                      )
                      ),
                    ),
                
                unknownCount!=null? Card(
                  color:Colors.black87,
                  child: Container(
                      width: MediaQuery.of(context).size.width/1.06,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                 child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.location_searching, size: 12, color: Colors.white,),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/1.2,
                                    child: AutoSizeText("Awaiting Details for some new cases ($unknownCount) from state bulletin.",style: TextStyle(color: Colors.white,fontSize: 12),)),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                      ),
                    ):Text("")
                    ,



                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/1.06,
                  child: DistContentTable(
                  c1: "District",
                  columns: ["CNF","ACT","REC","DEC",],
                  data: [confirmed,active,recovered,deceased,],
                  rows: distNames,
                  deldata: [delconfirmed,delactive,delrecovered,deldeceased],
                ),
              ),
            ],
          ),
        ):Scaffold(
          body:Column(
            children: <Widget>[
              Center(child: Text("Looks Like We're Down"),),
              AnimatedCard(
                    direction: AnimatedCardDirection.left, //Initial animation direction
                    initDelay: Duration(milliseconds: 0), //Delay to initial animation
                    duration: Duration(seconds: 2), //Initial animation duration
                    onRemove: () {lversion=version;}, //Implement this action to active dismiss
                    curve: Curves.fastLinearToSlowEaseIn, //Animation curve
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0,0,10,0),
                                  child: Text("Some thing is wrong ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey),),
                                )),
                                FlatButton(onPressed: ()=>launch("https://semicolon-e1ead.web.app/"),child: Text("Check The Website",style: TextStyle(color:Colors.white,fontSize: 12)),color: Colors.blue,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          )
        ),
      );
      else
      return Center(child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 1,
        )));
          }
          
    );}
    catch(e){
      return Text(e.toString());  
    }
}

    _launchInBrowser() async {
  if (await canLaunch(scurl)) {
    await launch(scurl);
  } else {
    throw 'Could not launch $scurl';
  }
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



  List<charts.Series<TimeSeriescount, DateTime>> createSampleData(String x) {
    debugPrint(x.toString());
  
      List<TimeSeriescount> data = [
      // new TimeSeriescount(new DateTime(2020, 1, 1), 5),
    ];
  
    if(dataMain!=null)
    {
      for(var i=dataMain["cases_time_series"].length-1;i>dataMain["cases_time_series"].length-30;i--)
      {
        var n=int.parse(dataMain["cases_time_series"][i]["dailyconfirmed"])-int.parse(dataMain["cases_time_series"][i]["dailyrecovered"])+int.parse(dataMain["cases_time_series"][i]["dailydeceased"]);
        var date=toDT(dataMain["cases_time_series"][i]["date"]);
        // debugPrint(.toString());
        if(x=="CNFMD")
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day), int.parse(dataMain["cases_time_series"][i]["dailyconfirmed"]),charts.MaterialPalette.blue.shadeDefault),
        );
        if(x=="ACTV")
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day), n<=0? 0: n ,charts.MaterialPalette.red.shadeDefault),
        );
        if(x=="RECVD")
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day), int.parse(dataMain["cases_time_series"][i]["dailyrecovered"]),charts.MaterialPalette.green.shadeDefault),
        );
        if(x=="DECSD")
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day), int.parse(dataMain["cases_time_series"][i]["dailydeceased"]),charts.MaterialPalette.gray.shadeDefault),
        );
      }
    }


    return [
      new charts.Series<TimeSeriescount, DateTime>(
        id: 'count',
        colorFn: (TimeSeriescount count, _) => count.colorBar ,
        domainFn: (TimeSeriescount count, _) => count.time,
        measureFn: (TimeSeriescount count, _) => count.count,
        data: data,
      )
    ];
  }


  List<charts.Series<TimeSeriescount, DateTime>> createSampleStateData(String x,usrState) {
      var graphData=Provider.of<GlobalData>(context).getstategraph;
      var stCode=titleToCode(usrState);
      debugPrint(stCode);
      List<TimeSeriescount> data = [
    ];
    var cumSum=0;
    var cumRec=0;
    var cumDes=0;
  
    if(graphData!=null)
    {
      for(var i=graphData["states_daily"].length-1;i>0;i--)
      {
      if(graphData["states_daily"][i]["status"]=="Confirmed")
      cumSum+=int.parse(graphData["states_daily"][i][stCode]);
      if(graphData["states_daily"][i]["status"]=="Recovered")
      cumRec+=int.parse(graphData["states_daily"][i][stCode]);
      if(graphData["states_daily"][i]["status"]=="Deceased")
      cumDes+=int.parse(graphData["states_daily"][i][stCode]);
      }
      cumSum=cumSum-(cumRec+cumDes);
      for(var i=graphData["states_daily"].length-2;i>graphData["states_daily"].length-30*3;i--)
      {

        var date=toDT(graphData["states_daily"][i]["date"]);
        var datax=graphData["states_daily"][i][stCode];
        var tmp=int.parse(datax)-int.parse(graphData["states_daily"][i+1][stCode]);
        // debugPrint(.toString());
        if((x=="CNFMD")&&(graphData["states_daily"][i]["status"]=="Confirmed")){
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day), int.parse(datax),charts.MaterialPalette.blue.shadeDefault),
        );
        }
        if((x=="ACTV")){
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day),tmp<=0? 0:tmp,charts.MaterialPalette.red.shadeDefault),
        );
        }

        
        if((x=="RECVD")&&(graphData["states_daily"][i]["status"]=="Recovered")){
       
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day), int.parse(datax),charts.MaterialPalette.green.shadeDefault),
        );}
        if((x=="DECSD")&&(graphData["states_daily"][i]["status"]=="Deceased")){
        data.add(
          new TimeSeriescount(new DateTime(date.year, date.month, date.day), int.parse(datax),charts.MaterialPalette.gray.shadeDefault),
        );}
      }
    }


    return [
      new charts.Series<TimeSeriescount, DateTime>(
        id: 'count',
        colorFn: (TimeSeriescount count, _) => count.colorBar ,
        domainFn: (TimeSeriescount count, _) => count.time,
        measureFn: (TimeSeriescount count, _) => count.count,
        data: data,
      )
    ];
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



}