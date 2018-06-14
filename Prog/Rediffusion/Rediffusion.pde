int fps = 30;


void setup() {  
  size(1600, 900);
  frameRate(fps);
  
  initCom();
  //initVideo();
  initHUD();

}



void draw() {
  smooth();
  background(0);
  HUD();
}
