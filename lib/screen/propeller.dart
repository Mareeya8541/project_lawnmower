import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';

class PropellerPage extends StatefulWidget {
  @override
  _PropellerPageState createState() => _PropellerPageState();
}

class _PropellerPageState extends State<PropellerPage> {

  Widget showText() {
    return Text(
      'ความเร็วใบพัด',
      style: TextStyle(
          fontSize: 35.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  }

  Widget propeller(){
    return Container(
      width: 300.0,
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        //controller: textEditEmail,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          // icon: Icon(Icons.lens,
          // size: 30.0,
          // color: Colors.black,
          // ),
          labelText: 'ระบุค่าที่ต้องการ',
          hintText: '0-180° '
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

  Widget block(){
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
                propeller()
              ],
          ),
          ),
            
    );
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
                block()
            ],)
          ),
      ),);
  }
}