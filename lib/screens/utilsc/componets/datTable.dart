import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'table_sticky.dart';

class ContentTable extends StatefulWidget {
    List<String> rows;
    List<String> columns;
    List<List<String>> data;
    List<List<String>> deldata;
    String c1;
  @override
  ContentTable({List<String> rows,List<String> columns,List<List<String>> data,var c1,List<List<String>> deldata}){
    this.rows = rows;
    this.columns = columns;
    this.data = data;
    this.c1=c1;
    this.deldata=deldata;
  }
  _ContentTableState createState() => _ContentTableState();
}

class _ContentTableState extends State<ContentTable> {
  @override
  Widget build(BuildContext context) {
    return TableSimple(
      c1: widget.c1,
      titleColumn: widget.columns,
      titleRow: widget.rows,
      data: widget.data,
      deldata: widget.deldata,
    );
  }
}


class TableSimple extends StatefulWidget {
  var c1;

  TableSimple(
      {@required this.c1,
        @required this.data,
        @required this.titleColumn,
        @required this.titleRow,@required this.deldata,
       });

  final List<List<String>> data;
  final List<String> titleColumn;
  final List<String> titleRow;
  final List<List<String>> deldata;
  @override
  _TableSimpleState createState() => _TableSimpleState();
}

class _TableSimpleState extends State<TableSimple> {
  var sorton=[1,0,0,0];
  var sorttyp=true;
  var selSortIdx;
  var wd;
  var c;
  var cellwd;

@override
void initState() {
    super.initState();
    sortData(type: sorttyp,payload: widget.data,idx:0);
}



bool isNumeric(String s) {
 if (s == null) {
   return false;
 }
 return double.tryParse(s) != null;
}
  
String getCommas(cnt)
{
    if(isNumeric(cnt))
    {
    // var format = NumberFormat.currency(locale: 'HI');
    // cnt=format.format(int.parse(cnt));
    // cnt=cnt.substring(3,cnt.length-3);
    cnt=NumberFormat.compactCurrency(decimalDigits: 1, symbol: '').format(int.parse(cnt));
    }



    return cnt;
}
  @override
  Widget build(BuildContext context) {
    wd=MediaQuery.of(context).size.width;
    c=widget.titleColumn.length;
    cellwd=wd/(c+1.4);
    // debugPrint(sorton[0]);
    return Container(
        height: MediaQuery.of(context).size.height-150,
        color: Colors.white,
          child: StickyHeadersTable(
              cellDimensions: CellDimensions(contentCellWidth: cellwd, contentCellHeight: 40, stickyLegendWidth: (c*0.25)*wd/c, stickyLegendHeight: 60),
              columnsLength: widget.titleColumn.length,
              rowsLength: widget.titleRow.length,
              columnsTitleBuilder: (i) => FlatButton(child: Row(
              children: <Widget>[
              Text(widget.titleColumn[i],style: TextStyle(fontWeight: FontWeight.bold),),
              sorton[i]==1 ?
              sorttyp ? Icon(Icons.arrow_drop_down): Icon(Icons.arrow_drop_up):Text("")
              ],
              ),onPressed: (){
                if(selSortIdx!=i){
                selSortIdx=i;
                for(var loop=0;loop<sorton.length;loop++)
                {
                  if(loop==selSortIdx)
                  {
                    sorton[selSortIdx]=1;sorttyp=false;
                  }
                  
                  else
                  sorton[loop]=0;
                }
                }
                // debugPrint("$sorttyp");
                setState(() {
                  sorttyp=!sorttyp;
                  sortData(type: sorttyp,payload: widget.data,idx:selSortIdx);
                });

              },),
              rowsTitleBuilder: (i) => Card(
                elevation: 0,
                margin: EdgeInsets.all(0.5),
                color: i%2==0?Colors.black12.withOpacity(0.05):Colors.white,
                  child: InkWell(
                    onTap: (){
                      debugPrint(widget.titleRow[i].toString());
                    },
                    child: Container(
                    width: (c*0.25)*wd/c,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: (c*0.25)*wd/c,
                              child: AutoSizeText(
                              widget.titleRow[i],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 11),
                              textAlign: TextAlign.center,
                              ),
                        ),
                      ],
                    ),
                    ),
                  ),
              ),
              contentCellBuilder: (i, j) => dataCard(widget.data[i][j],widget.deldata[i][j],i,j),  
              legendCell: Text(widget.c1),
            ),
          
        );
  }


  void sortData({type,payload,idx})
  {
    var t;
    var loc;
    if(sorttyp==true)
    for(var i=0;i<payload[idx].length-1;i++){
      for(var j=i+1;j<payload[idx].length;j++)
      {
        if(int.parse(payload[idx][i])<int.parse(payload[idx][j]))
        {
          for(var i2=0;i2<payload.length;i2++)
          {
          t=payload[i2][i];
          payload[i2][i]=payload[i2][j];
          payload[i2][j]=t;

          t=widget.deldata[i2][i];
          widget.deldata[i2][i]=widget.deldata[i2][j];
          widget.deldata[i2][j]=t;

          }
          loc=widget.titleRow[i];
          widget.titleRow[i]=widget.titleRow[j];
          widget.titleRow[j]=loc;
        }
      }
  }
      else
      for(var i=0;i<payload[idx].length-1;i++){
      for(var j=i+1;j<payload[idx].length;j++)
      {
        if(int.parse(payload[idx][i])>int.parse(payload[idx][j]))
        {
          
          for(var i2=0;i2<payload.length;i2++)
          {
          t=payload[i2][i];
          payload[i2][i]=payload[i2][j];
          payload[i2][j]=t;

          t=widget.deldata[i2][i];
          widget.deldata[i2][i]=widget.deldata[i2][j];
          widget.deldata[i2][j]=t;
          }

          loc=widget.titleRow[i];
          widget.titleRow[i]=widget.titleRow[j];
          widget.titleRow[j]=loc;
        }
      }
  }
  // debugPrint("Sort val" + payload.toString());
  }

  Widget dataCard(p2,p3,i,j)
  {
    return Card(
              color: j%2==0?Colors.black12.withOpacity(0.05):Colors.white,
              elevation: 0,
              margin: EdgeInsets.all(0.5),
              child: Container(
              height: 40,
              width: cellwd,
              child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              width: cellwd,
                                child: AutoSizeText.rich(
                                TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                            text :
                                            i==0? p3!="0"? "↑"+p3+" ":"" +"" :
                                            i==2? p3!="0"? "↑"+p3+" ":"" +"" :
                                            i==3? p3!="0"? "↑"+p3+" ":"" +"" :
                                            "",
                                            style:  
                                            i==0? TextStyle(color: Colors.red) :
                                            i==2? TextStyle(color: Colors.green) :
                                            i==3? TextStyle(color: Colors.red) :
                                            TextStyle(),
                                      ),
                                      TextSpan(text: p2!="0"? getCommas(p2)+" ":"-" +" ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),
                                    ],
                                  ),
                                  textAlign: TextAlign.end,
                                // wrapWords: true,
                              ),
                            ),
                          ],
                        ),
                        
                  ),
              );
  }


}