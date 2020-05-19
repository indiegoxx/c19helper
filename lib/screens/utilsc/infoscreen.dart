//simport 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoScreen extends StatefulWidget {


  @override
  _InfoScreen createState() => _InfoScreen();
}

class _InfoScreen extends State<InfoScreen> {


  


  PageController _pageController;
  double _pageIndex;
  List<String> _ques=[];
  List<String> _answ=[];
  List _sources=[];
    @override
  void initState(){
    _ques.add('What are your resources ? how is the data gathered for this project?');
    _ques.add('How is your app different from other apps ?');
    _ques.add('Are you willing to help ?');
    _ques.add('Why you made the app ?');
    _ques.add('Why are you guys putting in time and resources to do this while not gaining a single penny from it?');
    
    
    _answ.add('We are using publicly available data from covid19india.org, Johns Hopkins University, etc. Covid19india.org is a crowdsourced virus-infected patient tracker operated by a group of non-profit volunteers collecting and verifying data from various sources such as state press bulletin, official handles, PBI, Press Trust of India, ANI Reports. John Hopkins University is monitoring the global reach of COVID-19 by aggregating data from multiple credible sources.');
    _answ.add('We don\'t collect your data and we respect your privacy. We notify you whenever your district has new cases. We also trying to provide a list of persons/institutes responsible for providing essential commodities and medical assistance in your locality.');
    _answ.add('We are a small team and it would be a great thing to help us and the country . We need volunteers to collect and verify the contact details of the person providing food and persons giving home delivery. You can contact us via telegram, mail, or feedback form available on the appbar.');
    _answ.add('It is a non-profit voluntary initiative to help our people in need and to provide a platform to the person who want to help the needy.we also wanted to create a simple go-to app that could help people understand the level of threat caused by this pandemic in their locality.');
    _answ.add('Because it affects all of us. Today it"s someone else who is getting infected; tomorrow it could be us. We need to prevent the spread of this virus. We need to document the data so that people with knowledge can use this data to make informed decisions.');

    _sources.add('https://covid19india.org\n\nhttps://api.covid19india.org/data.json\n\nhttps://api.covid19india.org/state_district_wise.json\n\nhttps://api.covid19india.org/v2/state_district_wise.json\n\nhttps://api.covid19india.org/travel_history.json\n\nhttps://api.covid19india.org/raw_data.json\n\nhttps://api.covid19india.org/states_daily.json');
    

    _pageController= new PageController(initialPage: 0);
    
    _pageIndex=0;

    _pageController.addListener((){
      setState(() {
        _pageIndex=_pageController.page;
      });
    });
    
    super.initState();
  }



