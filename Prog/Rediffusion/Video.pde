import processing.video.*;

Capture videoA;
Capture videoB;

boolean switchVids = true;


void initVideo(){

 
  String[] cameras = Capture.list();
 
  for (int i = 0; i < cameras.length; i++) {
    print("camera " + i + ": ");
    println(cameras[i]);
  }
 
  try {  
  videoA = new Capture(this, cameras[28]);
  videoA.start();
  
  
  videoB = new Capture(this, cameras[115]);
  videoB.start();
  
  
  }catch (Exception e) {
  println("Error attaching camera(s): " + e.getMessage());
  exit();
}

  

  
}


void video(){
  if(switchVids){
    image(videoA,0,0); 
  }else{
    image(videoB,0,0); 
  }
  
  
}


void keyPressed(){
  switchVids = !switchVids;
}
