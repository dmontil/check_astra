import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

abstract class CommandsLogic {
  Future<dynamic> postCommand(String action, String imei);
  Future<dynamic> scan();
  Future<dynamic> find(String imei);
}

class CommandsException implements Exception {}

class AstraProvider extends CommandsLogic {
  static String url =
      "http://sandbox.api.astraiot.co.uk:9001/api/v1/scooters/358887096737851/command";
  @override
  Future<dynamic> postCommand(String action, String imei) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var body = json.encode({"command": "$action"});
    var response = await http.post(url, headers: headers, body: body);
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
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    // AÑADIR FUNCIONALIDAD
     final LatLng position = LatLng(41.387968, 2.158879);
     return position;
  }
}
