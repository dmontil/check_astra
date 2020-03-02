import 'package:flutter/material.dart';

class WidgetsCustoms{
  dividerCustom(){
    return   Divider(
      color: Colors.orangeAccent,
      thickness:1.5,
      height: 10,
    );
  }

  Widget textRich(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: RichText(
        text: TextSpan(
            style: TextStyle(fontSize: 18, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: subTitle,
                  style: TextStyle(fontSize: 16)
              )
            ]),
      ),
    );
  }


  Widget input(Icon icon, String hint, TextEditingController controller,
      bool obsecure, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
      ),
    );
  }

  Widget button(String text, Color splashColor, Color highlightColor,
      Color fillColor, Color textColor, void function()) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 18),
      ),
      onPressed: () {
        function();
      },
    );
  }
}