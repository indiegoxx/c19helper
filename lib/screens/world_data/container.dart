import 'package:covid19stat/screens/home/indiatable.dart';
import 'package:covid19stat/screens/home/nationpg3.dart';
import 'package:covid19stat/screens/world_data/global_pg1.dart.dart';
import 'package:flutter/material.dart';

import 'global_pg2.dart';


class GDetailsContainer extends StatefulWidget {

  final target;
  final loc;
  final mapT;
  const GDetailsContainer({Key key, this.target,this.loc,this.mapT}) : super(key: key);

  @override
  _GDetailsContainerState createState() => _GDetailsContainerState();
}

class _GDetailsContainerState extends State<GDetailsContainer> with SingleTickerProviderStateMixin{

  TabController _tabController;

  var mapT=1;
  @override
  void initState() {
    var idx=0;
    if(widget.target=="table")
    idx=1;
    if(widget.mapT==2)
    mapT=2;
    _tabController = new TabController(length: 2, vsync: this,initialIndex: idx);
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme : ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
          home: new Scaffold(
        appBar: TabBar(
          
              unselectedLabelColor: Colors.black45,
              labelColor: Colors.black,
              tabs: [
              Container(
                height: 30,
                child: new Tab(
                  text: "TABLE",
                  ),
              ),
              Container(
                height: 30,
                child: new Tab(
                  text: "MAP",
                ),
              ),
            ],
            controller: _tabController,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,),
        body: TabBarView(
          children: [
          GlobalBase2(),
          GlobalBase(),

        ],
        controller: _tabController,),
      ),
    );
  }
}