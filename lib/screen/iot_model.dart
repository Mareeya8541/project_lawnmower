

class IotModel{
  int buttonstr,buttonstop;
  String namestr,user,pass,delay;

  IotModel(
    this.buttonstr,this.buttonstop,this.user,this.pass,this.delay
  );

    IotModel.formMap(Map<dynamic,dynamic>map){
      buttonstr = map['buttonstr'];
      buttonstop = map['buttonstop'];
      user=map['user'];
      pass=map['pass'];
      delay=map['delay'];
    }

    Map<dynamic,dynamic> toMap(){
      final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
    
      map['buttonstr']=buttonstr;
      map['buttonstop']=buttonstop;
      map['user']=user;
      map['pass']=pass;
      map['delay']=delay;
      

      return map;
    }
}