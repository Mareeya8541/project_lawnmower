import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';

class ReversePage extends StatefulWidget {
  @override
  _ReversePageState createState() => _ReversePageState();
}

class _ReversePageState extends State<ReversePage> {
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
    return Container(
      width: 300.0,
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        //controller: textEditEmail,
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
    return Container(
      width: 300.0,
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        //controller: textEditEmail,
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