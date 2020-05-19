import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalData with ChangeNotifier{

  dynamic mainData; //for Statewise CARD + No Of Tests + graphDataNationCARD
  dynamic distData; //for District wise Confirmed Cases
  dynamic stateGraph; //for Statewise Graphing Data
  dynamic globalData; //for Global Data
  dynamic stateTestData;//for State Test Data
  dynamic token;
  dynamic zones;

  static var userState;
  static var userDistrict;
  static var userCity;
  var user=false;
  var homeChartMsg="";
  var homeChartMsgDt="";
  var selectedGraph;
  
  List<String> _listOfStrings = [];
  List<String> get getListOfStrings => _listOfStrings;
  dynamic get getmainPayload => mainData;
  dynamic get getdistData => distData;
  dynamic get getglobalData => globalData;
  dynamic get getTestData => stateTestData;
  dynamic get getstategraph => stateGraph;
  dynamic get getzones => zones;
  String get getuserState => userState;
  String get getuserDist => userDistrict;
  String get getuserCity => userCity;
  String get getToken => token;
  String get gethomeChartMsg => homeChartMsg;
  String get gethomeChartMsgDt => homeChartMsgDt;
   String get getgraphT => selectedGraph;
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


   void updategraphT(c){
     selectedGraph=c;
     debugPrint("-------------------------------------$selectedGraph");
     notifyListeners();
   }


  void updateCharts(x,y)
  {
    debugPrint(x + "  " + y);
    homeChartMsg=x;
    homeChartMsgDt=y;
    // notifyListeners();
  }

  void updateJsonData(mnData,dtData,stGraph,td,z) {
    debugPrint("JSON UPDATE user Data");
    mainData=mnData;
    distData=dtData;
    stateGraph=stGraph;
    stateTestData=td;
    zones=z;
    
    notifyListeners();
  }


  void updateToken(String t)
  {token=t;}


  void updateUserData(String c,String s,String d)
  {
    user=true;
    userCity=c;
    userState=s;
    userDistrict=d; 
    selectedGraph=titleToCode(userState);
    debugPrint("State =$userState   dist=$userDistrict");
    // UpdateShouldNotify()
    notifyListeners();
  }

  void clearUserData() async
  {
    debugPrint("clearing user Data");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userState', null);
    prefs.setString('userDistrict', null);
    prefs.setString('userCity', null);
    user=false;
    userCity=null;
    userState=null;
    userDistrict=null; 
    notifyListeners();
  }


}