import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  var internet = true;


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 10), () {
      setState(() {
        internet=false;
      });
    }
    );

    return Scaffold(
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
                child: Image(height: 100,width: 100,image: AssetImage('assets/launcher/19.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: internet ? FadeIn(delay: Duration(seconds: 2), child: 
              SizedBox(
                width: 100,height: 3,
                              child: LinearProgressIndicator(
                  backgroundColor: Colors.black12,),
              )) : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Cant connect to Mothership . . . ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                  Text("Try again In a while", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}