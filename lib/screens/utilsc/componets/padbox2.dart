import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Padbox2 extends StatelessWidget {


  String labl;
  String cnt;
  String dcnt;
  var col;
  var wd;
  var ht;

  Padbox2(String labl,String cnt,String dcnt,col,wd,ht)
  {
    this.wd=wd;
    this.ht=ht;
    this.labl=labl;
    this.cnt=cnt;
    this.dcnt=dcnt;
    this.col=col;
  }

  bool isNumeric(String s) {
 if (s == null) {
   return false;
 }
 return double.tryParse(s) != null;
}

  @override
  Widget build(BuildContext context) {

    if(isNumeric(cnt))
    {
    var format = NumberFormat.currency(locale: 'HI');
    cnt=format.format(int.parse(cnt));
    cnt=cnt.substring(3,cnt.length-3);
    }

    final boxHT=wd+20;
    final boxWD=ht;
    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                        // height: boxHT,
                        // width: boxWD,
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  AutoSizeText(
                                    cnt,
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: col),maxLines: 1,
                                    minFontSize: 10,
                                    ),
                                    AutoSizeText(
                                dcnt,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2,color: col),
                                maxLines: 1,
                                minFontSize: 5,

                                ),
                                ],
                              ),
                                
                                AutoSizeText(
                                labl,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,letterSpacing: 1,color: col),maxLines: 1,
                                minFontSize: 4,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
  }



}