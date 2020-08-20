//comentarios


/* mas comentarios */



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
  translate(200,200,0);
  noFill();
  rotateY(angulo);
  translate(-150,-150, 0);
  
  beginShape();
  
  vertex(100,100,0);
  vertex(200,100,0);
  vertex(200,200,0);
  vertex(100,200,0);
  endShape(CLOSE);
  
  angulo+= 0.05f;
}

void keyPressed(){
  
}

void mousePressed(){
}
