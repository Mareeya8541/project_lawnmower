import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawnmower/screen/home.dart';

class SettingStartPage extends StatefulWidget {
  @override
  _SettingStartPageState createState() => _SettingStartPageState();
}

class _SettingStartPageState extends State<SettingStartPage> {
  @override

  Widget showText() {
    return Text(
      'ตั้งค่าหน่วงเวลาสตาร์ท',
      style: TextStyle(
          fontSize: 30.0, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Muffin-Regular', 
          color: Colors.black),
    );
  }

  Widget startDelay(){
    return Container(
      width: 300.0,
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        //controller: textEditEmail,
        decoration: InputDecoration(
          icon: Icon(Icons.settings,
          size: 30.0,
          color: Colors.black,
          ),
          labelText: '',
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
                showText(),startDelay()
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
                blockDelay(),
                blockcenter()
            ],)
          ),
      ),);
  }
}