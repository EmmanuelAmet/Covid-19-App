import 'package:flutter/material.dart';
import 'package:convid19update/homepage.dart';


void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home()
    )
  );
}