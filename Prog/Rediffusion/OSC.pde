import oscP5.*;
import netP5.*;


public enum Error{
 DATAERROR(1),
 PATTERNERROR(2);
 
  private Error(int _id){
    id = _id;
  }
  
  int id(){
   return id; 
  }
  
  int id;
}


public enum State{
 START(1, "Go !"),
 RESET(2, "Faux départ"),
 PREPARE(3, "Préparation"),
 END(4, "Fin du Match");
 
  private State(int _id, String _name){
    id = _id;
    name = _name;
  }
  
  int id(){
   return id; 
  }
  
  String toString(){
    return name;
  }
  
  int id;
  String name;
}





OscP5 oscP5;
NetAddress myRemoteLocation;

void initCom(){
  oscP5 = new OscP5(this,12001);
  
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}

void sendError(int tag){
  OscMessage myMessage = new OscMessage("/error");
  myMessage.add(tag); // ajouter un int au message osc
  
  oscP5.send(myMessage, myRemoteLocation); 
}


void oscEvent(OscMessage messageEntrant) {
  if (messageEntrant.addrPattern().equals("/info") == true) {
    if (messageEntrant.typetag().equals("i") == true) {
  
      int arg0 = messageEntrant.get(0).intValue();
      
      println("info :" + arg0);
    }else sendError(Error.DATAERROR.id());
  }else sendError(Error.PATTERNERROR.id());
}
