//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:characters/characters.dart';

class ReversePage extends StatefulWidget {
  @override
  _ReversePageState createState() => _ReversePageState();
}

class _ReversePageState extends State<ReversePage> {
  IotModel iotModel;
  var textEditleft = new TextEditingController();
  var textEditright = new TextEditingController();
  //String left="",right="";
  // String rightpn="0",leftpn="0";
  // int left,right,leftplus,rightplus;
  int speed=1;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  void initState() {
    super.initState();
    readData();
    
  }

  Future <void> readData() async {
    print('Read Data Work');
    DatabaseReference databaseReference = firebaseDatabase.reference().child('reverse');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      speed= iotModel.speed;
      
      // strButton=iotModel.buttonstr;
      // stopButton=iotModel.buttonstop;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('reverse');
     Map<dynamic,dynamic> map = Map();
    //  map['left']=textEditleft.text;
    //  map['right']=textEditright.text;
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

  // Widget leftText(){
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: <Widget>[
  //       leftWhellplus(),
  //       showleftwhell(),
  //       leftWhellnative()
  //     ],
  //   );
  // }
  // Widget blockcenter(){
  //   return Container(child: Container(
  //         width: 400.0,
  //         padding: EdgeInsets.all(0.0),
  //           child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             textLeft(),leftText()
  //             ],
  //         ),
  //         ),);
  // }

  Widget textRight() {
    return Text(
      'ระดับค่าความเร็ว',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  } 
  // Widget showRightwhell(){
  //   readData();
  //   return Text(rightpn.toString(),
  //   style: TextStyle(fontSize:35.0,
  //          color:Colors.black,
  //          fontWeight:FontWeight.bold,
  //          fontFamily: 'Muffin-Regular'
  //          ),);
  // }


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
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 200,
        child:  RaisedButton.icon(
          color: Colors.lightGreenAccent[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
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
          icon: Icon(Icons.flash_on),
          label: Text('ระดับ 1',
          style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
          ),
          ),
      ),
    );
  }
  Widget speed2(){
    readData();
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 200,
        child:  RaisedButton.icon(
          color: Colors.lightGreenAccent[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
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
          icon: Icon(Icons.flash_on),
          label: Text('ระดับ 2',
          style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
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
  // Widget blockcenter2(){
  //   return Container(child: Container(
  //         width: 400.0,
  //         padding: EdgeInsets.all(0.0),
  //           child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             textRight(),rightText()
  //             ],
  //         ),
  //         ),);
  // }
  Widget blockforward1(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.cyanAccent,Colors.cyan])),
        child: Container(
          width: 380.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              textRight(),
                rightText(),showleftwhell()
              ],
          ),
          ),
            
    );
  }
 Widget rigtleftRow(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        blockforward1()
      ],
    );
  }

  Widget blockforward(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.lightBlue[300],Colors.lightBlueAccent[100]])),
        child: Container(
          width: 380.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                //blockcenter()
              ],
          ),
          ),
            
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('ตั้งค่าถอยหลัง',
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
                          colors: [Colors.teal[700],Colors.teal[400],Colors.teal[200],Colors.tealAccent,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                rigtleftRow()
            ],)
          ),
      ),);
  }
}