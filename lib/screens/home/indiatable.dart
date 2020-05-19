import 'package:covid19stat/model/nation_state_model.dart';
import 'package:covid19stat/screens/utilsc/componets/nationTable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NationTable extends StatelessWidget {
    List<String> distNames=[];
    List<String> confirmed=[];
    List<String> active=[];
    List<String> recovered=[];
    List<String> deceased=[];
    List<String> delactive=[];
    List<String> delconfirmed=[];
    List<String> delrecovered=[];
    List<String> deldeceased=[];
    dynamic dataMain;
  @override
  Widget build(BuildContext context) {
    List<String> distNames=[];
    List<String> confirmed=[];
    List<String> active=[];
    List<String> recovered=[];
    List<String> deceased=[];
    List<String> delactive=[];
    List<String> delconfirmed=[];
    List<String> delrecovered=[];
    List<String> deldeceased=[];
    dataMain=Provider.of<GlobalData>(context, listen:false).getmainPayload;
    dataMain["statewise"].forEach((dat)
    {
      distNames.add(dat["state"].toString());
      confirmed.add(dat["confirmed"].toString());
      active.add(dat["active"].toString());
      recovered.add(dat["recovered"].toString());
      deceased.add(dat["deaths"].toString());
      delactive.add("");
      delconfirmed.add(dat["deltaconfirmed"].toString());
      delrecovered.add(dat["deltarecovered"].toString());
      deldeceased.add(dat["deltadeaths"].toString());
      debugPrint("------"+dat["state"].toString());
    }
    );
    return Scaffold(
        body: Container(
        height: MediaQuery.of(context).size.height,
        child: NationDataTable(
          c1: "Countries",
                columns: ["CNF","ACT","REC","DEC",],
                data: [confirmed,active,recovered,deceased,],
                rows: distNames,
                deldata: [delconfirmed,delactive,delrecovered,deldeceased],
        ),
      ),
    );
  }
}