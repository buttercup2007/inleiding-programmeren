void setup(){
  size(600,600);
}

void draw(){
  background(255,255,255);
 drawRight(250,250,200,10);
}

void drawRight(int x, int y, int sizeC, int aantal){
   for(int i = 0; i < aantal; i++){
    ellipse(x - sizeC/2,y,sizeC,sizeC);
    sizeC -=20;
  }
}
