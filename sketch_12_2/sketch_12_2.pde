int sec;
int aantalSpatsies = 0;
Boolean racing = true;

void setup(){
  size(500,500);
  
}

void draw(){
  background(255,255,255);
  
  sec = millis()/1000;
  if(sec >= 10){
    racing = false; 
    
  }
  fill(0,0,0);
  text("Spaties: " + aantalSpatsies, 200,200);
}

void keyReleased(){
 if(keyCode == 32 && racing){
   aantalSpatsies++;
 }
}
