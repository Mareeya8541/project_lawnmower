import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:characters/characters.dart';
import 'package:lawnmower/screen/setting.dart';

class FastTurnPage extends StatefulWidget {
  @override
  _FastTurnPageState createState() => _FastTurnPageState();
}

class _FastTurnPageState extends State<FastTurnPage> {
 IotModel iotModel;
  var textEditleft = new TextEditingController();
  var textEditright = new TextEditingController();
  var textEdittime = new TextEditingController();
  int time=0,timeplus;
  String timepn="0";
  // String rightpn="0",leftpn="0";
  // int left,right,leftplus,rightplus;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  void initState() {
    super.initState();
    readData();
    
  }

  Future <void> readData() async {
    print('Read Data Work');
    DatabaseReference databaseReference = firebaseDatabase.reference().child('turnRight');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      // leftpn=iotModel.leftpn;
      // rightpn=iotModel.rightpn;
      timepn=iotModel.timepn;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('turnRight');
     Map<dynamic,dynamic> map = Map();
    //  map['left']=textEditleft.text;
    //  map['right']=textEditright.text;
     map['time']=timepn;
    //  map['left']=leftpn;
    //  map['right']=rightpn;
    
   
     
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }

  Widget textRight() {
    return Text(
      'ตั้งค่าหน่วงเวลา',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  } 

  Widget showRightwhell(){
    readData();
    return Text(timepn.toString()+' ms',
    style: TextStyle(fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
           ),);
  }
  Widget timeplus1(){
    readData();
   return Container(
     height:80,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              time=time;
              if(time==0){
                readData();
                time =int.parse(timepn)+100;
                if(timeplus<0){
                  time=iotModel.time;
                  time=0;
                }
            
                timepn=(timeplus).toString();
                time=iotModel.time;

              }
              else {
               time=0;
                readData();
                time=int.parse(timepn)+100;
                if(time<0){
                  time=0;
                }
                timepn=(time).toString();
              }
              print('$time');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(80.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:80.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Icon(Icons.add)
          ),
        ),
     ),
   );
 }

 Widget timenative(){
    readData();
   return Container(
     height:80,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              time=time;
              if(time==0){
                readData();
                time =int.parse(timepn)-100;
                if(timeplus<0){
                  time=iotModel.time;
                  time=0;
                }
            
                timepn=(timeplus).toString();
                time=iotModel.time;

              }
              else {
               time=0;
                readData();
                time=int.parse(timepn)-100;
                if(time<0){
                  time=0;
                }
                timepn=(time).toString();
              }
              print('$time');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(80.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:80.0, minHeight: 50.0),
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
      timeplus1(),Text('               '),timenative()
    ],
  );
}

  Widget blockcenter2(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(0.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              textRight(),
              showRightwhell(),Text(''),Text(''),pn()
              ],
          ),
          ),);
  }
  // Widget textTime() {
  //   return Text(
  //     'เวลา',
  //     style: TextStyle(
  //         fontSize: 35.0, 
  //         fontWeight: FontWeight.bold,
  //         fontFamily: 'Muffin-Regular', 
  //         color: Colors.black),
  //   );
  // } 

  // Widget settingTime(){
  //   // readData();
  //   // editDatabase();
  //   return Container(
  //     width: 300.0,
  //     child: TextFormField(
  //       inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
  //       maxLines: null,
  //       keyboardType: TextInputType.number,
  //       controller: textEdittime,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         icon: Icon(Icons.timer,
  //         size: 30.0,
  //         color: Colors.black,
  //         ),
  //         labelText: 'ระบุเวลาที่ต้องการ',
  //         hintText: 'วินาที'
  //       ),
  //       style: TextStyle(
  //         fontSize:18.0,
  //          //color:Colors.deepOrange,
  //          fontWeight:FontWeight.bold,
  //          fontFamily: 'Righteous-Regular'
  //     ),
  //     ),
  //   );
  // }

// Widget blocksettime(){
//     return Container(child: Container(
//           width: 400.0,
//           padding: EdgeInsets.all(16.0),
//             child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               textTime(),//settingTime()
//               ],
//           ),
//           ),);
//   }

Widget rigtleftRow(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        blockforward1()
      ],
    );
  }
  
  Widget blockforward1(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        blockcenter2()
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
            builder: (BuildContext context) => SettingPage()
          );
          Navigator.of(context).push(route);
        }),
        title : Text('ตั้งค่าเลี้ยวขวา',
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
                rigtleftRow()
                //blockforward2(),
            ],)
          ),
      ),);
  }
}