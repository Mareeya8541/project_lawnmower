

class IotModel{
  int buttonstr,buttonstop;
  String namestr,user,pass,delay,left,right,time,fast;

  IotModel(
    this.buttonstr,this.buttonstop,this.user,this.pass,this.delay,this.left,this.right,this.time,this.fast
  );

    IotModel.formMap(Map<dynamic,dynamic>map){
      buttonstr = map['buttonstr'];
      buttonstop = map['buttonstop'];
      user=map['user'];
      pass=map['pass'];
      delay=map['delay'];
      left=map['left'];
      right=map['right'];
      time=map['time'];
      fast=map['fast'];
    }

    Map<dynamic,dynamic> toMap(){
      final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
    
      map['buttonstr']=buttonstr;
      map['buttonstop']=buttonstop;
      map['user']=user;
      map['pass']=pass;
      map['delay']=delay;
      map['left']=left;
      map['right']=right;
      map['time']=time;
      map['fast']=fast;

      return map;
    }
}