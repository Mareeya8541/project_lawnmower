import 'package:flutter/material.dart';
import 'package:lawnmower/screen/home.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:characters/characters.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  IotModel iotModel;
  final String titleString ="Login";
  var textEditEmail = new TextEditingController();
  var textEditPass = new TextEditingController();
  String user="",pass="";
  bool buttonstr=false,buttonstop=false;
  int strButton=0,stopButton=0;
  String str,stop;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  void initState() {
    super.initState();
    readData();
    
  }

  Future <void> readData() async {
    print('Read Data Work');
    DatabaseReference databaseReference = firebaseDatabase.reference().child('login');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      user=iotModel.user;
      pass=iotModel.pass;
      // strButton=iotModel.buttonstr;
      // stopButton=iotModel.buttonstop;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('login');
     Map<dynamic,dynamic> map = Map();
     map['user']=user;
     map['pass']=pass;
    //  map['buttonstr']=strButton;
    //  map['buttonstop']=stopButton;
     
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }

  Widget showlogo(){
    return Image.asset('images/lawnmower.png',height: 200,);
  }

  Widget showText() {
    return Text(
      'LAWNMOWER',
      style: TextStyle(
          fontSize: 30.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Righteous-Regular', 
          color: Colors.black),
    );
  }

   Widget emailText(){
    return Container(
      width: 300.0,
      child: TextFormField(
        controller: textEditEmail,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          icon: Icon(Icons.email,
          size: 30.0,
          color: Colors.black,
          ),
          labelText: 'Username',
          hintText: 'your@email.com'
        ),
        style: TextStyle(
          fontSize:18.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),
      ),
    );
  }

  Widget passText(){
    return Container(
      width: 300.0,
      child: TextFormField(
        obscureText: true,
        controller: textEditPass,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          icon: Icon(Icons.vpn_key,
          size: 30.0,
          color: Colors.black,
          ),
          labelText: 'Password',
          hintText: 'more 8 charactor'
        ),
        style: TextStyle(
          fontSize:18.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),
      ),
    );
  }

  generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
 }

 Widget buttonlogin(){
   readData();
   return Container(
     height: 70.0,
     child: RaisedButton(
       onPressed: (){
         if(generateMd5(textEditPass.text)==pass&&textEditEmail
         .text==user){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => Home()
          );
          Navigator.of(context).push(route);
      }editDatabase();},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.blueAccent,Colors.cyanAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "LOGIN",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize:20.0,
              fontWeight:FontWeight.bold,
              fontFamily: 'Righteous-Regular'
          ),
            )
          ),
        ),
     ),
   );
 }

  //  Widget buttonlogin(){
  //    readData();
  //   return Container(
  //     width: 300.0,
  //     height: 50.0,
  //     child: RaisedButton.icon(
  //       color: Colors.blueAccent[700],
  //       icon: Icon(Icons.people,
  //       size: 30.0,
  //       color: Colors.black,
  //     ),
  //     label: Text('LOGIN'
  //       ,style: TextStyle(
  //          fontSize:20.0,
  //          color:Colors.black,
  //          fontWeight:FontWeight.bold,
  //          fontFamily: 'Righteous-Regular'
  //     ),
  //     ),
  //     onPressed: (){if(generateMd5(textEditPass.text)==pass&&textEditEmail
  //     .text==user){
  //       var route = MaterialPageRoute(
  //           builder: (BuildContext context) => Home()
  //         );
  //         Navigator.of(context).push(route);
  //     }
  //     editDatabase();
  //     },
  //   ),
  //   );
  // }


  // Widget blocklogin(){
  //   return Container(
  //     decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(16),
  //                     gradient: LinearGradient(
  //                         colors: [Colors.white,Colors.white])),
  //       child: Container(
  //         width: 350.0,
  //         padding: EdgeInsets.all(16.0),
  //           child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             showText(),emailText(),passText(),Text('\t'),buttonlogin(),
  //             ],
  //         ),
  //         ),
            
  //   );
  // }
  Widget blocklogin(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showText(),emailText(),passText(),Text('\t'),buttonlogin(),
      ],
    );
  }
  
  Widget logologin(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showlogo(),
              blocklogin()
              ],
          ),
          ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.cyanAccent,Colors.white,])),
          child: Center(
            child : Wrap(
              children: <Widget>[logologin()
            ],)
          ),
      ),);
  }
}