import 'package:flutter/material.dart';
import 'package:lawnmower/screen/fastturn.dart';
import 'package:lawnmower/screen/forereach.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:lawnmower/screen/propeller.dart';
import 'package:lawnmower/screen/reverse.dart';
import 'package:lawnmower/screen/setStart.dart';
import 'package:lawnmower/screen/slowturn.dart';
import 'package:firebase_database/firebase_database.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}


class _SettingPageState extends State<SettingPage> {

Widget buttonSetStart(){
 
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){ 
         var route = MaterialPageRoute(
            builder: (BuildContext context) => SettingStartPage()
          );
          Navigator.of(context).push(route);
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(10.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.lightBlue,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 360.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ตั้งค่า START",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:38.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }

Widget buttonSetMove(){
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         var route = MaterialPageRoute(
            builder: (BuildContext context) => MoveForwardPage()
          );
          Navigator.of(context).push(route);
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(10.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.lightBlue,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 360.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ตั้งค่าเดินหน้า",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:38.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }

Widget buttonSetReverse(){
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         var route = MaterialPageRoute(
            builder: (BuildContext context) => ReversePage()
          );
          Navigator.of(context).push(route);
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(10.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.lightBlue,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 360.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ตั้งค่าถอยหลัง",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:38.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }

 Widget buttonSetSlow(){
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         var route = MaterialPageRoute(
            builder: (BuildContext context) => SlowTurnPage()
          );
          Navigator.of(context).push(route);
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(10.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.lightBlue,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 360.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ตั้งค่าเลี้ยวซ้าย",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:38.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }
 Widget buttonSetFast(){
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         var route = MaterialPageRoute(
            builder: (BuildContext context) => FastTurnPage()
          );
          Navigator.of(context).push(route);
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(10.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.lightBlue,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 360.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ตั้งค่าเลี้ยวขวา",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:38.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }
Widget buttonSetPropeller(){
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         var route = MaterialPageRoute(
            builder: (BuildContext context) => PropellerPage()
          );
          Navigator.of(context).push(route);
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(10.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.lightBlue,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 360.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ตั้งค่าความเร็วใบพัด",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:38.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }

  // Widget buttonSetSensor(){
  //   return Container(
  //     padding: new EdgeInsets.all(16.0),
  //     child: SizedBox(
  //       height: 50,
  //       width: 400,
  //       child:  RaisedButton.icon(
  //         color: Colors.redAccent[400],
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(80.0)
  //         ),
  //         onPressed: (){
  //           var route = MaterialPageRoute(
  //           builder: (BuildContext context) => Sensor()
  //         );
  //         Navigator.of(context).push(route);
  //         },
  //         icon: Icon(Icons.settings),
  //         label: Text('ตั้งค่าเซนเซอร์',
  //         style: TextStyle(
  //         fontSize:35.0,
  //          //color:Colors.deepOrange,
  //          fontWeight:FontWeight.bold,
  //          fontFamily: 'Muffin-Regular'
  //     ),),
  //         ),
  //     ),
  //   );
  // }
  
  Widget blockcontrol1(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonSetStart()
      ],
    );
  }

  Widget blockcontrol2(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonSetMove()
      ],
    );
  }
  Widget blockcontrol3(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonSetReverse()
      ],
    );
  }

  Widget blockcontrol4(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonSetSlow()
      ],
    );
  }
  Widget blockcontrol5(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonSetFast()
      ],
    );
  }
  Widget blockcontrol6(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonSetPropeller()
      ],
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
        IconButton(icon: Icon(Icons.arrow_back,size: 30,), 
        onPressed: (){
         var route = MaterialPageRoute(
            builder: (BuildContext context) => Home()
          );
          Navigator.of(context).push(route);
        }),
        title: Text('More Settings',
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
                          colors: [Colors.white,Colors.white,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                 blockcontrol1(),blockcontrol2(),blockcontrol3(),
                 blockcontrol4(),blockcontrol5(),//blockcontrol6()
            ],)
          ),
      ),)
    );
  }
}