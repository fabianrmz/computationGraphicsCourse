

//comentarios


/* mas comentarios */


float ejemplo = 5; 


//corre unvez al inicio
void settings() {
  size(640,480,P3D);
  
}


//corre una vez al inicio despues
void setup (){
  println("setup");
}

//corre una vez por cuadro
void draw() {
  background(255,255,255);
    
  stroke(0,255,255);
  
  //fill(255,0,255);
  noFill();
  beginShape();
 
  vertex(100,100,0);
  vertex(200,100,0);
  vertex(200,200,0);
  
  vertex(400,200,0);
  vertex(400,350,0);
  vertex(400,350,0);
  vertex(350,350,0);
  vertex(350,250,0);
  vertex(250,250,0);
  vertex(250,350,0);
  vertex(200,350,0);
  vertex(200,250,0);
  vertex(50,250,0);
  vertex(50,150,0);
  endShape(CLOSE);
  rect(mouseX,mouseY, 50,50);
}

void keyPressed(){
  
}

void mousePressed(){
}
