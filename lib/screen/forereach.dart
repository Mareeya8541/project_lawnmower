import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
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
  String rightpn="0",leftpn="0";
  int left,right,leftplus,rightplus;
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
      leftpn=iotModel.leftpn;
      rightpn=iotModel.rightpn;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('move');
     Map<dynamic,dynamic> map = Map();
     //map['left']=textEditleft.text;
     //map['right']=textEditright.text;
     map['left']=leftpn;
     map['right']=rightpn;
    
   
     
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
  Widget showleftwhell(){
    readData();
    return Text(leftpn.toString(),
    style: TextStyle(fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
           ),);
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

  Widget showRightwhell(){
    readData();
    return Text(rightpn.toString(),
    style: TextStyle(fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
           ),);
  }

  Widget textRight() {
    return Text(
      'ตั้งศูนย์ล้อ',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  } 

  Widget rightWhellplus(){
    readData();
    return Container(
      padding: new EdgeInsets.all(30.0),
      child: SizedBox(
        height: 50,
        width: 60,
        child:  RaisedButton.icon(
          color: Colors.tealAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)
          ),
          onPressed: (){
            setState(() {
              right=right;
              left=left;
              if(right==0){
                readData();
                right =int.parse(rightpn)+1;
                left = int.parse(leftpn)-1;
                if(rightplus&leftplus<0){
                  right=iotModel.right; 
                  right=0;
                  
                }
                else if(left<0){
                  left=iotModel.left;
                    left=0;
                }
                rightpn=(rightplus).toString();
                leftpn=(leftplus).toString();
                right=iotModel.right;
                left=iotModel.left;
                //pushbutton=5;
              }
              else {
               right=0;
               left=0;
                readData();
                right=int.parse(rightpn)+1;
                left = int.parse(leftpn)-1;
                if(right<0){
                  right=0;
                }
                else if(left<0){
                  left=0;
                }
                rightpn=(right).toString();
                leftpn=(left).toString();
                //pushbutton=5;

              }
              print('$right');
              editDatabase();
              readData();
             
            });
          },
          icon: Icon(Icons.arrow_back),
          label: Text(''),
          ),
      ),
    );
  }

Widget rightWhellnative(){
    readData();
    return Container(
      padding: new EdgeInsets.all(30.0),
      child: SizedBox(
        height: 50,
        width: 60,
        child:  RaisedButton.icon(
          color: Colors.tealAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)
          ),
          onPressed: (){
            setState(() {
              right=right;
              left=left;
              if(right==0){
                readData();
                right =int.parse(rightpn)-1;
                left = int.parse(leftpn)+1;
                if(rightplus<0){
                  right=iotModel.right;
                  right=0;
                  
                }
                else if (left<0){
                  left=iotModel.left;
                  left=0;
                }
                rightpn=(rightplus).toString();
                leftpn=(leftplus).toString();
                right=iotModel.right;
                left=iotModel.left;
                //pushbutton=5;
              }
              else {
               right=0;
               left=0;
                readData();
                right =int.parse(rightpn)-1;
                left = int.parse(leftpn)+1;
                if(right<0){
                  right=0;
                  
                }
                else if(left<0){
                  left=0;
                }
                rightpn=(right).toString();
                leftpn=(left).toString();
                //pushbutton=5;

              }
              print('$right');
              editDatabase();
              readData();
             
            });
          },
          icon: Icon(Icons.arrow_forward),
          label: Text(''),
          ),
      ),
    );
  }

  Widget rightText(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        rightWhellplus(),
        showleftwhell(),Text(' , ',style: TextStyle(
           fontSize: 35.0,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
        showRightwhell(),
        rightWhellnative()
      ],
    );
  }
  Widget blockcenter2(){
    return Container(child: Container(
          width: 400.0,
          padding: EdgeInsets.all(0.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              rightText(),
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

  // Widget blockforward(){
  //   return Container(
  //     decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(16),
  //                     gradient: LinearGradient(
  //                         colors: [Colors.lightBlue[300],Colors.lightBlueAccent[100]])),
  //       child: Container(
  //         width: 180.0,
  //         //height: 183.0,
  //         padding: EdgeInsets.all(16.0),
  //           child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //               //blockcenter(),
  //             ],
  //         ),
  //         ),
            
  //   );
  // }

  Widget blockforward1(){
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
              textRight(),
                blockcenter2()
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
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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