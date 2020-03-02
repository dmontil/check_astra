import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Buttons{


  bSpeedDial() {
    return SpeedDial(
      child: Icon(Icons.add),
      children: [
        SpeedDialChild(
            child: Icon(Icons.fast_forward),
            label: "A",
            onTap: () => print("A")),
        SpeedDialChild(
            child: Icon(Icons.g_translate),
            label: "A",
            onTap: () => print("A")),
        SpeedDialChild(
            child: Icon(Icons.history),
            label: "A",
            onTap: () => print("A")),
      ],
    );
  }

  bCircularPercentIndicator(int value, String footer, IconData icon){
   return CircularPercentIndicator(
        radius: 80.0,
        lineWidth: 8.0,
        percent: value/100,
        footer: Text(footer),
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${value.toString()}",
            ),
            Icon(
              icon,
              size: 20.0,
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey,
        progressColor: Colors.blueAccent,
      );
  }


  bFloatAction( String tag, Color color,IconData icon, void function()){
   return  Padding(
      padding: const EdgeInsets.all(11.0),
      child: FloatingActionButton(
        heroTag: tag,
        backgroundColor: color,
        child: Icon(
          icon,
          size: 30,
        ),
        onPressed: function,
      ),
    );
  }

}