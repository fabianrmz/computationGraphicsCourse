
float angulo;

float angleA;
float posA;
float posAz;

float angleS;
float posS;

float angleD;
float posD;

float angleF;
float posF;


void settings(){
   size(640,480, P3D);
   angulo=0;
   angleA=0;
   posA=0;
}


void setup(){
  
  
}

void draw(){
  background(0,0,0);
  translate(150,100,0);
    
    //  DEDO 1
    
    pushMatrix(); 
    translate(0,posA,posAz);
    if (keyPressed) {
    if (key == 'a' || key == 'A') {
      
      if(angleA>-1.6){
        angleA-=0.05f;
        posA+=1;
        posAz+=1.5;
      }
      
      }
     
     } else {
       angleA=0;
       posA=0;
       posAz=0;
    }
    rotateX(angleA);
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    pushMatrix(); 
    translate(0,100,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    //  DEDO 2
    pushMatrix(); 
    translate(100,0,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    pushMatrix(); 
    translate(100,100,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    
    //  DEDO 3
     pushMatrix(); 
    translate(200,0,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    pushMatrix(); 
    translate(200,100,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    
    
    
    //  DEDO 4
     pushMatrix(); 
    translate(300,0,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    pushMatrix(); 
    translate(300,100,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
}
