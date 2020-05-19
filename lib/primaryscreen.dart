
import 'dart:convert';
import 'package:covid19stat/screens/graphs/graphscreen.dart';
import 'package:covid19stat/screens/home/home_pg1.dart';
import 'package:covid19stat/screens/support/supportone.dart';
import 'package:covid19stat/screens/utilsc/infoscreen.dart';
import 'package:covid19stat/screens/utilsc/userInfo.dart';
import 'package:covid19stat/screens/utilsc/userinfo2.dart';
import 'package:covid19stat/screens/world_data/container.dart';
import 'package:covid19stat/screens/world_data/global_pg1.dart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/nation_state_model.dart';
import 'package:share/share.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



    static var dataMain;
  static var distData;
  static var globalData;
  var noofStates=0;
  var usr=false;
  static var x;



 



    Future<void>_fetchData() async {
              // prefs = await SharedPreferences.getInstance();
              if (true){
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
              
          }
          final snackBar = SnackBar(
            backgroundColor: Colors.green,            
            content: Text('Latest Data Loaded',style: TextStyle(color: Colors.white),),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
  }















  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        
          icon: new Icon(Icons.home,size: 22),
          title: new Text('')
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.show_chart,size: 22),
        title: new Text(''),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.language,size: 22),
          title: Text('')
      ),
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.solidHeart ,color: Colors.red,size: 23,),
          title: Text('')
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
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

  var stateC;
  var stCode;
  Widget buildPageView() {
    PageController x;
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        MainHome(pageController),
        // Container(),
        GraphsScreen(x),
        GDetailsContainer(),
        SupportOne(),
      ],
    );
  }
  var usrState;

  @override
  void initState() {
    if(stCode==null){
    usrState = Provider.of<GlobalData>(context,listen: false).getuserState;
    if(usrState!=null)
    {
    stCode=titleToCode(usrState);
    if(stCode!="")
    Provider.of<GlobalData>(context, listen:false).updategraphT(stCode);
    }
  
    }
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.jumpToPage(index);
    });
  }
  
final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  @override
  Widget build(BuildContext context) {
    getList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        textTheme: TextTheme(title: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
            IconButton(iconSize: 20,icon: Icon(Icons.share), onPressed: (){
              Share.share('Open Source COVID-19 Data Tracker ✔ https://bit.ly/c19helper', subject: 'Help friends and family track COVID19 live ✔');
            }),
            IconButton(iconSize: 20,
              icon: Icon(
                  Icons.location_on,
                  size: 20
                ),
              onPressed: () {
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(builder: (context) => UserInf()),
                      // );
                _settingModalBottomSheet(context);
              }
            ),
            IconButton(iconSize: 20,icon: Icon(Icons.info), onPressed: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoScreen()),
                      );
            },)
          ],
          title: new Text("C19",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
      ),
      body: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        height: 60,
        // animSpeedFactor: ,
        springAnimationDurationInMilliseconds: 300,
        key: _refreshIndicatorKey,	// key if you want to add
        onRefresh: _fetchData,
        child: buildPageView()),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,   // <-- HERE
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.black87),
        unselectedIconTheme: IconThemeData(color: Colors.black45),
        selectedLabelStyle: TextStyle(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.black,   
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }

  var _currentSelectedValue;
  var  _dcurrentSelectedValue;
  var validated=false;
  var selectDist=false;
  List<String> myDist;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    dynamic dist;
    var response;
    Future<void> getList()async{
    if(dist==null){
    response = await http.get("https://raw.githubusercontent.com/indiegoxx/jsonhosting/master/sate_Dist.json");
    dist=json.decode(response.body);
    debugPrint(">>>>>>>>>>"+dist.toString());
    }
    }

    final List<String> myState=[
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal", 
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu", 
    "Delhi",
    "Jammu and Kashmir",
    "Ladakh", 
    "Lakshadweep", 
    "Puducherry", 
  ];










Future<void> _settingModalBottomSheet(context) async {
  // _currentSelectedValue= Provider.of<GlobalData>(context,listen: false).getuserState;
  // _dcurrentSelectedValue=Provider.of<GlobalData>(context,listen: false).getuserDist;



    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Center(
            child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
        return Container(

                   child : Column(
                     children: <Widget>[
                       Center(child: Row(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(Icons.location_on,size: 15,),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Text("Location" , style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                           )
                         ],
                       )
                       ,),
                       Divider(
                         height: 0,
                       ),
                       Padding(
                         padding: const EdgeInsets.all(08.0),
                         child: InputDecorator(
                         decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Select Your State',
                          labelText: 'Select Your State',
                          prefixIcon: const Icon(Icons.location_city, color: Colors.black,),
                          prefixText: ' ',
                          suffixStyle: const TextStyle(color: Colors.black)

                            ),
                  child: DropdownButton<String>(
                  value: _currentSelectedValue,
                  iconSize: 15,
                  elevation: 1,
                  onChanged: (String newValue) {
                            setState(() {
                                    _dcurrentSelectedValue=null;
                                    _currentSelectedValue = newValue;
                                    // state.didChange(newValue);
                                    debugPrint(dist[_currentSelectedValue].toString());
                                    debugPrint(dist[_currentSelectedValue].toString());
                                    myDist=<String>[...dist[_currentSelectedValue]] ;
                                    selectDist=true;
                                    validated=false;
                            });
                  },
                  items: myState
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                  }).toList(),
                ),
                         ),
                       ),
                  selectDist? Padding(
                    padding: const EdgeInsets.all(08.0),
                    child: InputDecorator(
                          decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Select Your District',
                          labelText: 'Select Your District',
                          prefixIcon: const Icon(Icons.location_city, color: Colors.black,),
                          prefixText: ' ',
                          suffixStyle: const TextStyle(color: Colors.black)

                            ),
                                          child: DropdownButton<String>(
                      
                      value: _dcurrentSelectedValue,
                      iconSize: 15,
                      elevation: 1,

                      onChanged: (String newValue) {
                            setState(() {
                              debugPrint(_dcurrentSelectedValue);
                                _dcurrentSelectedValue = newValue;
                                // state.didChange(newValue);
                                validated=true;
                            });
                      },
                      items: myDist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                      }).toList(),
                ),
                    ),
                  ):
                Center(),
                RaisedButton(
                      
                      onPressed: validated ? ()async{
                        Navigator.pop(context);
                      // Navigator.pushReplacementNamed(context, "/main");
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('userState', _currentSelectedValue);
                      prefs.setString('userDistrict', _dcurrentSelectedValue);
                      prefs.setString('userCity', "City");
                      Provider.of<GlobalData>(context, listen: false).updateUserData("city",_currentSelectedValue,_dcurrentSelectedValue);
                      var t = prefs.getString("token");

                      pageController.jumpToPage(3);
                      pageController.jumpToPage(0);
                    } : null, child: Text("Start"),color: Colors.white,),
                     ],
                   ),
        );
      })
        );
      }
    );
}


}





