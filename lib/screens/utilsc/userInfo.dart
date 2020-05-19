import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:covid19stat/model/nation_state_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
  

  class UserInf extends StatefulWidget {
    @override
    _UserInfState createState() => _UserInfState();
  }
  
  class _UserInfState extends State<UserInf> {
    
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    dynamic dist;
    var response;
    void getList()async{
    response = await http.get("https://raw.githubusercontent.com/indiegoxx/jsonhosting/master/sate_Dist.json");
    dist=json.decode(response.body);
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
  
  
  var _currentSelectedValue;
  var  _dcurrentSelectedValue;
  var validated=false;
  var selectDist=false;
  List<String> myDist;

    @override
    Widget build(BuildContext context) {
      getList();
      return 
      BounceInUp(
            child: Scaffold(
            body: Center(
            child: Card(
                elevation: 5,
                child: Container(
                width: MediaQuery.of(context).size.width/1.01,
                child: new Form(
                  key: this._formKey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Details",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                        return InputDecorator(
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)
                          ),
                          hintText: 'Select Your State',
                          labelText: 'Select Your State',
                          prefixIcon: const Icon(Icons.location_on, color: Colors.green,),
                          prefixText: ' ',
                          suffixStyle: const TextStyle(color: Colors.green)

                            ),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                            hint: Text("My State"),
                            value: _currentSelectedValue,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _dcurrentSelectedValue=null;
                                _currentSelectedValue = newValue;
                                state.didChange(newValue);
                                selectDist=true;
                                debugPrint(dist[_currentSelectedValue].toString());
                                myDist=<String>[...dist[_currentSelectedValue]] ;
                              });
                            },
                            items: myState.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                    );
                  },
                ),
                      ),
                if((selectDist==true)&&(myDist!=null))
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)
                          ),
                          hintText: 'Select Your District',
                          labelText: 'Select Your District',
                          prefixIcon: const Icon(Icons.location_city, color: Colors.green,),
                          prefixText: ' ',
                          suffixStyle: const TextStyle(color: Colors.green)

                            ),
                            isEmpty: _dcurrentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                            hint: Text("My District"),
                            value: _dcurrentSelectedValue,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _dcurrentSelectedValue = newValue;
                                state.didChange(newValue);
                                validated=true;
                              });
                            },
                            items: myDist.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,0,0),
                    child: RaisedButton(
                      
                      onPressed: validated ? ()async{
                        
                      Navigator.pushReplacementNamed(context, "/main");
                      // Navigator.pop(context);
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('userState', _currentSelectedValue);
                      prefs.setString('userDistrict', _dcurrentSelectedValue);
                      prefs.setString('userCity', "City");
                      Provider.of<GlobalData>(context, listen:false).updateUserData("city",_currentSelectedValue,_dcurrentSelectedValue);
                      var t = prefs.getString("token");

                    } : null, child: Text("Start"),color: Colors.white,),
                  )
                  ],
                  ),
                )
              ),
            ),
          ),
        ),
      );

    }
  }