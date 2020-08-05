//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';

class ReversePage extends StatefulWidget {
  @override
  _ReversePageState createState() => _ReversePageState();
}

class _ReversePageState extends State<ReversePage> {
  IotModel iotModel;
  var textEditleft = new TextEditingController();
  var textEditright = new TextEditingController();
  String left="",right="";
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
      left=iotModel.left;
      right=iotModel.right;
      
      // strButton=iotModel.buttonstr;
      // stopButton=iotModel.buttonstop;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('reverse');
     Map<dynamic,dynamic> map = Map();
     map['left']=textEditleft.text;
     map['right']=textEditright.text;
    
   
     
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

  Widget leftWhell(){
    // readData();
    // editDatabase();
    return Container(
      width: 300.0,
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        controller: textEditleft,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.local_car_wash,
          size: 30.0,
          color: Colors.black,
          ),
          labelText: 'ระบุค่าที่ต้องการ',
          hintText: ''
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

  Widget blockcenter(){
    return Container(child: Container(
          width: 400.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              textLeft(),leftWhell()
              ],
          ),
          ),);
  }

  Widget textRight() {
    return Text(
      'ล้อขวา',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  } 

  Widget rightWhell(){
    // readData();
    // editDatabase();
    return Container(
      width: 300.0,
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        controller: textEditright,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.local_car_wash,
          size: 30.0,
          color: Colors.black,
          ),
          labelText: 'ระบุค่าที่ต้องการ',
          hintText: ''
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

  Widget blockforward(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.lightBlue[300],Colors.lightBlueAccent[100]])),
        child: Container(
          width: 350.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                blockcenter(),
                blockcenter2()
              ],
          ),
          ),
            
    );
  }

  Widget blockcenter2(){
    return Container(child: Container(
          width: 400.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              textRight(),rightWhell()
              ],
          ),
          ),);
  }

  Widget buttonchek(){
    readData();
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
            builder: (BuildContext context) => Home()
          );
          Navigator.of(context).push(route);
          editDatabase();
          },
          icon: Icon(Icons.check,size: 20,),
          label: Text(''),
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
        actions: <Widget>[buttonchek()],
      ),
      body:  Container(
          decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal[700],Colors.teal[400],Colors.teal[200],Colors.tealAccent,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                blockforward()
            ],)
          ),
      ),);
  }
}