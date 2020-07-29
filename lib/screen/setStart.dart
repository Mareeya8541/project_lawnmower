import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';

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
    readData();
    editDatabase();
    return Container(
      width: 300.0,
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

  Widget buttonStart(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 80,
        width: 250,
        child:  RaisedButton.icon(
          color: Colors.limeAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          onPressed: (){
          //   var route = MaterialPageRoute(
          //   builder: (BuildContext context) => SettingStartPage()
          // );
          // Navigator.of(context).push(route);
          },
          icon: Icon(Icons.power_settings_new,size: 40,),
          label: Text('Start',
          style: TextStyle(
          fontSize:38.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }

  Widget buttonShut(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 80,
        width: 250,
        child:  RaisedButton.icon(
          color: Colors.redAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          onPressed: (){
          //   var route = MaterialPageRoute(
          //   builder: (BuildContext context) => SettingStartPage()
          // );
          // Navigator.of(context).push(route);
          },
          icon: Icon(Icons.close,size: 40,),
          label: Text('Shutdown',
          style: TextStyle(
          fontSize:38.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Muffin-Regular'
      ),),
          ),
      ),
    );
  }

   Widget blockcenter(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buttonStart(),buttonShut()
              ],
          ),
          ),);
  }

  Widget blockcenter1(){
    return Container(child: Container(
          width: 350.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showText()
              ],
          ),
          ),);
  }


  Widget buttonchek(){
    readData();
    return Container(
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
            builder: (BuildContext context) => Home(
              // valueFromSetStart: textEditdelay.text,
            )
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


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Setting Start',
         style: TextStyle(
           fontSize: 25.0,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
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
                blockcenter1(),
                blockDelay(),
                blockcenter(),
                //bottonchecktest()
            ],)
          ),
      ),);
  }
}