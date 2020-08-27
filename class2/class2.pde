float angle = 0;

void settings() {
  size(640,480,P3D);
}


void setup(){
}

void draw(){
  rotateZ(mouseY*0.01f -10);
  background(0, 0, 0);
  
  
  fill(255,255,0);
  noStroke();
  lights();
  translate(320, 240, 0);
  sphere(60);
  
  
 
  fill(0,0,255);
  noStroke();
  lights();
  translate(0, 100, 0);
  rotateY(angle);

  translate(-100, -100, -50);
  
  sphere(20);
  
  
  
  
  
  fill(225,225,225);
  noStroke();
  lights();
  translate(0, 100, 0);
  rotateY(angle+50);
  translate(0, -100, -50);
  sphere(10);
  
  
  
  angle+=0.05f;
  

}
