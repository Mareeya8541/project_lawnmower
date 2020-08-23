

class IotModel{
  int buttonstr,buttonstop,control,left,right,fast1,fast2;
  String namestr,user,pass,delay,time,leftpn,rightpn,fast;

  IotModel(
    this.buttonstr,this.buttonstop,this.user,
    this.pass,this.delay,this.left,this.right,
    this.time,this.fast,this.control,this.leftpn,this.rightpn,this.fast1,this.fast2
  );

    IotModel.formMap(Map<dynamic,dynamic>map){
      buttonstr = map['buttonstr'];
      buttonstop = map['buttonstop'];
      user=map['user'];
      pass=map['pass'];
      delay=map['delay'];
      leftpn=map['left'];
      rightpn=map['right'];
      time=map['time'];
      fast1=map['fast'];
      control=map['control'];
    }

    Map<dynamic,dynamic> toMap(){
      final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
    
      map['buttonstr']=buttonstr;
      map['buttonstop']=buttonstop;
      map['user']=user;
      map['pass']=pass;
      map['delay']=delay;
      map['left']=leftpn;
      map['right']=rightpn;
      map['time']=time;
      map['fast']=fast1;
      map['control']=control;

      return map;
    }
}