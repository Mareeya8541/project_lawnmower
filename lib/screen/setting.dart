import 'package:flutter/material.dart';
import 'package:lawnmower/screen/fastturn.dart';
import 'package:lawnmower/screen/forereach.dart';
import 'package:lawnmower/screen/loginpage.dart';
import 'package:lawnmower/screen/propeller.dart';
import 'package:lawnmower/screen/reverse.dart';
import 'package:lawnmower/screen/sensor.dart';
import 'package:lawnmower/screen/setStart.dart';
import 'package:lawnmower/screen/slowturn.dart';
import 'package:characters/characters.dart';
import 'package:intro_slider/intro_slider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  Widget buttonSetStart(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 400,
        child:  RaisedButton.icon(
          color: Colors.purpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => SettingStartPage()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text('Start',
          style: TextStyle(
          fontSize:38.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }

  Widget buttonSetMove(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 400,
        child:  RaisedButton.icon(
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => MoveForwardPage()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text('เดินหน้า',
          style: TextStyle(
          fontSize:35.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }

  Widget buttonSetReverse(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 400,
        child:  RaisedButton.icon(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => ReversePage()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text('ถอยหลัง',
          style: TextStyle(
          fontSize:35.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }

  Widget buttonSetSlow(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 400,
        child:  RaisedButton.icon(
          color: Colors.limeAccent[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => SlowTurnPage()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text('เลี้ยวซ้าย',
          style: TextStyle(
          fontSize:35.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }

  Widget buttonSetFast(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 400,
        child:  RaisedButton.icon(
          color: Colors.yellowAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => FastTurnPage()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text('เลี้ยวขวา',
          style: TextStyle(
          fontSize:35.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }
  Widget buttonSetPropeller(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 400,
        child:  RaisedButton.icon(
          color: Colors.deepOrangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => PropellerPage()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text('ความเร็วใบพัด',
          style: TextStyle(
          fontSize:35.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }

  Widget buttonSetSensor(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        width: 400,
        child:  RaisedButton.icon(
          color: Colors.redAccent[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => Sensor()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text('ตั้งค่าเซนเซอร์',
          style: TextStyle(
          fontSize:35.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting',
         style: TextStyle(
           fontSize:25.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
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
                  buttonSetStart(),buttonSetMove(),buttonSetReverse(),
                  buttonSetSlow(),buttonSetFast(),buttonSetPropeller(),//buttonSetSensor()
            ],)
          ),
      ),)
    );
  }
}