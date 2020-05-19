import 'package:covid19stat/screens/home/indiatable.dart';
import 'package:covid19stat/screens/home/nationpg3.dart';
import 'package:flutter/material.dart';


class DetailsContainer extends StatefulWidget {

  final target;
  final loc;
  final mapT;
  const DetailsContainer({this.target,this.loc,this.mapT});

  @override
  _DetailsContainerState createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> with SingleTickerProviderStateMixin{

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
    return Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          // title: Text("Nation Table",style: TextStyle(color: Colors.black),),
          title : TabBar(
            unselectedLabelColor: Colors.black45,
            labelColor: Colors.black,
            tabs: [
            new Tab(
              text: "MAP",
              ),
            Tab(
              child: Text("TABLE"),
              // text: "TABLE",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,)
        ),
        // body: NationTable(),
        body: TabBarView(
            children: [
          
          NationPage3Screen(mapT: mapT,loc: widget.loc),
          NationTable(),
        ],
        controller: _tabController,),
      );
  }
}