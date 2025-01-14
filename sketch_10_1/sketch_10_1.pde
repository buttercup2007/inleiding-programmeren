import controlP5. *; 

ControlP5 cp; 

Button knop1;
Button knop2;

void setup(){ 
  size(500,500);
  
  cp = new ControlP5(this); 
  
  knop1= cp.addButton("knop1")
  .setPosition(400,400)
  .setSize(100,100)
  .setCaptionLabel("Klik Mij");
  
   knop2= cp.addButton("knop2")
  .setPosition(0,400)
  .setSize(100,100)
  .setCaptionLabel("Klik Mij");
}

void draw(){ 
  
}

void knop1(){
 println("Goed gedaan!"); 
}

void knop2(){
 println("Helaas fout!"); 
}
