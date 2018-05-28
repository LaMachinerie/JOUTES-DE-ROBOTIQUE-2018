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
 INIT(0, "Initialisation"),
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
State lastState;


void initCom(){
  oscP5 = new OscP5(this,12000);
  
  myRemoteLocation = new NetAddress("127.0.0.1",12001);
}

void sendInfo(State st){
  OscMessage myMessage = new OscMessage("/info");
  
  myMessage.add(st.id()); // ajouter un int au message osc
  lastState = st;
  // envoyer le message
  oscP5.send(myMessage, myRemoteLocation); 
}



void oscEvent(OscMessage messageEntrant) {
  if (messageEntrant.addrPattern().equals("/error") == true) {
    sendInfo(lastState);
  }
}
