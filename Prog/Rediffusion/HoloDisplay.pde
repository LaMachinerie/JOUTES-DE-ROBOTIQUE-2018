public enum Location{
  BOTTOM(1),
  TOP(2),
  RIGHT(3),
  LEFT(4),
  CENTER(5),
  FLYING(6);
  
  private Location(int id){
    this.id = id;
  }
  
    public int toInt(){
    return id;
  }
  
  
  private int id;
}





//#########################################//
//#########################################//
//#########################################//





class HoloDisplay{
//#####Constructor#####

  //Default HoloDisplay Constructor. Override with yours in children
  HoloDisplay(){
    _posX = 0;
    _posY = 0;
    _opacity = 255;
    _backColor = color(255);
    _isVisible = false;
    _loc = Location.FLYING;
  }
  
//#####Method#####
  
  
  //Opening code goes here
  public void open(){}
  
  //Hidding code goes here 
  public void hide(){}
  
  //Display code goes here
  public void display(){}
  
  
//#####Attribut#####
  int _posX, _posY, _opacity;
  Location _loc;
  color _backColor;
  boolean _isVisible;
};







//#########################################//
//#########################################//
//#########################################//






class bottomBar extends HoloDisplay{
//#####Constructor#####
  
  bottomBar(){
    super();
    
    
  }


//#####Method#####
  
  
  
    //Opening code goes here
  public void open(){}
  
  //Hidding code goes here 
  public void hide(){}
  
  //Display code goes here
  public void display(int posX, int posY){
    noStroke();
    fill(0,0,0, 180);  // Display at half opacity
    rect(0 ,posY, width, height - posY);
    displayTime(width - 170, posY + 15);
  }
  
  
  // read actually date & time, create Variable
  void setTimestamp() {
    String Year, Month, Day, Hour, Minute, Second;
    Year = nf( year(), 4 );
    Month = nf( month(), 2 );
    Day = nf( day(), 2 );
    Hour = nf( hour(), 2 );
    Minute = nf( minute(), 2 );
    Second = nf( second(), 2 ); 
    String dayName = "";
    switch(Integer.parseInt(Day)){
     case 1:
       dayName = "Vendredi";
       break;
     case 2:
       dayName = "Samedi";
       break;
     case 3:
       dayName = "Dimanche";
       break;
     default:
       dayName = "Lundi";
       break;
    }
    
    _Time = dayName + " " + Day + " " + "Juin" + "   " + Hour + ":" +  Minute + ":" + Second;
  }


  void displayTime(int posX, int posY){
    setTimestamp();
    fill(240,240,240, 500);  // Display at half opacity
    textSize(14);
    text(_Time, _posX, _posY);
  }

//#####Attribut#####
  
  String _Time;
}





//#########################################//
//#########################################//
//#########################################//





class ScoreBoard extends HoloDisplay{
//#####Constructor#####

  //Default HoloDisplay Constructor. Override with yours in children
  ScoreBoard(){
    super();
  }
  
//#####Method#####
  
  
  //Opening code goes here
  public void open(){}
  
  //Hidding code goes here 
  public void hide(){}
  
  //Display code goes here
  public void display(int posX, int posY){
    noStroke();
    fill(0,0,0, 180);  // Display at half opacity
    rect(posX ,posY ,150, height - posY - 30, 20,0,0,0);
    int n = 4;
    int[] score = {20,15,10,5,0};
    String[] player = {  "Scooby",
                         "Samy",
                         "ValRobotics",
                         "Snoopy",
                         "Pepito" };
    fill(240,240,240, 500);  // Display at half opacity
    for(int i = 0; i <= n; i++){
       text(player[i] + " : " + score[i] , posX + 20 , posY + 30*i + 30); 
    }
  }
  
//#####Attribut#####

};
