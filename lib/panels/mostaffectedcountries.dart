import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final countryData;
  const MostAffectedPanel({Key key, this.countryData}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black12,
            boxShadow: [
              BoxShadow(color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0,10))
            ]
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: <Widget>[
              Image.network(countryData[index]['countryInfo']['flag'], width: 100, height: 80,),
              SizedBox(width: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(countryData[index]['country'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                        ),),
                    SizedBox(width: 10,),
                    Text('Cases: ' + countryData[index]['cases'].toString(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),),
                    SizedBox(width: 10,),
                    Text('Today Cases: ' + countryData[index]['todayCases'].toString(),
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),),
                    SizedBox(width: 10,),
                    Text('Deaths: ' + countryData[index]['deaths'].toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),),
                    SizedBox(width: 10,),
                    Text('Today Deaths: ' + countryData[index]['todayDeaths'].toString(),
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),),
                    SizedBox(width: 10,),
                    Text('Recovered: ' + countryData[index]['recovered'].toString(),
                      style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'
                      ),),
                    SizedBox(width: 10,),
                    Text('Active: ' + countryData[index]['active'].toString(),
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'
                      ),),
                    SizedBox(width: 10,),
                    Text('Critical: ' + countryData[index]['critical'].toString(),
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'
                      ),),
                    SizedBox(width: 10,),
                    Text('Cases Per Million: ' + countryData[index]['casesPerOneMillion'].toString(),
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'
                      ),),
                    SizedBox(width: 10,),
                    Text('Deaths Per Million: ' + countryData[index]['deaths'].toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'
                      ),),
                  ],
                ),
            ],
          ),
        );
    },
        //itemCount: 15,
        itemCount: countryData==null?0:countryData.length,
      )

    );
  }
}
