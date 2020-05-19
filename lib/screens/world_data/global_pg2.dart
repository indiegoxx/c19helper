import 'dart:convert';

import 'package:covid19stat/model/global_model.dart';
import 'package:covid19stat/screens/utilsc/componets/datTable.dart';
import 'package:covid19stat/screens/utilsc/componets/padbox.dart';
import 'package:covid19stat/screens/world_data/worldmap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';



class GlobalBase2 extends StatefulWidget {
  @override
  _GlobalBase2State createState() => _GlobalBase2State();
}

class _GlobalBase2State extends State<GlobalBase2> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => WorldDataContainer()),
    ],
    child: GlobalHomePage()
    );
  }
}





class GlobalHomePage extends StatefulWidget {
    static List<String> cntryNames=[];
    static List<String> confirmed=[];
    static List<String> active=[];
    static List<String> recovered=[];
    static List<String> deceased=[];
    static List<String> delactive=[];
    static List<String> delconfirmed=[];
    static List<String> delrecovered=[];
    static List<String> deldeceased=[];
    static List<String> tets=[];
    static List<String> countrycode=[];

    static Map globaldatamap=Map();

  @override
  _GlobalHomePageState createState() => _GlobalHomePageState();
}

class _GlobalHomePageState extends State<GlobalHomePage> {
    double _lowerValue=1000;

    int gc=0,gdc=0,gr=0,ga=0,gd=0,gdd=0;

    

    var countriesdata;

    var processed=false;

   
    
    
    Future<dynamic> getCountryCodes() async {
      var globalData;
      var globalDataPro=Provider.of<WorldDataContainer>(context, listen:false).getWorldData;
      debugPrint("getting data $globalDataPro");
    if((globalData==null)&& globalDataPro==null)
    {
    debugPrint("connecting to network \n\n\n\n\n\n\n------------------");
    final response = await http.get("https://raw.githubusercontent.com/indiegoxx/jsonhosting/master/countries_code.json");
    final response1 = await http.get("https://corona.lmao.ninja/v2/countries/");
    if (response.statusCode == 200 && response1.statusCode == 200) {
      globalData=null;
      countriesdata=json.decode(response.body);
      globalData=json.decode(response1.body);
    }
    }
    // debugPrint("GlobalData + $globalData");
    return globalData;
  }

