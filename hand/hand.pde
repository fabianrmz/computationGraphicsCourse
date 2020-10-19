
float angulo;

float angleA;
float posA;
float posAz;

float angleS;
float posS;
float posSz;

float angleD;
float posD;
float posDz;

float angleF;
float posF;
float posFz;


void settings(){
   size(640,480, P3D);
   angulo=0;
   angleA=0;
   posA=0;
   angleS=0;
    posS=0;
    posSz=0;
   
   angleD=0;
    posD=0;
   posDz=0;
   
   angleF=0;
   posF=0;
   posFz=0;
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
    if (key == 'a' || key == 'A' || key == 'z' || key == 'Z') {
      
      if(angleA>-1.6){
        angleA-=0.05f;
        posA+=1;
        posAz+=2;
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
    translate(100,posS,posSz);
    
    if (keyPressed) {
    if ( key == 's' || key == 'S'|| key == 'z' || key == 'Z' ) {
      
      if(angleS>-1.6){
        angleS-=0.05f;
        posS+=1;
        posSz+=2;
      }
      
      }
     
     } else {
       angleS=0;
       posS=0;
       posSz=0;
    }
    rotateX(angleS);
    
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
    translate(200,posD,posDz);
    
    if (keyPressed) {
    if (key == 'd' || key == 'D' || key == 'z' || key == 'Z') {
      
      if(angleD>-1.6){
        angleD-=0.05f;
        posD+=1;
        posDz+=2;
      }
      
      }
     
     } else {
       angleD=0;
       posD=0;
       posDz=0;
    }
    rotateX(angleD);
    
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
    translate(300,posF,posFz);
    
     if (keyPressed) {
    if (key == 'f' || key == 'F' || key == 'z' || key == 'Z') {
      
      if(angleF>-1.6){
        angleF-=0.05f;
        posF+=1;
        posFz+=2;
      }
      
      }
     
     } else {
       angleF=0;
       posF=0;
       posFz=0;
    }
    rotateX(angleF);
    
    scale(1, 2, 1);
    box(50);
    popMatrix();
    
    pushMatrix(); 
    translate(300,100,0);
    scale(1, 2, 1);
    box(50);
    popMatrix();
}
