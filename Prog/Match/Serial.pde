import processing.serial.*;
Serial Arduino;

import javax.swing.JOptionPane;


final int MAXSECT = 6;
String check = "";
boolean connected = false;
boolean isWaiting = false;

String COMlist = "";

void Serial_init(){  
  String COMx = "";
  try {
    if(true) printArray(Serial.list());
    int numPorts = Serial.list().length;
     if (numPorts != 0) {
      if (numPorts >= 1) {
 COMx = (String) JOptionPane.showInputDialog(null, 
        "Selectionner le port Série", 
        "COM port", 
        JOptionPane.QUESTION_MESSAGE, 
        null, 
        Serial.list(), 
        Serial.list()[0]);
        if (COMx == null) exit();
        if (COMx.isEmpty()) exit();
      }
      Arduino = new Serial(this, COMx, 57600); // change baud rate to your liking
      Arduino.bufferUntil('\n'); // buffer until CR/LF appears, but not required..
    }
    else {
      JOptionPane.showMessageDialog(frame,"Device is not connected to the PC");
      exit();
    }
  }catch (Exception e)
  { //Print the type of error
    JOptionPane.showMessageDialog(frame,"COM port " + COMx + " is not available (maybe in use by another program)");
    println("Error:", e);
    exit();
  }
}

boolean state = false;

void serialEvent(Serial Arduino) {
 try{
     if(!connected) connected = true;
     String inString = Arduino.readStringUntil('\n');
     String msg = inString.replaceAll("\n", "");
     println("    Arduino > Processing :" + msg);
     char cmd = inString.charAt(0);
     switch(cmd){
        case 'D':
          sendInfo(State.INIT);
          println("Demarrage");
          break;
        case 'P':
          sendInfo(State.PREPARE);
          //GUI Placer les robots
          println("Preparation");
          resetMatch();
          break;
        case 'G':
          //GO
          sendInfo(State.START);
          println("Go !");
          break;
        case 'L':
        //Lap
          sendInfo(4);
          print("Tour n°");
          if(inString.charAt(0) == 'L'){
            String t = "";
            t += (inString.charAt(2));
            int lap =  Integer.parseInt(t) + 1;
            print(lap + ": ");
            String strTime = inString.substring(4,inString.length() - 2);
            long time = Integer.parseInt(strTime);
            println(time);
            
            Score[lap - 1] = time;
          }
          break;
        case 'F':
          sendInfo(5);
          //Fin de match
          curTeam.setScore(minimum(Score));
          println("Highscore :" + curTeam.getScore());
          saveScore();
          loadScore();
          println("Fin de match");
          break;
     }
     
     
  }catch(Exception e){
    e.printStackTrace();
  }
}
