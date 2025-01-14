void setup() {
  size(500, 500);
  background(255,255,255);
  rect(100,100,100,100);
}

void draw() {
  
}

void mousePressed(){
  background(255,255,255) ;
  rect(mouseX,mouseY,100,100);
 
}

void mouseMoved(){
  background(255,255,255);
  rect(pmouseX,mouseY,100,100);
   
}


void mouseReleased() {
background(255,255,255);
rect(mouseY,mouseX,100,100);
}
