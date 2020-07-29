import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/setting.dart';


class Home extends StatefulWidget {
  final String valueFromSetStart;
  Home({Key key ,this.valueFromSetStart}):super(key:key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool buttonstr=false,buttonstop=false;
  int strButton=0,stopButton=0;
  String str,stop;
   String user="",pass="";
  IotModel iotModel;

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    readData();
  }
  
  Future <void> readData() async {
    print('Read Data Work');

    DatabaseReference databaseReference = firebaseDatabase.reference().child('lawnmower');
    
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      // Map <dynamic,dynamic> values= dataSnapshot.value;
      // values.forEach((key,values){
      //   print(values['led1']);
      // });
      iotModel=IotModel.formMap(dataSnapshot.value);
      strButton=iotModel.buttonstr;
      stopButton=iotModel.buttonstop;
      user=iotModel.user;
      pass=iotModel.pass;
      
      checkSwitch();
    });
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    //print('mode=$modeBool');
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('lawnmower');

    Map<dynamic,dynamic> map = Map();
    map['buttonstr']=strButton;
    map['buttonstop']=stopButton;
    map['user']=user;
     map['pass']=pass;

    await databaseReference.set(map).then((response){
      print('Edit Success');
    });
  }

  void checkSwitch(){
    setState(() {
      if(iotModel.buttonstr==0){
        buttonstr=false;
      }
      else{
        buttonstr=true;
      }

      if(iotModel.buttonstop==0){
        buttonstop=false;
      }
      else{
        buttonstop=true;
      }
    });
    print('Start=$buttonstr,Stop=$buttonstop');
  }

  Widget buttonstart(){
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: SizedBox(
        height: 100,
        width: 120,
        child:  RaisedButton.icon(
          color: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)
          ),
          onPressed: (){
            setState(() {
              strButton=strButton;
              if(strButton==0){
                strButton=1;
                str="0";
              }
              else {
                strButton=0;
                str="1";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.ac_unit),
          label: Text('Start'),
          ),
      ),
    );
  }

  Widget buttonStop(){
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: SizedBox(
        height: 100,
        width: 120,
        child:  RaisedButton.icon(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)
          ),
          onPressed: (){
            setState(() {
              stopButton=stopButton;
              if(stopButton==0){
                stopButton=1;
                stop="0";
              }
              else {
                stopButton=0;
                stop="1";
              }
              print('$stopButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.ac_unit),
          label: Text('Stop'),
          ),
      ),
    );
  }

  Widget mix(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonstart(),
        buttonStop()
      ],
    );
  }
  
  Widget buttonSetting(){
    return Container(
      //padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child:  RaisedButton.icon(
          color: Colors.teal[300],
          shape: RoundedRectangleBorder(
            //borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => SettingPage()
          );
          Navigator.of(context).push(route);
          },
          icon: Icon(Icons.settings),
          label: Text(''),
          ),
      ),
    );
  }

  Widget showText() {
    return Text(
      'Control Lawnmower',
      style: TextStyle(
          fontSize: 30.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Righteous-Regular', 
          color: Colors.black),
    );
  }

   Widget block(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      gradient: LinearGradient(
                          colors: [Colors.white,Colors.white])),
        child: Container(
          width: 400.0,
          height: 90,
          //padding: EdgeInsets.all(16.0),
            child: Row(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                showText(),buttonSetting()
              ],
          ),
          ),
            
    );
  }

  Widget test(){
    return Row(
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showText(),Text('\t\t\t\t\t\t\t\t\t\t'),buttonSetting()
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Lawnmower',
         style: TextStyle(
           fontSize:25.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),
        ),
        actions: <Widget>[buttonSetting()],
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment(10, -5),
          decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal[700],Colors.teal[400],Colors.teal[200],Colors.tealAccent,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                //test(),
                mix(),
            ],)
          ),
      ),)
    );
  }
}