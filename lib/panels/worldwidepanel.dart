import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldData;
  const WorldWidePanel({Key key, this.worldData}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      children: <Widget>[
        StatusPanel(
          title: 'Confirm',
          paneColor: Colors.red[100],
          textColor: Colors.red,
          count: worldData['cases'].toString(),
        ),
        StatusPanel(
          title: 'Active',
          paneColor: Colors.blue[100],
          textColor: Colors.blue,
          count: worldData['active'].toString(),
        ),
        StatusPanel(
          title: 'Recovered',
          paneColor: Colors.green[100],
          textColor: Colors.green,
          count: worldData['recovered'].toString(),
        ),
        StatusPanel(
          title: 'Death',
          paneColor: Colors.blueGrey[100],
          textColor: Colors.blueGrey,
          count: worldData['deaths'].toString(),
        ),
        StatusPanel(
          title: 'Today Cases',
          paneColor: Colors.brown[100],
          textColor: Colors.brown,
          count: worldData['todayCases'].toString(),
        ),
        StatusPanel(
          title: 'Today Deaths',
          paneColor: Colors.pink[100],
          textColor: Colors.pink,
          count: worldData['todayDeaths'].toString(),
        ),
        StatusPanel(
          title: 'Critical',
          paneColor: Colors.amber[100],
          textColor: Colors.amber,
          count: worldData['critical'].toString(),
        ),
        StatusPanel(
          title: 'Cases Per million',
          paneColor: Colors.deepOrange[100],
          textColor: Colors.deepOrange,
          count: worldData['casesPerOneMillion'].toString(),
        ),
        StatusPanel(
          title: 'Death Per Million',
          paneColor: Colors.cyan[100],
          textColor: Colors.cyan,
          count: worldData['deathsPerOneMillion'].toString(),
        ),
        StatusPanel(
          title: 'Affected Countries',
          paneColor: Colors.purple[100],
          textColor: Colors.purple,
          count: worldData['affectedCountries'].toString(),
        ),
        StatusPanel(
          title: 'Updated',
          paneColor: Colors.indigo[100],
          textColor: Colors.indigo,
          count: worldData['updated'].toString(),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color paneColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.paneColor, this.textColor, this.title, this.count}):super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: paneColor,
          boxShadow: [
            BoxShadow(color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0,10))
          ]
      ),

      height: 80,
      margin: EdgeInsets.all(5.0),
      //color: paneColor,
      width: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
            style: TextStyle(
              color: textColor,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),),

          Text(count,
            style: TextStyle(
              fontFamily: "Roboto",
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),),



        ],
      ),
    );
  }
}
