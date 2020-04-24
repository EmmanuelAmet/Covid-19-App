import 'dart:convert';
import 'package:convid19update/faq.dart';
import 'package:convid19update/datasource.dart';
import 'package:convid19update/panels/mostaffectedcountries.dart';
import 'package:convid19update/panels/worldwidepanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Share App Link/URL
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Calculator',
        text: 'Hi there, Get Global Convid-19 Tracker App on Google Play Store via the link below:',
        linkUrl: 'https://play.google.com/store/apps/details?id=com.emmanuelamet.convid19tracker',
        chooserTitle: 'Share With'
    );
  }

  //Sending  Feedback
  TextEditingController _url = new TextEditingController();

  _feedback() async {
    print('Open click');
    var url = _url.text;
    _url.text =
    "mailto:feedback.app.developer@gmail.com?subject=%20Convid-19%20Tracker%20App%20Feedback";
    if (await canLaunch(url)) {
      launch(url);
    } else {
      print('Can not launch');
    }
  }

  _moreapps() async {
    print('Open click');
    var url = _url.text;
    _url.text =
    "https://play.google.com/store/apps/developer?id=EMMANUEL+AMETEPEE";
    if (await canLaunch(url)) {
      launch(url);
    } else {
      print('Can not launch');
    }
  }

  Map worldData;
  fecthWorldData() async{

    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fecthWorldData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Covid-19 App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'Roboto'
        ),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
            },
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
              children: <Widget>[
                Column(
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: 120,
                        width: 150,
                        child:
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 10.0,
                            child: Image.asset('images/logo.jpg', height: 90,),
                          )
                      ),
                    ]

                ),

                SizedBox(height: 10,),
                Container(
                    child: Blink(
                      duration: const Duration(
                          milliseconds: 1000),
                      child: Text('Global Covid-19 App',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.amber,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0
                        ),),
                    )
                ),

                Divider(),

                new ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.amber,
                  ),
                  title: new Text('Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),

                Divider(),
                new Text('      Communicate',
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: "Roboto",
                  ),
                ),

                new ListTile(
                  leading: Icon(Icons.share,
                    color: Colors.amber,),
                  title: new Text('Share',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto"
                    ),
                  ),
                  onTap: (){
                    share();
                  },
                ),

                new ListTile(
                  leading: Icon(
                    Icons.send,
                    color: Colors.amber,
                  ),
                  title: new Text('Feedback',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),
                  ),
                  onTap: () {
                    _feedback();
                  },
                ),

                Divider(),
                new ListTile(
                  leading: Icon(
                    Icons.shop,
                    color: Colors.amber,
                  ),
                  title: new Text('More Apps',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),
                  ),
                  onTap: () {
                    _moreapps();
                  },
                ),

                Divider(),
                new ListTile(
                  leading: Icon(
                    Icons.apps,
                    color: Colors.amber,
                  ),
                  title: new Text('Version\n2.0.0',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),),
                  onTap: () {
                  },
                ),
                Divider(),
              ])
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange[100],
              ),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(Datasource.quoute,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16.0,
                      color: Colors.orange[800]
                  ),),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black12,
                    ),
                    padding: EdgeInsets.all(10.0),

                    child: Text('Global Coronavirus Update',
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",

                      ),),
                  )
                ],
              )
            ),
            worldData == null? Center(child: CircularProgressIndicator(),): WorldWidePanel(worldData: worldData,),


            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black12,
                  ),
                  padding: EdgeInsets.all(10.0),

                  child: Text('Countries with their status',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",

                    ),),
                )
            ),
           // MostAffectedPanel(),
            SizedBox(height: 10,),
            countryData == null? Center(child: CircularProgressIndicator(),): MostAffectedPanel(countryData: countryData,)
          ],
        ),
      ),
    );
  }
}


/*
  Blinking Animation
 */

class Blink extends StatefulWidget {
  Blink({this.child, this.duration});
  final Widget child;
  final Duration duration;

  @override
  createState() => new BlinkState();
}

class BlinkState extends State<Blink> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =
    new AnimationController(duration: widget.duration, vsync: this);
    final CurvedAnimation curve =
    new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 2.0, end: 0.0).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        controller.reverse();
      else if (status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new FadeTransition(
          opacity: animation,
          child: widget.child,
        ),
      ),
    );
  }
}