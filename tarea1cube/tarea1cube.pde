

boolean pause;
float angle=0;

int currentX, currentY;
void settings() {
  size(640,480,P3D);
  
}

void setup (){
  pause=false;
  currentX = 320;
  currentY = 240;
}



void draw() {
  background(135, 235, 164);
  stroke(0,0,255);
  
  if (mousePressed == true) {
    translate(mouseX,mouseY,0);
    currentX=mouseX;
    currentY=mouseY;
  }else{
    translate(currentX,currentY,0);
  }
  
  
  //fill(255,0,255);
  rotateY(angle);
  translate(-150,-150,-50);
  
  
  
  noFill();
  beginShape();
  vertex(100,100,0);
  vertex(200,100,0);
  vertex(200,200,0);
  vertex(100,200,0);
  endShape(CLOSE);
  
  beginShape();
  vertex(100,100,100);
  vertex(200,100,100);
  vertex(200,200,100);
  vertex(100,200,100);
  endShape(CLOSE);
  
  beginShape();
  vertex(100,100,100);
  vertex(200,100,100);
  vertex(200,100,0);
  vertex(100,100,0);
  endShape(CLOSE);
  
  
  beginShape();
  vertex(100,100,0);
  vertex(100,100,100);
  vertex(100,200,100);
  vertex(100,200,0);
  endShape(CLOSE);
  
  beginShape();
  vertex(200,100,0);
  vertex(200,100,100);
  vertex(200,200,100);
  vertex(200,200,0);
  endShape(CLOSE);
  
  
  
  
  
  if(pause){
    angle+=0.05f;
  }
  
   
  
  
}


void mouseClicked() {
  pause=!pause;
}
