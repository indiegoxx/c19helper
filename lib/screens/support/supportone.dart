import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid19stat/model/nation_state_model.dart';
import 'package:provider/provider.dart';

class SupportOne extends StatefulWidget {
  @override
  _SupportOneState createState() => _SupportOneState();
}

class _SupportOneState extends State<SupportOne> {


    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
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






List<String> allItemList = [
    'CoVID-19 Testing Lab',
    'Free Food',
    'Delivery [Vegetables, Fruits, Groceries, Medicines]',
    'Hospitals and Centers',
    'Government Helpline',
    'Accommodation and Shelter Homes',
    'Other',
  ];

  static List<String> checkedItemList = [];

  List<String> selectedItemList = checkedItemList ?? [];



var _currentSelectedValue;
var userState;
var userDist;

// final dbr = Firestore.instance;


void getSupportInfo() async{


    
}


Widget _supportPannels(payload)
{
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: ExpansionTile(
      backgroundColor: Colors.lightBlue[50],
      title: Row(
        children: <Widget>[
          if(payload['category']=="Hospitals and Centers")
          Icon(FontAwesomeIcons.hospital),
          if(payload['category']=="Government Helpline")
          Icon(FontAwesomeIcons.phone),
          if(payload['category']=="CoVID-19 Testing Lab")
          Icon(FontAwesomeIcons.plus),
          if(payload['category']=="Free Food")
          Icon(Icons.fastfood),
          SizedBox(width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/2,child: Text("  "+payload["city"]+"  "+payload["category"],overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
        ],
      ),
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Organisation Name",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(payload["nameoftheorganisation"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("City",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(payload["city"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Description",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,8,20,8.0),
              child: Center(child: Text(payload["descriptionandorserviceprovided"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Service",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(payload["category"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Phone",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(child: Text(payload["phonenumber"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo,fontSize: 15)),onPressed: ()=> launch("tel://"+payload["phonenumber"]),
            ),),
            Divider(),
            IconButton(icon: Icon(Icons.link), onPressed: ()=> launch(payload["contact"])),
            Divider(),
          ],
        )
      ],
      ),
  );
  // return Text(payload["city"]+"  "+payload["category"],style: TextStyle(fontWeight: FontWeight.bold));

}

  static var stream1;
  static var stream2;
  static var stream3;
  static var state;
  Future<String> _fetchSupport()
  async {

    if(userState!=state)
    {
      setState(() {
        stream1=null;
        stream2=null;
        stream3=null;
      });
    }

    debugPrint("Streaming start");
    if((stream1==null)||(userState!=state))
    {
      debugPrint("Streaming . . .");
      state=userState;
    // stream1=await dbr.collection(_currentSelectedValue).where("category",isEqualTo: "CoVID-19 Testing Lab").getDocuments();
    // stream2=await dbr.collection(_currentSelectedValue).where("category",isEqualTo: "Hospitals and Centers").getDocuments();
    // stream3=await  dbr.collection(_currentSelectedValue).where("category",isEqualTo: "Government Helpline").getDocuments();
    setState(() {
      stream1=stream1;
      stream2=stream2;
      stream3=stream3;
    });}
    debugPrint("Streaming COmplete");
    return "hello";         
  }

  @override
  Widget build(BuildContext context) {
    
    userState = Provider.of<GlobalData>(context,listen: false).getuserState;
    userDist = Provider.of<GlobalData>(context,listen: false).getuserDist;
    _currentSelectedValue=userState;

    return FutureBuilder(
      future: _fetchSupport(),
      builder: (context,snapshot)
      {
        if(snapshot.hasData)
        return ListView(
          children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,20,0,10),
                    child: Text(("Support for " + userState).toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black54),),
                  ),
                  Divider(),
                // stream1.documents.forEach((f) => _supportPannels(f.data),
                  if((stream1==null)||(stream2==null)||(stream3==null))
                  Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: BounceInUp(child: Center(child: CircularProgressIndicator(),))),

                  if(stream1!=null)
                  for(var i=0;i<stream1.documents.length;i++)
                   _supportPannels(stream1.documents[i].data),
                  if(stream2!=null)
                  for(var i=0;i<stream2.documents.length;i++)
                   _supportPannels(stream2.documents[i].data),
                  if(stream3!=null)
                   for(var i=0;i<stream3.documents.length;i++)
                   _supportPannels(stream3.documents[i].data),
                        // if(stream1!=null)
                    //    ListView.builder(
                    //   itemCount: stream1.documents.length,
                    //   itemBuilder: (context, index) {
                    //     debugPrint(stream1.documents[index].data.toString());
                    //     return _supportPannels(stream1.documents[index].data);
                    //   },
                    // ),
                // ListView.builder(
                //       itemCount: stream2.documents.length,
                //       itemBuilder: (context, index) {
                //         debugPrint(stream2.documents[index].data.toString());
                //         return _supportPannels(stream2.documents[index].data);
                //       },
                //     ),
                //     ListView.builder(
                //       itemCount: stream3.documents.length,
                //       itemBuilder: (context, index) {
                //         debugPrint(stream3.documents[index].data.toString());
                //         return _supportPannels(stream3.documents[index].data);
                //       },
                //     ),



      //       Container(
      //         child: StreamBuilder(
      //             stream: dbr.collection(_currentSelectedValue).where("category",isEqualTo: "CoVID-19 Testing Lab").snapshots(),
      //             builder: (context, snapshot) {
      //               if (!snapshot.hasData) {
      //                 return Center(child: CircularProgressIndicator(),);
      //               }
      //               return ListView.builder(
      //                 itemCount: snapshot.data.documents.length,
      //                 itemBuilder: (context, index) {
      //                   debugPrint(snapshot.data.documents[index].data.toString());
      //                   return _supportPannels(snapshot.data.documents[index].data);
      //                 },
      //               );
      //       },
      //       ),
      // ),
      
          ],
        );
        else
        {
          return Center(child: CircularProgressIndicator(),);
        }
      }
      );
    
    
    
  }
}