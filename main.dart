import 'package:flutter/material.dart';
import 'package:flutter_construction/login/splash_screen.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

const apiKey = "AIzaSyCBdLjgyBA_6_nWINa3nwLnhGysXIU0Sv0";



void main()  {
  Gemini.init(apiKey: apiKey, enableDebugging: true);

  runApp(
    MaterialApp(
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
      
      ),
  );
}