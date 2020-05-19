// import 'dart:convert';

// import 'package:animate_do/animate_do.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:covid19stat/model/nation_state_model.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
  

//   class UserInf2 extends StatefulWidget {
//     @override
//     _UserInf2State createState() => _UserInf2State();
//   }
  
//   class _UserInf2State extends State<UserInf2> {
    
//     final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//     dynamic dist;
//     var response;
//     void getList()async{
//     response = await http.get("https://raw.githubusercontent.com/indiegoxx/jsonhosting/master/sate_Dist.json");
//     dist=json.decode(response.body);
//     }

    


//     final List<String> myState=[
//     "Andhra Pradesh",
//     "Arunachal Pradesh",
//     "Assam",
//     "Bihar",
//     "Chhattisgarh",
//     "Goa",
//     "Gujarat",
//     "Haryana",
//     "Himachal Pradesh",
//     "Jharkhand",
//     "Karnataka",
//     "Kerala",
//     "Madhya Pradesh",
//     "Maharashtra",
//     "Manipur",
//     "Meghalaya",
//     "Mizoram",
//     "Nagaland",
//     "Odisha",
//     "Punjab",
//     "Rajasthan",
//     "Sikkim",
//     "Tamil Nadu",
//     "Telangana",
//     "Tripura",
//     "Uttarakhand",
//     "Uttar Pradesh",
//     "West Bengal", 
//     "Andaman and Nicobar Islands",
//     "Chandigarh",
//     "Dadra and Nagar Haveli",
//     "Daman and Diu", 
//     "Delhi",
//     "Jammu and Kashmir",
//     "Ladakh", 
//     "Lakshadweep", 
//     "Puducherry", 
//   ];
  
  
//   var _currentSelectedValue;
//   var  _dcurrentSelectedValue;
//   var validated=false;
//   var selectDist=false;
//   List<String> myDist;

//     @override
//     Widget build(BuildContext context) {
//       getList();
//       return 
//       BounceInUp(
//             child: Scaffold(
//             body: Center(
//             child: Container(

//                    child : 
            
//         )
//           ),
//         ),
//       );

//     }
//   }