PImage dog;

void setup(){
  dog = loadImage("dog.jpg");
    size(displayWidth,displayHeight);
}

void draw(){
  image(dog,0,0, width, height);
}

void settings(){
  fullScreen();
}
