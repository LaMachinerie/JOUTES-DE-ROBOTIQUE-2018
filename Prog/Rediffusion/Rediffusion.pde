int fps = 60;


void captureEvent(Capture video) {
  video.read();
}

void setup() {  
  size(1024, 576);
  frameRate(fps);
  
  initCom();
  initVideo();
  initHUD();

}



void draw() {
  smooth();
  video();
  HUD();
}
