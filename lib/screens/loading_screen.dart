
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
@override
  void initState() {
  _getPosition();

    super.initState();
  }
  double? lat ;
double? lng ;
var Api_key = "3019a3b202c04287447d66b0de9c7110" ;
Future _getPosition()  async{
  var LocationPosition =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  print(LocationPosition);
  lat = LocationPosition.latitude ;
  lng = LocationPosition.longitude ;
  getData();

}
getData() async{
 var response =  await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=$Api_key"));
print(response.body);

}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(),),);
          },
          child: Text('click to go to LocationScreen'),
        ),
      ),
    );
  }
}
