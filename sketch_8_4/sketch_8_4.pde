int ywaarde = 100;

size(500,500);
background(255, 255, 255);

for(int i = 0; i < 10; i++){
  rect(20, ywaarde, 10, 10);
  ywaarde += 20;
}
