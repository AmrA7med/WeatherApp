
import 'dart:convert';

import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    var LocationPosition =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    print(LocationPosition);
    lat = LocationPosition.latitude ;
    lng = LocationPosition.longitude ;
    NetworkHelper networkHelper = NetworkHelper(url: "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=$Api_key&units=metric");

    var weatherdata = await networkHelper.getdata();

    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(),),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
            size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