  @override
  Widget build(BuildContext context){


    


    return Scaffold(
        backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,10,0),
            child: IconButton(onPressed: ()=>launch("https://forms.gle/KJqXVnwPNTn33Q8h9"),icon: Icon(Icons.send),),
          ),
          IconButton(onPressed: ()=>launch("https://forms.gle/vqq4B2BjYwn6kMn96"),icon: Icon(FontAwesomeIcons.bug),),
        ],
         
      ),
      
      body: Center(
      child: Stack(

        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
                      children: [Expanded(
              child: PageView(
                
                scrollDirection: Axis.vertical,
                controller: _pageController,
                children: <Widget>[

                  

                  Container(
                    padding: EdgeInsets.only(left:25, right:25),
                    child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                            Padding(
                              padding: EdgeInsets.only(left:0, top:12, bottom: 5),
                              child: Text(
                                _ques[index],
                                style: TextStyle(color: Colors.blue, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.bold), 
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 15),
                              child: Text(
                                _answ[index],
                                style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.w500), 
                              ),
                            ),
                            //SizedBox()
                          ]
                        );
                      }
                    )
                  ),
                  Container(padding: EdgeInsets.only(left:25, right:25),
                    child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                            Padding(
                              padding: EdgeInsets.only(left:0, top:15, bottom: 10),
                              child: Text(
                                'SOURCE:',
                                style: TextStyle(color: Colors.blue, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.bold), 
                              ),
                            ),

                            //Under construction
                            Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 18),
                              child:  InkWell( 
                                child: Text(
                                "https://covid19india.org",
                                style: TextStyle(color:Colors.blueGrey, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.normal), 
                               
                              ),onTap: () => launch("https://www.covid19india.org")),
                              
                            ),
                             Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 18),
                              child:  InkWell( 
                                child: Text(
                                "https://api.covid19india.org/data.json",
                                style: TextStyle(color:Colors.blueGrey, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.normal), 
                               
                              ),onTap: () => launch("https://api.covid19india.org/data.json")),
                              
                            ),
                             Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 18),
                              child:  InkWell( 
                                child: Text(
                                "https://api.covid19india.org/state_district_wise.json",
                                style: TextStyle(color:Colors.blueGrey, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.normal), 
                               
                              ),onTap: () => launch("https://api.covid19india.org/state_district_wise.json")),
                              
                            ),
                             Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 18),
                              child:  InkWell( 
                                child: Text(
                                "https://api.covid19india.org/v2/state_district_wise.json",
                                style: TextStyle(color:Colors.blueGrey, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.normal), 
                               
                              ),onTap: () => launch("https://api.covid19india.org/v2/state_district_wise.json")),
                              
                            ),
                             Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 18),
                              child:  InkWell( 
                                child: Text(
                                "https://api.covid19india.org/travel_history.json",
                                style: TextStyle(color:Colors.blueGrey, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.normal), 
                               
                              ),onTap: () => launch("https://api.covid19india.org/travel_history.json")),
                              
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 18),
                              child:  InkWell( 
                                child: Text(
                                "https://api.covid19india.org/raw_data.json",
                                style: TextStyle(color:Colors.blueGrey, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.normal), 
                               
                              ),onTap: () => launch("https://api.covid19india.org/raw_data.json")),
                              
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:0, top:5, bottom: 18),
                              child:  InkWell( 
                                child: Text(
                                "https://api.covid19india.org/states_daily.json",
                                style: TextStyle(color:Colors.blueGrey, fontSize: Theme.of(context).textTheme.title.fontSize, fontWeight: FontWeight.normal), 
                               
                              ),onTap: () => launch("https://api.covid19india.org/states_daily.json")),
                              
                            ), 
                            //SizedBox()
                          ]
                        );
                      }
                    )
                   ),
          
                  Container(
                    padding: EdgeInsets.only(left:25, right:25),
                    child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget>[
                            Divider(),
                            BounceInUp(
                            duration: Duration(milliseconds: 1500),
                            child: Column(
                              children: <Widget>[
                                Image(height: 100,width: 100,image: AssetImage('assets/launcher/19.png')),
                                BounceInUp(child: Text("BETA - 0.0.2"))
                              ],
                            )),

                            Padding(
                              padding: EdgeInsets.only(left:0, top:70, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Powered By : ',
                                    style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold), 
                                  ),
                                  FlatButton(child: Text("covid19india.org",style: TextStyle(color: Colors.white),),onPressed: ()=> launch("http://api.covid19india.org"),color: Colors.blue,)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:15, top:5, bottom: 15),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Maintained by".toUpperCase(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                                  ),
                                  Divider()
                                  ,Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Shubham Sinha',
                                      style: TextStyle(color:Colors.black54, fontSize: 12, fontWeight: FontWeight.w600), 
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Sagen Tiriya',
                                      style: TextStyle(color:Colors.black54, fontSize: 12, fontWeight: FontWeight.w600), 
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            //SizedBox()
                          ]
                        );
                      }
                    ),
                  ),
                ],
              )
              
                  )],
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
              //color: Colors.green,
              width: 30,
              height:180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: 30,
                        height: 50,
                        decoration: BoxDecoration(
                          color: (_pageIndex<=0.5)?Colors.lightGreen.withOpacity(0.5):Colors.black26,
                        ),           
                      ),
                      onTap: (){
                        _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 30,
                        height: 50,
                        decoration: BoxDecoration(
                          color: (_pageIndex>=0.6 && _pageIndex<=1.5)?Colors.lightGreen.withOpacity(0.5):Colors.black26,
                        ),
                      ),
                      onTap: (){
                        _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 30,
                        height: 50,
                        decoration: BoxDecoration(
                          color: (_pageIndex>=1.6)?Colors.lightGreen.withOpacity(0.5):Colors.black26,
                        ),
                      ),
                      onTap: (){
                        _pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                    ),
                  ]
                )
              
            ),
          ),
        ]
      )
          
    )
      );

    
  }
}