class Wheel{
  int r = 100;
  int g = 100;
  int b = 100;
  float x = 100;
  float y = 100;
  
  void roll(){
    x += 2;
  }
  
  void drawMe(){
   fill(r,g,b);
   ellipse(x,y,100,100);
  }
};

 Wheel wiel1 = new Wheel();

void setup(){
  size(500,500);
  wiel1.r = 255;
}

void draw(){
// wiel1.roll();
 wiel1.drawMe();
}
