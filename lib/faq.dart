import 'package:convid19update/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView.builder(
        itemCount: Datasource.questionAnswers.length,
          itemBuilder: (context, index){

        return ExpansionTile(
            title: Text(Datasource.questionAnswers[index]['question'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Roboto'
            ),),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child:           Text(Datasource.questionAnswers[index]['answer'],
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16
            ),)
            ,
          )
        ],);
      }),
    );
  }
}
