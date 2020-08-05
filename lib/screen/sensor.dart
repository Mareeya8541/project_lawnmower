import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Sensor extends StatefulWidget {
  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่าเซนเซอร์',
         style: TextStyle(
           fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),
        ),
        //actions: <Widget>[buttonSetting()],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal[700],Colors.teal[400],Colors.teal[200],Colors.tealAccent,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                  
            ],)
          ),
      ),)
    );
  }
}