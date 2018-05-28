import processing.video.*;

Capture video;
PFont myFont;

void captureEvent(Capture video) {
  video.read();
}

void setup() {  
  size(1024, 576);

  video = new Capture(this, 1024, 576);
  
  video.start();
  
  String[] fontList = PFont.list();
  printArray(fontList);
  myFont = createFont("Calibri", 32);
  textFont(myFont);
  
}

// Step 6. Display the image.
void draw() {
  smooth();
  background(video);
  HUD();
}

void HUD(){
    live(0,0);
    scoreBoard(width-100, 200);
}


void live(int posX, int posY){
  textSize(20);
  fill(255,0,0);
  ellipse(16,22,15,15);
  fill(255);
  stroke(10);
  text("LIVE", 30, 30); 
}

void scoreBoard(int posX, int posY){
  fill(0,0,0, 127);  // Display at half opacity
  rect(posX - 20 ,posY - 50,150,500, 20);
  int n = 4;
  int[] score = {20,15,10,5,0};
  String[] player = {  "Scooby",
                       "Samy",
                       "ValRobotics",
                       "Snoopy",
                       "Pepito" };
  fill(220,220,220, 255);  // Display at half opacity
  for(int i = 0; i <= n; i++){
     text(player[i] + " : " + score[i] , posX, posY + 30*i); 
  }
  
  
}

void game(int posX, int posY){
  fill(0,0,0, 127);  // Display at half opacity
  rect(posX - 20 ,posY - 50,200,100, 20);
  
  
}

void player(){
  
}
