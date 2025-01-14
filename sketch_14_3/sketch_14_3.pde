import processing.sound.*;

SoundFile sound;
String buttonText = "Start";

void setup() {
  size(400, 400);
  sound = new SoundFile(this, "soundRainy.mp3"); 
  textAlign(CENTER, CENTER); 
  fill(0); 
}

void draw() {
  background(255); 
  textSize(32);
  text("Start", 200, 200);
}

void mousePressed() {
  if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 - 16 && mouseY < height / 2 + 16) {
    sound.play();
  }
}
