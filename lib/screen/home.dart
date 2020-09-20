import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/loginpage.dart';
import 'package:lawnmower/screen/setting.dart';
import 'package:characters/characters.dart';


class Home extends StatefulWidget {
  final String valueFromSetStart;
  Home({Key key ,this.valueFromSetStart}):super(key:key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool buttonstr=false,buttonstop=false;
  int strButton=0,stopButton=0,control=0;
  String str,stop="Off";
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
      control=iotModel.control;

      
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
    map['control']=control;

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
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 80,
        width: 100,
        child:  RaisedButton.icon(
          color: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          onPressed: (){
            setState(() {
              readData();
              strButton=strButton;
              if(strButton==1){
                strButton=1;
                //str="ON";
              }
              else{
                strButton=1;
                //str="Off";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.vpn_key),
          label: Text(''),
          ),
      ),
    );
  }

  Widget buttonStop(){
    //readData();
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 80,
        width: 100,
        child:  RaisedButton.icon(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          onPressed: (){
            setState(() {
              stopButton=stopButton;
              if(stopButton==0){
                stopButton=1;
                stop="ON";
              }
              else {
                stopButton=0;
                stop="Off";
              }
              print('$stopButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.stop),
          label: Text('$stop',style: TextStyle(
           fontSize: 25.0,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
      
    );
  }

  Widget buttonforward(){
    return Container(
      //padding: new EdgeInsets.all(0.0),
      child: SizedBox(
        height: 120,
        width: 120,
        child:  RaisedButton.icon(
          color: Colors.cyanAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          onPressed: (){
            setState(() {
              readData();
              control=control;
              if(control==1){
                control=1;
                //str="ON";
              }
              else{
                control=1;
                //str="Off";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.arrow_upward,size: 30,color: Colors.black,),
          label: Text(''),
          ),
      ),
    );
  }
  Widget buttonbackward(){
    return Container(
      //padding: new EdgeInsets.all(5.0),
      child: SizedBox(
        height: 120,
        width: 120,
        child:  RaisedButton.icon(
          color: Colors.cyanAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          onPressed: (){
            setState(() {
              readData();
              control=control;
              if(control==2){
                control=2;
                //str="ON";
              }
              else{
                control=2;
                //str="Off";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.arrow_downward,size: 30,color: Colors.black,),
          label: Text(''),
          ),
      ),
    );
  }

  Widget buttonleft(){
    return Container(
      //padding: new EdgeInsets.all(5.0),
      child: SizedBox(
        height: 120,
        width: 120,
        child:  RaisedButton.icon(
          color: Colors.cyanAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          onPressed: (){
            setState(() {
              readData();
              control=control;
              if(control==3){
                control=3;
                //str="ON";
              }
              else{
                control=3;
                //str="Off";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.arrow_back,size: 30,color: Colors.black,),
          label: Text(''),
          ),
      ),
    );
  }

  Widget buttonright(){
    return Container(
      //padding: new EdgeInsets.all(5.0),
      child: SizedBox(
        height: 120,
        width: 120,
        child:  RaisedButton.icon(
          color: Colors.cyanAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          onPressed: (){
            setState(() {
              readData();
              control=control;
              if(control==4){
                control=4;
                //str="ON";
              }
              else{
                control=4;
                //str="Off";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.arrow_forward,size: 25,color: Colors.black,),
          label: Text(''),
          ),
      ),
    );
  }

  Widget buttonclose(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        width: 100,
        child:  RaisedButton.icon(
          color: Colors.lightGreenAccent[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          onPressed: (){
            setState(() {
              readData();
              control=control;
              if(control==0){
                control=0;
                //str="ON";
              }
              else{
                control=0;
                //str="Off";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.report_off,size: 40,),
          label: Text(''),
          ),
      ),
    );
  }

  Widget buttonforwardright1(){
    return Container(
      //padding: new EdgeInsets.all(5.0),
      child: SizedBox(
        height: 120,
        width: 120,
        child:  RaisedButton.icon(
          color: Colors.redAccent[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          onPressed: (){
            setState(() {
              readData();
              control=control;
              if(control==3){
                control=3;
                //str="ON";
              }
              else{
                control=3;
                //str="Off";
              }
              print('$strButton');
              editDatabase();
            });
          },
          icon: Icon(Icons.subdirectory_arrow_left),
          label: Text(''),
          ),
      ),
    );
  }

  Widget mixstrstop(){
    return Container(
      padding: new EdgeInsets.all(15.0),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              buttonstart(),
              buttonStop()
            ],
        ),
      ),
    ); 
  }

  Widget mixfor(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              //buttonforwardright1(),
              //Text('\t'),
              buttonforward(),
              //Text('\t'),
              //buttonforwardright1()
            ],
        ),
      ),
    ); 
  }
  Widget mixback(){
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              buttonbackward()
            ],
        ),
      ),
    ); 
  }

  Widget mixmix(){
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              buttonleft(),buttonclose(),buttonright()
            ],
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
            child: Row(
            children: <Widget>[
                showText()
              ],
          ),
          ),
            
    );
  }

  Widget test(){
    return Row(
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showText(),Text('\t\t\t\t\t\t\t\t\t\t')
      ],
    );
  }
  createAlertDialog(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text('ARE YOUR SURE LOGOUT',
        style: TextStyle(
          fontSize: 30.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),),
        actions:<Widget> [
          MaterialButton(child: Text('YES',style: TextStyle(
          fontSize: 25.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()
          );
          Navigator.of(context).push(route);
          },
          ),
          MaterialButton(child: Text('NO',style: TextStyle(
          fontSize: 25.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => Home()
          );
          Navigator.of(context).push(route);
          },
          )
        ],
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
        IconButton(icon: Icon(Icons.person_outline,size: 30,), 
        onPressed: (){
          createAlertDialog(context);
        }),
        title: Text('Control Lawnmower',
         style: TextStyle(
           fontSize:25.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'   
      ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings,size: 30,), onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => SettingPage()
          );
          Navigator.of(context).push(route);
          },)
        ],
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
                mixstrstop(),
                mixfor(),
                mixmix(),
                mixback()
                //buttonstart(),buttonStop(),buttonforward(),buttonbackward()
            ],)
          ),
      ),)
    );
  }
}