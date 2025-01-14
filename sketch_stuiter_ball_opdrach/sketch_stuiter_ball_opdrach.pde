int x = 50;
int y = 50;
int speed = 6;

void setup() {
  size(700, 500);
}

void draw() {
  background(255,255,255);
  fill(255,0,0);
  ellipse(x, y, 20, 20);

  x += speed;//x = x+1;//x++;

  if (x > 700) {
    speed = speed - 6;//speed -= 6;
  }
  if (x < 0) {
    speed += 6; 
  }
  if (y > 500){ 
    speed = -6;
  } 
  if (y < 0){ 
    speed = 6;
  }

}
