import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:characters/characters.dart';
import 'package:lawnmower/screen/setting.dart';

class SlowTurnPage extends StatefulWidget {
  @override
  _SlowTurnPageState createState() => _SlowTurnPageState();
}

class _SlowTurnPageState extends State<SlowTurnPage> {
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
    DatabaseReference databaseReference = firebaseDatabase.reference().child('turnLeft');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      // leftpn=iotModel.leftpn;
      // rightpn=iotModel.rightpn;
      timepn=iotModel.timepn;
      
      // strButton=iotModel.buttonstr;
      // stopButton=iotModel.buttonstop;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('turnLeft');
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


//   Widget textLeft() {
//     return Text(
//       'ล้อซ้าย',
//       style: TextStyle(
//           fontSize: 35.0, 
//           fontWeight: FontWeight.bold,
//           fontFamily: 'Muffin-Regular', 
//           color: Colors.black),
//     );
//   } 

//   Widget leftWhell(){
//     // readData();
//     // editDatabase();
//     return Container(
//       width: 300.0,
//       child: TextFormField(
//         inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
//         maxLines: null,
//         keyboardType: TextInputType.number,
//         controller: textEditleft,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           icon: Icon(Icons.local_car_wash,
//           size: 30.0,
//           color: Colors.black,
//           ),
//           labelText: 'ระบุค่าที่ต้องการ',
//           hintText: ''
//         ),
//         style: TextStyle(
//           fontSize:18.0,
//            //color:Colors.deepOrange,
//            fontWeight:FontWeight.bold,
//            fontFamily: 'Righteous-Regular'
//       ),
//       ),
//     );
//   }

// Widget blockcenter(){
//     return Container(child: Container(
//           width: 400.0,
//           padding: EdgeInsets.all(16.0),
//             child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               textLeft(),leftWhell()
//               ],
//           ),
//           ),);
//   }

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
  // Widget showleftwhell(){
  //   readData();
  //   return Text(leftpn.toString(),
  //   style: TextStyle(fontSize:35.0,
  //          color:Colors.black,
  //          fontWeight:FontWeight.bold,
  //          fontFamily: 'Muffin-Regular'
  //          ),);
  // }
  Widget showRightwhell(){
    readData();
    return Text(timepn.toString()+' ms',
    style: TextStyle(fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
           ),);
  }
//   Widget rightWhellplus(){
//     readData();
//     return Container(
//       padding: new EdgeInsets.all(30.0),
//       child: SizedBox(
//         height: 50,
//         width: 60,
//         child:  RaisedButton.icon(
//           color: Colors.tealAccent[700],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40.0)
//           ),
//           onPressed: (){
//             setState(() {
//               right=right;
//               left=left;
//               if(right==0){
//                 readData();
//                 right =int.parse(rightpn)+1;
//                 left=int.parse(leftpn)-1;
//                 if(rightplus<0){
//                   right=iotModel.right;
//                   right=0;
//                 }
//                 else if(left<0){
//                   left=iotModel.left;
//                   left=0;
//                 }
//                 rightpn=(rightplus).toString();
//                 right=iotModel.right;
//                 leftpn=(leftplus).toString();
//                 left=iotModel.left;

//                 //pushbutton=5;
//               }
//               else {
//                right=0;
//                left=0;
//                 readData();
//                 right=int.parse(rightpn)+1;
//                 left=int.parse(leftpn)-1;
//                 if(right<0){
//                   right=0;
//                 }
//                 else if(left<0){
//                   left=0;
//                 }
//                 rightpn=(right).toString();
//                 leftpn=(left).toString();
//                 //pushbutton=5;

//               }
//               print('$right');
//               editDatabase();
//               readData();
             
//             });
//           },
//           icon: Icon(Icons.arrow_back),
//           label: Text(''),
//           ),
//       ),
//     );
//   }

// Widget rightWhellnative(){
//     readData();
//     return Container(
//       padding: new EdgeInsets.all(30.0),
//       child: SizedBox(
//         height: 50,
//         width: 60,
//         child:  RaisedButton.icon(
//           color: Colors.tealAccent[700],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40.0)
//           ),
//           onPressed: (){
//             setState(() {
//               right=right;
//               left=left;
//               if(right==0){
//                 readData();
//                 right =int.parse(rightpn)-1;
//                 left=int.parse(leftpn)+1;
//                 if(rightplus<0){
//                   right=iotModel.right;
//                   right=0;
//                 }
//                 else if(left<0){
//                   left=iotModel.left;
//                   left=0;
//                 }
//                 rightpn=(rightplus).toString();
//                 right=iotModel.right;
//                 leftpn=(leftplus).toString();
//                 left=iotModel.left;

//                 //pushbutton=5;
//               }
//               else {
//                right=0;
//                 readData();
//                 right =int.parse(rightpn)-1;
//                 left=int.parse(leftpn)+1;
//                 if(right<0){
//                   right=0;
//                 }
//                 else if(left<0){
//                   left=0;
//                 }
//                 rightpn=(right).toString();
//                 leftpn=(left).toString();
//                 //pushbutton=5;

//               }
//               print('$right');
//               editDatabase();
//               readData();
             
//             });
//           },
//           icon: Icon(Icons.arrow_forward),
//           label: Text(''),
//           ),
//       ),
//     );
//   }


