

class IotModel{
  int buttonstr,buttonstop,control,left,right,fast,fast2,speed,time,security;
  String namestr,user,pass,delay,leftpn,rightpn,timepn;

  IotModel(
    this.buttonstr,this.buttonstop,this.user,
    this.pass,this.delay,this.left,this.right,
    this.time,this.fast,this.control,this.leftpn,
    this.rightpn,this.fast2,this.speed,this.timepn,this.security
  );

    IotModel.formMap(Map<dynamic,dynamic>map){
      buttonstr = map['buttonstr'];
      buttonstop = map['buttonstop'];
      security=map['security'];
      user=map['user'];
      pass=map['pass'];
      delay=map['delay'];
      left=map['left'];
      right=map['right'];
      timepn=map['time'];
      fast=map['fast'];
      control=map['control'];
      speed=map['speed'];
    }

    Map<dynamic,dynamic> toMap(){
      final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
    
      map['buttonstr']=buttonstr;
      map['buttonstop']=buttonstop;
      map['security']=security;
      map['user']=user;
      map['pass']=pass;
      map['delay']=delay;
      map['left']=left;
      map['right']=right;
      map['time']=timepn;
      map['fast']=fast;
      map['control']=control;
      map['speed']=speed;

      return map;
    }
}