  Future<bool> processData()async
   {
    if(GlobalHomePage.globaldatamap.isEmpty)
    {
    var globalData = await getCountryCodes();
    debugPrint("Processed1");  
    GlobalHomePage.cntryNames=[];
    GlobalHomePage.confirmed=[];
    GlobalHomePage.active=[];
    GlobalHomePage.recovered=[];
    GlobalHomePage.deceased=[];
    GlobalHomePage.delactive=[];
    GlobalHomePage.delconfirmed=[];
    GlobalHomePage.delrecovered=[];
    GlobalHomePage.deldeceased=[];

  if(globalData!=null)
  {
    gc=0;gdc=0;gr=0;ga=0;gd=0;gdd=0;
  for(var i=0;i<globalData.length;i++)
  {
    try{
      if(globalData[i]["cases"]>_lowerValue)
    {
    GlobalHomePage.countrycode.add(globalData[i]["countryInfo"]["iso2"].toString());
    GlobalHomePage.cntryNames.add(globalData[i]["country"].toString());
    GlobalHomePage.confirmed.add(globalData[i]["cases"].toString());
    GlobalHomePage.active.add((globalData[i]["active"].toString()));
    GlobalHomePage.recovered.add((globalData[i]["recovered"].toString()));
    GlobalHomePage.deceased.add((globalData[i]["deaths"].toString()));
    GlobalHomePage.delactive.add("0");
    GlobalHomePage.delconfirmed.add((globalData[i]["todayCases"].toString()));
    GlobalHomePage.deldeceased.add((globalData[i]["todayDeaths"].toString()));
    GlobalHomePage.delrecovered.add("0");
    }
    GlobalHomePage.globaldatamap[globalData[i]["countryInfo"]["iso2"]]={
      "cases": globalData[i]["cases"].toString(),
      "todayCases": globalData[i]["todayCases"].toString(),
      "deaths": globalData[i]["deaths"].toString(),
      "todayDeaths": globalData[i]["todayDeaths"].toString(),
      "recovered": globalData[i]["recovered"].toString(),
      "active": globalData[i]["active"].toString(),
      "critical": globalData[i]["critical"].toString(),
      "casesPerOneMillion": globalData[i]["casesPerOneMillion"].toString(),
      "deathsPerOneMillion": globalData[i]["deathsPerOneMillion"].toString(),
      "tests": globalData[i]["tests"].toString(),
      "testsPerOneMillion": globalData[i]["testsPerOneMillion"].toString(),
      "continent": globalData[i]["continent"].toString(),
      "updated": globalData[i]["updated"].toString(),
      "country": globalData[i]["country"].toString(),
      "flag": globalData[i]["countryInfo"]["flag"].toString(),
      };
      // debugPrint("GlobalCount = $gc");
      gc+=globalData[i]["cases"];
      gr+=globalData[i]["recovered"];
      gd+=globalData[i]["deaths"];
      gdd+=globalData[i]["todayDeaths"];
      gdc+=globalData[i]["todayCases"];
      ga+=globalData[i]["active"];
      GlobalHomePage.globaldatamap["GLOB"]={
      "cases": gc.toString(),
      "todayCases": gdc.toString(),
      "deaths": gd.toString(),
      "todayDeaths": gdd.toString(),
      "recovered": gr.toString(),
      "active":ga.toString(),
      "country": "Global",
      "flag": "https://i.ibb.co/1rq0S6F/baseline-public-black-18dp.png",
      };
    }
    catch(e){
      debugPrint("$e");
    }
    
  }
  if(GlobalHomePage.globaldatamap!=null)
  Provider.of<WorldDataContainer>(context, listen:false).updateWorldData(GlobalHomePage.globaldatamap);
  debugPrint("Processed2");
  }
  
  }
return true;

      
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: processData(),
        builder: (context, snapshot) {
          // debugPrint("User " + usr.toString());
          return Scaffold(
              body : GlobalHomePage.globaldatamap.isEmpty
                ? Center(child: Text("Loading"),)
                : GlobalTable(),
            );
        },
      );
  }
}




class GlobalTable extends StatefulWidget {
  
  GlobalTable();
  @override
  _GlobalTableState createState() => _GlobalTableState();
}

Offset mapPosition = Offset(0,0);
class _GlobalTableState extends State<GlobalTable> {
    var countriesdata;
    var processed=true;
    static bool mapvtable=true;
    int cnt=0;
    double xPosition = 0;
    double yPosition = 0;
    var cardX=0;

