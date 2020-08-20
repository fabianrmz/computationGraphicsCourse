//comentarios


/* mas comentarios */


float ejemplo = 5; 
float angulo=0;

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
    
  
  //fill(255,0,255);
  translate(100,100,0);
  noFill();
  
  beginShape();
  
  vertex(100,100,0);
  vertex(200,100,0);
  vertex(230,130,0);
  vertex(230,200,0);
  vertex(200,300,0);
  vertex(150,330,0);
  vertex(100,300,0);
  vertex(70,200,0);
  vertex(70,130,0);
  endShape(CLOSE);
  
  beginShape(LINES);
  vertex(140,300,0);
  vertex(160,300,0);
  vertex(125,280,0);
  vertex(175,280,0);
  endShape(CLOSE);
  

  
  beginShape();
  vertex(110,170,0);
  vertex(135,170,0);
  vertex(130,200,0);
  vertex(115,200,0);
  
  endShape(CLOSE);
  
  
}

void keyPressed(){
  
}

void mousePressed(){
}
