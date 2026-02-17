
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_construction/login/login.dart';
import 'package:flutter_construction/screens/project_type.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key}); 
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>FirstSlide(userName: "userName", Login: () => {ProjectType},)));
    });
    // TODO: implement initState
    super.initState();
  }
 // Corrected constructor name
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 40), // Added height to SizedBox
              Image.asset("assets/images/house.png", width: 300,),
              Text(
                "Hi, welcome to the wonderful world",
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              
              
              ),
            ],
          ),
        ),
      ),
    );
  }

}