  // Widget timeplus1(){
  //   readData();
  //   return Container(
  //     padding: new EdgeInsets.all(30.0),
  //     child: SizedBox(
  //       height: 80,
  //       width: 80,
  //       child:  RaisedButton.icon(
  //         color: Colors.lightGreenAccent[400],
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0)
  //         ),
  //         onPressed: (){
  //           setState(() {
  //             time=time;
  //             if(time==0){
  //               readData();
  //               time =int.parse(timepn)+100;
  //               if(timeplus<0){
  //                 time=iotModel.time;
  //                 time=0;
  //               }
            
  //               timepn=(timeplus).toString();
  //               time=iotModel.time;

  //             }
  //             else {
  //              time=0;
  //               readData();
  //               time=int.parse(timepn)+100;
  //               if(time<0){
  //                 time=0;
  //               }
  //               timepn=(time).toString();
  //             }
  //             print('$time');
  //             editDatabase();
  //             readData();
             
  //           });
  //         },
  //         icon: Icon(Icons.add),
  //         label: Text(''),
  //         ),
  //     ),
  //   );
  // }

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



  // Widget rightWhell(){
  //   // readData();
  //   // editDatabase();
  //   return Container(
  //     width: 300.0,
  //     child: TextFormField(
  //       inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
  //       maxLines: null,
  //       keyboardType: TextInputType.number,
  //       controller: textEditright,
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


//   Widget textTime() {
//     return Text(
//       'เวลา',
//       style: TextStyle(
//           fontSize: 35.0, 
//           fontWeight: FontWeight.bold,
//           fontFamily: 'Muffin-Regular', 
//           color: Colors.black),
//     );
//   } 

//   Widget settingTime(){
//     //readData();
//     //editDatabase();
//     return Container(
//       width: 300.0,
//       child: TextFormField(
//         inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
//         maxLines: null,
//         keyboardType: TextInputType.number,
//         controller: textEdittime,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           icon: Icon(Icons.timer,
//           size: 30.0,
//           color: Colors.black,
//           ),
//           labelText: 'ระบุเวลาที่ต้องการ',
//           hintText: ''
//         ),
//         style: TextStyle(
//           fontSize:18.0,
//            //color:Colors.deepOrange,
//            fontWeight:FontWeight.bold,
//            fontFamily: 'Righteous-Regular'
//       ),
//       ),
//     );
//   }

// Widget blocksettime(){
//     return Container(child: Container(
//           width: 400.0,
//           padding: EdgeInsets.all(16.0),
//             child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               textTime(),settingTime()
//               ],
//           ),
//           ),);
//   }

  //  Widget blockforward(){
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
  //               blockcenter2(),
  //               //blocksettime()
  //             ],
  //         ),
  //         ),
            
  //   );
  // }

  Widget  blockforward(){
    return Column(
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
        title : Text('ตั้งค่าเลี้ยวซ้าย',
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
                blockforward()
            ],)
          ),
      ),);
  }
}