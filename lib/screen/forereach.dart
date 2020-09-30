import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:lawnmower/screen/setting.dart';
//import 'package:characters/characters.dart';

class MoveForwardPage extends StatefulWidget {
  @override
  _MoveForwardPageState createState() => _MoveForwardPageState();
}

class _MoveForwardPageState extends State<MoveForwardPage> {
  IotModel iotModel;
  var textEditleft = new TextEditingController();
  var textEditright = new TextEditingController();
  //String left="",right="";
  //String rightpn="0",leftpn="0";
  int speed=1;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  void initState() {
    super.initState();
    readData();
    
  }

  Future <void> readData() async {
    print('Read Data Work');
    DatabaseReference databaseReference = firebaseDatabase.reference().child('move');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      speed= iotModel.speed;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('move');
     Map<dynamic,dynamic> map = Map();
     //map['left']=textEditleft.text;
     //map['right']=textEditright.text;
     
     map['speed']=speed;
    
   
     
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }

  Widget textLeft() {
    return Text(
      'ล้อซ้าย',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  } 
  
  // Widget leftWhell(){
  //   // readData();
  //   // editDatabase();
  //   return Container(
  //     width: 300.0,
  //     child: TextFormField(
  //       inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
  //       maxLines: null,
  //       keyboardType: TextInputType.number,
  //       controller: textEditleft,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         icon: Icon(Icons.local_car_wash,
  //         size: 30.0,
  //         color: Colors.black,
  //         ),
  //         labelText: 'ระบุค่าที่ต้องการ',
  //         hintText: ''
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

//   Widget leftWhellplus(){
//     readData();
//     return Container(
//       padding: new EdgeInsets.all(30.0),
//       child: SizedBox(
//         height: 50,
//         width: 60,
//         child:  RaisedButton.icon(
//           color: Colors.green[200],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40.0)
//           ),
//           onPressed: (){
//             setState(() {
//               left=left;
//               //left=left;
//               if(left==0){
//                 readData();
//                 left =int.parse(leftpn)+1;
//                 if(leftplus<0){
//                   left=iotModel.left;
//                   left=0;
//                 }
//                 leftpn=(leftplus).toString();
//                 left=iotModel.left;
//                 //pushbutton=5;
//               }
//               else {
//                left=0;
//                 readData();
//                 left =int.parse(leftpn)+1;
//                 if(left<0){
//                   left=0;
//                 }
//                 leftpn=(left).toString();
//                 //pushbutton=5;

//               }
//               print('$left');
//               editDatabase();
//               readData();
             
//             });
//           },
//           icon: Icon(Icons.add),
//           label: Text(''),
//           ),
//       ),
//     );
//   }

// Widget leftWhellnative(){
//     readData();
//     return Container(
//       padding: new EdgeInsets.all(30.0),
//       child: SizedBox(
//         height: 50,
//         width: 60,
//         child:  RaisedButton.icon(
//           color: Colors.green[200],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40.0)
//           ),
//           onPressed: (){
//             setState(() {
//               left=left;
//               //left=left;
//               if(left==0){
//                 readData();
//                 left =int.parse(leftpn)-1;
//                 if(leftplus<0){
//                   left=iotModel.left;
//                   left=0;
//                 }
//                 leftpn=(leftplus).toString();
//                 left=iotModel.left;
//                 //pushbutton=5;
//               }
//               else {
//                left=0;
//                 readData();
//                 left =int.parse(leftpn)-1;
//                 if(left<0){
//                   left=0;
//                 }
//                 leftpn=(left).toString();
//                 //pushbutton=5;

//               }
//               print('$left');
//               editDatabase();
//               readData();
             
//             });
//           },
//           icon: Icon(Icons.remove),
//           label: Text(''),
//           ),
//       ),
//     );
//   }



//   Widget blockcenter(){
//     return Container(child: Container(
//           width: 400.0,
//           padding: EdgeInsets.all(0.0),
//             child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               textLeft(),leftText()
//               ],
//           ),
//           ),);
//   }

  // Widget showRightwhell(){
  //   readData();
  //   return Text(right.toString(),
  //   style: TextStyle(fontSize:35.0,
  //          color:Colors.black,
  //          fontWeight:FontWeight.bold,
  //          fontFamily: 'Muffin-Regular'
  //          ),);
  // }

  Widget textRight() {
    return Text(
      'ระดับค่าความเร็ว ',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  } 
  Widget showleftwhell(){
    readData();
    return Text('ความเร็วระดับที่ : ' +speed.toString(),
    style: TextStyle(fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
           ),);
  }

  Widget speed1(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              speed=speed;
              if(speed==0){
                readData();
                speed=1;

               
              }
              else {
               speed=1;
                

              }
              print('$speed');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.blueAccent,Colors.cyan],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ระดับ 1",
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

  
 Widget speed2(){
    readData();
   return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         setState(() {
              speed=speed;
              if(speed==0){
                readData();
                speed=2;

               
              }
              else {
               speed=2;
                

              }
              print('$speed');
              editDatabase();
              readData();
             
            });
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.blueAccent,Colors.cyan],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ระดับ 2",
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

 Widget textspeed(){
    readData();
   return Container(
     height:80,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
      //  onPressed: (){
      //    },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyan,Colors.lime],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(50.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth:400.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ความเร็วระดับที่  : "+speed.toString(),
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

  Widget rightText(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        speed1(),speed2()
      ],
    );
  }
  Widget blockcenter2(){
    return Container(child: Container(
          width: 400.0,
          padding: EdgeInsets.all(10.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              textspeed(),
              Text(''),
              Text(''),
              rightText(),
              ],
          ),
          ),);
  }


  // Widget blockforward1(){
  //   return Container(
  //     decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(16),
  //                     gradient: LinearGradient(
  //                         colors: [Colors.cyanAccent,Colors.cyan])),
  //       child: Container(
  //         width: 380.0,
  //         padding: EdgeInsets.all(16.0),
  //           child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             textRight(),
  //               blockcenter2()
  //             ],
  //         ),
  //         ),
            
  //   );
  // }
Widget blockforward1(){
    return Container(child: Container(
          width: 400.0,
          padding: EdgeInsets.all(5.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              blockcenter2()
              ],
          ),
          ),);
  }
  // Widget blockforward1(){
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
     
  //     children: <Widget>[
  //        textRight(),
  //        blockcenter2()
  //     ],
  //   );
  // }
 Widget rigtleftRow(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        blockforward1()
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
        title : Text('ตั้งค่าเดินหน้า',
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
                          colors: [Colors.white,Colors.white])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                rigtleftRow()
            ],)
          ),
      ),);
  }
}