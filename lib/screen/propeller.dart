import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:characters/characters.dart';
import 'package:lawnmower/screen/setting.dart';

class PropellerPage extends StatefulWidget {
  @override
  _PropellerPageState createState() => _PropellerPageState();
}

class _PropellerPageState extends State<PropellerPage> {
 IotModel iotModel;
 var textEditfast = new TextEditingController();
  String fast="";
  int fast1Int=0;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  void initState() {
    super.initState();
    readData();
    
  }

  Future <void> readData() async {
    print('Read Data Work');
    DatabaseReference databaseReference = firebaseDatabase.reference().child('propeller');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      fast1Int=iotModel.fast;
      
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('propeller');
     Map<dynamic,dynamic> map = Map();
     //map['fast']=textEditfast.text;
     map['fast']=fast1Int;
     
     
     
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }
  Widget showText() {
    return Text(
      'ความเร็วใบพัด',
      style: TextStyle(
          fontSize: 40.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  }

  Widget showRightwhell(){
    readData();
    return Text(fast1Int.toString()+"°",
    style: TextStyle(fontSize:40.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           //fontFamily: 'Muffin-Regular'
           ),);
  }

  Widget propeller1(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=10;

               
              }
              else {
               fast1Int=10;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "10°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }

  Widget propeller2(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=15;

               
              }
              else {
               fast1Int=15;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "15°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }
  Widget propeller3(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=20;

               
              }
              else {
               fast1Int=20;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "20°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }
  Widget propeller4(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=30;

               
              }
              else {
               fast1Int=30;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "30°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }

  Widget propeller5(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=60;

               
              }
              else {
               fast1Int=60;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "60°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }

  Widget propeller6(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=90;

               
              }
              else {
               fast1Int=90;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "90°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }
  Widget propeller7(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=120;

               
              }
              else {
               fast1Int=120;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "120°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }
  Widget propeller8(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=150;

               
              }
              else {
               fast1Int=150;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "150°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }

 Widget propeller9(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=180;

               
              }
              else {
               fast1Int=180;
                

              }
              print('$fast1Int');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "180°",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              
          ),
            )
          ),
        ),
     ),
   );
 }
  Widget blockcenter1(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showText(),Text(''),showRightwhell()
              ],
          ),
          ),);
  }

  Widget propeller11(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      propeller1(),propeller2(),propeller3()
      ],
    );
  }
  Widget propeller12(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      propeller4(),propeller5(),propeller6()
      ],
    );
  }

  Widget propeller13(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      propeller7(),propeller8(),propeller9()
      ],
    );
  }


  // Widget block(){
  //   return Container(
  //     decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(16),
  //                     gradient: LinearGradient(
  //                         colors: [Colors.cyanAccent,Colors.cyan])),
  //       child: Container(
  //         width: 350.0,
  //         padding: EdgeInsets.all(16.0),
  //           child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //               propeller1520(),propeller3040(),propeller6090(),propeller1209150()
  //             ],
  //         ),
  //         ),
            
  //   );
  // }
Widget block(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        propeller11(),propeller12(),propeller13()
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
        IconButton(icon: Icon(Icons.arrow_back,size: 30,), 
        onPressed: (){
         var route = MaterialPageRoute(
            builder: (BuildContext context) => SettingPage()
          );
          Navigator.of(context).push(route);
        }),
        title : Text('ตั้งค่าความเร็วใบพัด',
         style: TextStyle(
           fontSize: 35.0,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),
        ),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.check,size: 30,), onPressed: (){
        //     var route = MaterialPageRoute(
        //     builder: (BuildContext context) => Home()
        //   );
        //   Navigator.of(context).push(route);
        //   editDatabase();
        //   },)
        // ],
      ),
      body:  Container(
          decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white,Colors.white,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                blockcenter1(),
                Text('   '),
                Text('   '),
                block()
            ],)
          ),
      ),);
  }
}