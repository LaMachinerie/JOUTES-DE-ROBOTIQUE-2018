PFont myFont;



void HUD(){
  debug();
  live(0,0);
  
  
  //scoreBoard(width-120, 200);
  //bottomToolbar(0, height - 30);
  
}

void initHUD(){
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("Calibri", 26);
  textFont(myFont); 
}

void debug(){
 textSize(14);
 text("X:" + mouseX + "px | Y:" + mouseY + "px",10,height - 30);
 text("FPS:" + fps, 10, height - 50);
}



void live(int posX, int posY){
  textSize(20);
  fill(255,0,0);
  ellipse(16,22,15,15);
  fill(255);
  stroke(10);
  text("LIVE", 30, 30); 
}
