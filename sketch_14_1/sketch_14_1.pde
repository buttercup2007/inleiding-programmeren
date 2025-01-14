PImage clouds;
PImage hog;
PImage kitten;

void setup(){
  size(500,500);
 clouds = loadImage("clouds.jpg"); 
 hog = loadImage("hog.jpg");
 kitten = loadImage("kitten.jpg");
}

void draw(){
  background(0);
 image(clouds,0,0); 
 image(hog, 0, 300, 300, 300);
 image(kitten, 300, 100, 300, 400);
}
