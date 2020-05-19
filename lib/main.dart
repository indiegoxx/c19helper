
import 'package:covid19stat/primaryscreen.dart';
import 'package:covid19stat/screens/utilsc/loading.dart';
import 'package:covid19stat/screens/utilsc/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'model/nation_state_model.dart';





Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    final dynamic data = message['data'];
  }
  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }
  }





  void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => GlobalData()),
    ],
    child: Consumer<GlobalData>(
        builder: (context, globaldata, _) {
          return MaterialApp(
      theme : ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: Loader(),
      routes: {
                "/main": (_) => new MainScreen(),
                // "/details":(_)=>new DetailsContainer(),
              },
    );}));
  }
}






class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

SharedPreferences prefs;

var _messageText;
var _tokenPush;

  static var dataMain;
  static var distData;
  static var globalData;
  var noofStates=0;
  var usr=false;
  static var x;



 



    Future<void>_fetchData() async {
              prefs = await SharedPreferences.getInstance();
              if (dataMain==null){
              print("Fetching Data");
              final responsez = await http.get("https://api.covid19india.org/zones.json");
              final response = await http.get("https://api.covid19india.org/data.json");
              final response2 = await http.get("https://api.covid19india.org/v2/state_district_wise.json");
              final response3 = await http.get("https://api.covid19india.org/states_daily.json");
              final response4= await http.get("https://api.covid19india.org/state_test_data.json");
              print("Payload Loaded");
              if (response.statusCode == 200 && response2.statusCode == 200 && response3.statusCode == 200 && responsez.statusCode == 200 && response4.statusCode == 200) {
                
                dataMain = json.decode(response.body);
                Provider.of<GlobalData>(context, listen:false).updateJsonData(json.decode(response.body), json.decode(response2.body), json.decode(response3.body),json.decode(response4.body),json.decode(responsez.body));
              } else {
                throw Exception('Failed to load photos');
              }
              var userState = prefs.getString('userState');
              var userDistrict = prefs.getString('userDistrict');
              var userCity = prefs.getString('userCity');
              if((userState!=null&&userDistrict!=null&&userCity!=null)&&(userState!=""&&userDistrict!=""&&userCity!=""))
              {
                // debugPrint(userState+"   "+userDistrict);
                Provider.of<GlobalData>(context, listen:false).updateUserData(userCity,userState,userDistrict);
                usr=true;
              }
              else{
                // debugPrint("user DNE");
                usr=false;
              }
          }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: _fetchData(),
        builder: (context, snapshot) {
          // debugPrint("User " + usr.toString());
          return Scaffold(
              body : dataMain!=null
                ? Container(child: usr ? MainScreen() : UserInf())
                : Loading(),
            );
        },
      );
  }
}