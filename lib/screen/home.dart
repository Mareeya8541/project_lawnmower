import 'package:flutter/material.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/loginpage.dart';
import 'package:lawnmower/screen/setting.dart';


class Home extends StatefulWidget {
  final String valueFromSetStart;
  Home({Key key ,this.valueFromSetStart}):super(key:key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool buttonstr=false,buttonstop=false,security=false;
  int strButton=0,stopButton=0,control=0,securitybutton=0;
  String str,stop="Off",security1="off";
  String user="",pass="";
  int fast=0,fastplus;
  String fastpn="0";
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
      securitybutton=iotModel.security;
      user=iotModel.user;
      pass=iotModel.pass;
      control=iotModel.control;
      fastpn=iotModel.fastpn;

      
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
    map['security']=securitybutton;
    map['user']=user;
    map['pass']=pass;
    map['control']=control;
    map['fast']=fastpn;

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
     height:80,
      padding: new EdgeInsets.all(7.0),
     child: RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.blueAccent,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:80.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.vpn_key,size: 25,)
          ),
        ),
     ),
   );
 }

 Widget buttonStop(){
   return Container(
     height: 80,
      padding: new EdgeInsets.all(7.0),
     child: RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.blueAccent,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 80.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "$stop",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:30.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }

 Widget buttonforward(){
   return Container(
     height:110,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyan,Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.arrow_upward,size: 35,color: Colors.black,)
          ),
        ),
     ),
   );
 }

Widget buttonbackward(){
   return Container(
     height:100,
      padding: new EdgeInsets.all(0.0),
     child: RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyan,Colors.white],
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.arrow_downward,size: 40,color: Colors.black,)
          ),
        ),
     ),
   );
 }
  
Widget buttonleft(){
   return Container(
     height:100,
      padding: new EdgeInsets.all(0.0),
     child: RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyan,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.arrow_back,size: 40,color: Colors.black,)
          ),
        ),
     ),
   );
 }

 Widget buttonright(){
   return Container(
     height:100,
      padding: new EdgeInsets.all(0.0),
     child: RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.white,Colors.cyan],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.arrow_forward,size: 40,color: Colors.black,)
          ),
        ),
     ),
   );
 }

Widget buttonclose(){
   return Container(
     height:110,
      padding: new EdgeInsets.all(10.0),
     child: RaisedButton(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyan[200],Colors.cyan[200]],
            begin: Alignment.bottomCenter,
            end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(60.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:90.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.report_off,size: 40,color: Colors.black,)
          ),
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

  Widget securityBut(){
   return Container(
     height: 70,
      padding: new EdgeInsets.all(0.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              securitybutton=securitybutton;
              if(securitybutton==0){
                securitybutton=1;
                security1="ON";
              }
              else {
                securitybutton=0;
                security1="Off";
              }
              print('$securitybutton');
              editDatabase();
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.blueAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "Safe : $security1",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:25.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }

  Widget mixstrstop(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              buttonStop(),
              buttonstart(),
              securityBut()
            ],
        ),
      ),
    ); 
  }

  Widget mixfor(){
    return Container(
      padding: new EdgeInsets.all(0.0),
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
      padding: new EdgeInsets.all(0.0),
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
      padding: new EdgeInsets.all(0.0),
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
  // Widget mixsecurity(){
  //   return Container(
  //     padding: new EdgeInsets.all(0.0),
  //     child: Center(
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //             securityBut()
  //           ],
  //       ),
  //     ),
  //   ); 
  // }

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

  Widget fastplus1(){
    readData();
   return Container(
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast=fast;
              if(fast==0){
                readData();
                fast =int.parse(fastpn)+1;
                if(fastplus<0){
                  fast=iotModel.fast;
                  fast=0;
                }
            
                fastpn=(fastplus).toString();
                fast=iotModel.fast;

              }
              else {
               fast=0;
                readData();
                fast=int.parse(fastpn)+1;
                if(fast<0){
                  fast=0;
                }
                fastpn=(fast).toString();
              }
              print('$fast');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0)),
        padding: EdgeInsets.all(3.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.blueAccent,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:80.0, maxHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.add)
          ),
        ),
     ),
   );
 }

 Widget fastnative(){
    readData();
   return Container(
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast=fast;
              if(fast==0){
                readData();
                fast =int.parse(fastpn)-1;
                if(fastplus<0){
                  fast=iotModel.fast;
                  fast=0;
                }
            
                fastpn=(fastplus).toString();
                fast=iotModel.fast;

              }
              else {
               fast=0;
                readData();
                fast=int.parse(fastpn)-1;
                if(fast<0){
                  fast=0;
                }
                fastpn=(fast).toString();
              }
              print('$fast');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(100.0),
         ),
        padding: EdgeInsets.all(3.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.blueAccent,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(50.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:80.0, maxHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.remove)
          ),
        ),
     ),
   );
 }

Widget pn(){
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
     fastnative(),Text(' '),showRightwhell(),Text(' '),fastplus1()
    ],
  );
}
Widget mixfast(){
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('ความเร็วใบพัด',
     textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:25.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Muffin-Regular'
          ),
     ) ,
              pn(),Text(' ')
            ],
        ),
      ),
    ); 
  }

  Widget showRightwhell(){
    readData();
    return Text(fastpn.toString(),
    style: TextStyle(fontSize:32.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
           ),);
  }

 Widget blockcenter2(){
    return Container(child: Container(
          width: 400.0,
          padding: EdgeInsets.all(0.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showRightwhell(),Text(''),Text(''),pn()
              ],
          ),
          ),);
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
        title: Text('ต้องการออกจากหน้านี้ใช่หรือไม่ ? (>ARE YOUR SURE LOGOUT ?)',
        style: TextStyle(
          fontSize: 30.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.red),),
        actions:<Widget> [
          MaterialButton(child: Text('YES/ใช่',style: TextStyle(
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
          MaterialButton(child: Text('NO/ไม่ใช่',style: TextStyle(
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
                          colors: [Colors.white,Colors.white,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                //mixsecurity(),
                mixstrstop(),
                Text("\n"),
                mixfast(),
                Text("\n\n"),
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