    var zoomstate= 1.0;
  @override
  Widget build(BuildContext context) {
    if(Provider.of<WorldDataContainer>(context, listen:false).getWorldData==null)
    Provider.of<WorldDataContainer>(context, listen:false).updateWorldData(GlobalHomePage.globaldatamap); 
    var selectedRegion = Provider.of<WorldDataContainer>(context, listen:true).getselected;
    var dataPayload = Provider.of<WorldDataContainer>(context, listen:false).getWorldData;
    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              
                        child: InkWell(
                    child: Container(
                          width: MediaQuery.of(context).size.width/1.06,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5.0,0,0,5),
                                child: dataPayload[selectedRegion]!=null ? Row(
                                  children: <Widget>[
                                    Text(
                                      dataPayload[selectedRegion]["country"]
                                      ,style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1,fontSize: 12),),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          height: 15,
                                          width: 20,
                                          child: Image.network(dataPayload[selectedRegion]["flag"])),
                                      ),
                                    Spacer(),
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    //   child: Column(
                                    //     children: <Widget>[
                                    //       Text(DateTime.fromMicrosecondsSinceEpoch(int.parse(dataPayload["IN"]["updated"]) * 1000).toUtc().toString().substring(5,10),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                    //       Text(readTimestamp(int.parse(dataPayload["IN"]["updated"])),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ):Text("No Data")
                                ,
                              ),
                                Center(
                                child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                  child: Container(
                                    child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        dataPayload[selectedRegion]!=null ? Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          color: cardX==0? Color.fromRGBO(2,131,255, 1).withOpacity(0.2):Colors.transparent,
                                          child: GestureDetector(child: Padbox("CNFMD",dataPayload[selectedRegion]["cases"],"[+"+dataPayload[selectedRegion]["todayCases"]+"]",Color.fromRGBO(2,131,255, 1),MediaQuery.of(context).size.height/18,MediaQuery.of(context).size.width/4.6),
                                          onTap: (){
                                            setState(() {
                                              cardX=0;
                                              Provider.of<WorldDataContainer>(context,listen: false).updatecardN(0);
                                            });                    
                                          },
                                          ),
                                        ),
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          color: cardX==1? Colors.red.withOpacity(0.2):Colors.transparent,
                                          child: GestureDetector(child: Padbox("ACTV",dataPayload[selectedRegion]["active"],"",Color.fromRGBO(225, 0, 3, 1),MediaQuery.of(context).size.height/18,MediaQuery.of(context).size.width/4.6),
                                          onTap: (){
                                            setState(() {
                                              cardX=1;
                                              Provider.of<WorldDataContainer>(context,listen: false).updatecardN(1);
                                            });                    
                                          },
                                          ),
                                        ),
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          color: cardX==2? Colors.green.withOpacity(0.2):Colors.transparent,
                                          child: GestureDetector(child: Padbox("RECVD",dataPayload[selectedRegion]["recovered"],"",Colors.green[700],MediaQuery.of(context).size.height/18,MediaQuery.of(context).size.width/4.6),
                                          onTap: (){
                                            setState(() {
                                              cardX=2;
                                              Provider.of<WorldDataContainer>(context,listen: false).updatecardN(2);
                                            });                    
                                          },
                                          ),
                                        ),
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          color: cardX==3? Colors.black.withOpacity(0.2):Colors.transparent,
                                          child: GestureDetector(child: Padbox("DECSD",dataPayload[selectedRegion]["deaths"],"[+"+dataPayload[selectedRegion]["todayDeaths"]+"]",Colors.black87,MediaQuery.of(context).size.height/18,MediaQuery.of(context).size.width/4.6),
                                          onTap: (){
                                            setState(() {
                                              cardX=3;
                                              Provider.of<WorldDataContainer>(context,listen: false).updatecardN(3);
                                            });                    
                                          },),
                                        ),    
                                        ],
                                        ):Center(child: Text("No Data Available"),)
                                        ,
                                      ],
                                    ),
                              ),
                             ),
                            ),
                          ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                            ],
                          ) 
                          )
                        ),
            ),
            
          
                        ContentTable(
                        c1: "Counties",
                        columns: ["CNF","ACT","REC","DEC"],
                        data: [GlobalHomePage.confirmed,GlobalHomePage.active,GlobalHomePage.recovered,GlobalHomePage.deceased,],
                        rows: GlobalHomePage.cntryNames,
                        deldata: [GlobalHomePage.delconfirmed,GlobalHomePage.delactive,GlobalHomePage.delrecovered,GlobalHomePage.deldeceased],
                      ),
                

                // loading ? Container(
                //   height: MediaQuery.of(context).size.height-200,
                //   child: Center(
                //   child: Text("loading . . ."))):

  
                
              ],
              ),
    );
    
    
    
    
    
  }

  String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('HH:mm a');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      if(diff.inHours==0)
      time = 'Just Now';
      else
      time = diff.inHours.toString()+ 'HOURS AGO';

    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }

    return time;
}
}
