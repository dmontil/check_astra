import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:check_astra/models/genericScooterCanbus.dart';
import 'package:check_astra/models/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

abstract class CommandsLogic {
  Future<dynamic> postCommand(String action, String imei);
  Future<dynamic> scan();
  Future<dynamic> find(String imei);
  Future<dynamic> genericInfo(String imei);
}

class CommandsException implements Exception {}

class AstraProvider extends CommandsLogic {
  static String url =
      "http://sandbox.api.astraiot.co.uk:9001/api/v1/scooters/";
  @override
  Future<dynamic> postCommand(String action, String imei) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var body = json.encode({"command": "$action"});// 357520071096255
    var response = await http.post(url+"358887096712185"+"/command", headers: headers, body: body);
    var resp = response.body;
    print(resp);
    return response;
  }

  Future scan() async{
    try{
      String barcode = await BarcodeScanner.scan();

      return barcode;

    }on PlatformException catch (e){

    }
  }
  Future find(String imei) async {
  /*  Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var response = await http.get(url+imei,headers: headers);
    print(response.body);

    var responseData = json.decode(response.body);
// 41.409633,2.1869663
    if(responseData['gps_data']){
      Position data = Position.fromJson(responseData);
      final LatLng position = LatLng(data.latitude,data.longitude);
      return position;
    }*/
    final LatLng position = LatLng(41.409854,2.189176);

    return position;
  }

  @override
  Future genericInfo(String imei) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var response = await http.get(url+imei,headers: headers);
    var responseData = json.decode(response.body);

    if(responseData['data']){
      GenericScooterCanbus data = GenericScooterCanbus.fromJson(responseData['data']);
      return data;
    }
    return null;
  }
}
