import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Padbox extends StatelessWidget {


  String labl;
  String cnt;
  String dcnt;
  var col;
  var wd;
  var ht;

  Padbox(String labl,String cnt,String dcnt,col,wd,ht)
  { this.wd=wd;
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
    if(int.parse(cnt)>1000000)
    {
    cnt=NumberFormat.compactCurrency(decimalDigits: 1, symbol: '').format(int.parse(cnt));
    }
    else{
    var format = NumberFormat.currency(locale: 'HI');
    cnt=format.format(int.parse(cnt));
    cnt=cnt.substring(3,cnt.length-3);
    }
    }

    final boxHT=wd+30;
    final boxWD=ht;
    return Center(
                child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      color: Colors.transparent,
                      elevation: 0,
                        child: Container(
                        height: boxHT,
                        width: boxWD,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              AutoSizeText(
                                dcnt,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2,color: col),
                                maxLines: 1,
                                minFontSize: 5,
                                
                                ),
                              AutoSizeText(
                                cnt,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: col),maxLines: 1,
                                minFontSize: 10,
                                maxFontSize: 20,
                                ),
                                AutoSizeText(
                                labl,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,letterSpacing: 1,color: col),maxLines: 1,
                                minFontSize: 4,
                                maxFontSize: 9,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              
  }



}