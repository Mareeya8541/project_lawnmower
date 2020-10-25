import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:characters/characters.dart';
import 'package:lawnmower/screen/setting.dart';

class SettingStartPage extends StatefulWidget {
  @override
  _SettingStartPageState createState() => _SettingStartPageState();
}

class _SettingStartPageState extends State<SettingStartPage> {
  IotModel iotModel;
   var textEditdelay = new TextEditingController();
   String delay="";
   FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override

  void initState() {
    super.initState();
    readData();
    
  }

  Future <void> readData() async {
    print('Read Data Work');
    DatabaseReference databaseReference = firebaseDatabase.reference().child('start');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      delay=iotModel.delay;
      
      // strButton=iotModel.buttonstr;
      // stopButton=iotModel.buttonstop;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('start');
     Map<dynamic,dynamic> map = Map();
     map['delay']=textEditdelay.text;
    
    //  map['buttonstr']=strButton;
    //  map['buttonstop']=stopButton;
     
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }

  Widget showdelay(){
    readData();
    return Text('TIME  :  '+delay.toString()+' ms',
    style: TextStyle(fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
           ),);
  }

  Widget showText() {
    return Text(
      'ตั้งเวลาสตาร์ท',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  }

  Widget startDelay(){
    // readData();
    // editDatabase();
    return Container(
      width: 350.0,
      height: 80.0,
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        //obscureText: true,
        controller: textEditdelay,
        //delay=textEditdelay.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.timer,
          size: 30.0,
          color: Colors.black,
          ),
          labelText: 'ระบุเวลาที่ต้องการ',
          hintText: 'วินาที'
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

  Widget confirm(){
    readData();
    return Container(
     height: 90,
      padding: new EdgeInsets.all(5.0),
     child: RaisedButton(
       onPressed: (){
         createAlertDialog(context);
          
         },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.cyanAccent,Colors.cyan],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment:Alignment.center,
            child: Text(
              "ยืนยัน",
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

  createAlertDialog(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text('    ต้องการตั้งค่านี้ใช่หรือไม่ ?      (ARE YOUR SURE ? )    ',
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
            builder: (BuildContext context) => Home()
          );
          Navigator.of(context).push(route);
          editDatabase();
          },
          ),
          MaterialButton(child: Text('NO/ไม่ใช่',style: TextStyle(
          fontSize: 25.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),),
          onPressed: (){
            var route = MaterialPageRoute(
            builder: (BuildContext context) => SettingStartPage()
          );
          Navigator.of(context).push(route);
          },
          )
        ],
      );
    });
  }

  Widget blockDelay(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.white,Colors.white])),
        child: Container(
          width: 350.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                startDelay()
              ],
          ),
          ),
            
    );
  }

  //  Widget blockcenter(){
  //   return Container(child: Container(
  //         width: 350.0,
  //         padding: EdgeInsets.all(16.0),
  //           child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             //buttonStart(),buttonShut()
  //             ],
  //         ),
  //         ),);
  // }

  Widget blockcenter(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(50.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showdelay(),
              ],
          ),
          ),);
  }

  Widget blockcenter1(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(0.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showText()
              ],
          ),
          ),);
  }

  Widget blockconfirm(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(0.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              confirm()
              ],
          ),
          ),);
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
        title : Text('Setting Start',
         style: TextStyle(
           fontSize: 25.0,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
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
                blockDelay(),
                blockconfirm(),
               // blockcenter(),
                //bottonchecktest()
            ],)
          ),
      ),);
  }
}