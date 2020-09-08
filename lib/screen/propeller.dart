import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lawnmower/screen/iot_model.dart';
import 'package:characters/characters.dart';

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

  // Widget propeller(){
  //   // readData();
  //   // editDatabase();
  //   return Container(
  //     width: 300.0,
  //     child: TextFormField(
  //       inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
  //       maxLines: null,
  //       keyboardType: TextInputType.number,
  //       controller: textEditfast,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         // icon: Icon(Icons.lens,
  //         // size: 30.0,
  //         // color: Colors.black,
  //         // ),
  //         labelText: 'ระบุค่าที่ต้องการ',
  //         hintText: '0-180° '
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
Widget propeller1(){
    readData();
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 110,
        child:  RaisedButton.icon(
          color: Colors.tealAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
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
          icon: Icon(Icons.flash_on),
          label: Text('15°',
          style: TextStyle(
          fontSize: 20.0, 
          fontWeight: FontWeight.bold, 
          ),
          ),
          ),
      ),
    );
  }

  Widget propeller2(){
    readData();
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 110,
        child:  RaisedButton.icon(
          color: Colors.tealAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
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
              //readData();
             
            });
          },
          icon: Icon(Icons.flash_on),
          label: Text('20°',style: TextStyle(
          fontSize: 20.0, 
          fontWeight: FontWeight.bold, 
          ),),
          ),
      ),
    );
  }
  Widget propeller3(){
    readData();
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 110,
        child:  RaisedButton.icon(
          color: Colors.tealAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
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
              //readData();
             
            });
          },
          icon: Icon(Icons.flash_on),
          label: Text('30°',style: TextStyle(
          fontSize: 20.0, 
          fontWeight: FontWeight.bold, 
          ),),
          ),
      ),
    );
  }
  Widget propeller4(){
    readData();
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 110,
        child:  RaisedButton.icon(
          color: Colors.tealAccent[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          onPressed: (){
            setState(() {
              fast1Int=fast1Int;
              if(fast1Int==0){
                readData();
                fast1Int=40;

               
              }
              else {
               fast1Int=40;
                

              }
              print('$fast1Int');
              editDatabase();
              //readData();
             
            });
          },
          icon: Icon(Icons.flash_on),
          label: Text('40°',style: TextStyle(
          fontSize: 20.0, 
          fontWeight: FontWeight.bold, 
          ),),
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

  Widget propeller1520(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      propeller1(),propeller2()
      ],
    );
  }
  Widget propeller3040(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      propeller3(),propeller4()
      ],
    );
  }

  Widget block(){
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
                propeller1520(),propeller3040()
              ],
          ),
          ),
            
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                          colors: [Colors.teal[700],Colors.teal[400],Colors.teal[200],Colors.tealAccent,])),
          child: Center(
            child : Wrap(
              children: <Widget>[
                blockcenter1(),
                block()
            ],)
          ),
      ),);
  }
}