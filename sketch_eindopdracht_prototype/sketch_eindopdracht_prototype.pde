int currentPage = 1;
int[] blockX = {10, 70, 130, 190, 250, 310, 10, 70, 130, 190, 250, 310};
int[] blockY = {50, 50, 50, 50, 50, 50, 190, 190, 190, 190, 190, 190};
int[] originalBlockX = {10, 70, 130, 190, 250, 310, 10, 70, 130, 190, 250, 310};
int[] originalBlockY = {50, 50, 50, 50, 50, 50, 190, 190, 190, 190, 190, 190};
int widthBlock = 15;
int heightBlock = 100;
int blockWidth = 50;
int blockHeight = 100;
int selectedBlock = -1;
boolean[] blockTeleported = {false, false, false, false, false, false, false, false, false, false, false, false};


void setup() {
  size(400, 400);
}

void draw() {
  background(255, 255, 255);
  if (currentPage == 1) {
    drawPage1();
  } else if (currentPage == 2) {
    drawPage2();
  } else if (currentPage == 3) {
    drawPage3();
  } else if (currentPage == 4) {
    drawPage4();
  }
}

void drawPage1() {
  background(150, 0, 24);
  noFill();
  fill(100, 150, 255);
  rect(150, 180, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("start", 200, 205);
  textSize(50);
  text("Dress her up!", 200, 150);
}

void drawPage2() {
  background(210, 31, 60);
  noStroke();
  fill(100, 150, 255);
  rect(290, 360, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Closet", 340, 390);
  
  fill(150, 10, 5);
  rect(20, 360, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Restart", 70, 386);

  fill(230, 220, 202);
  noStroke();
  ellipse(200, 36, 50, 50); // head
  rect(178, 80, 50, 100); // torso
  rect(178, 160, 15, 150); // left leg
  rect(213, 160, 15, 150); // right leg
  fill(230, 220, 202);
  rect(164, 80, 15, 120); // left arm
  rect(228, 80, 15, 120); // right arm

  for (int i = 0; i < blockX.length; i++) {
    if (blockTeleported[i]) {
      fill(getBlockColor(i));
      noStroke();
      rect(blockX[i], blockY[i] + 100, blockWidth, blockHeight);
      rect(blockX[i], blockY[i] + 100, widthBlock, heightBlock);
    }
  }
}

void drawPage3() {
  background(255, 20, 60);
  noStroke();
  fill(150, 0, 10);
  rect(290, 310, 100, 40);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Pants", 340, 335);
  
  for (int i = 0; i < blockX.length; i++) {
    fill(getBlockColor(i));
    noStroke();
    rect(originalBlockX[i], originalBlockY[i], blockWidth, blockHeight);
  }

  fill(100, 150, 255);
  rect(290, 360, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Back", 340, 386);
}

void drawPage4() {
  background(200, 20, 50); 
  
  for (int i = 0; i < blockX.length; i++) {
   fill (getBlockColor(i));
   noStroke();
   rect(originalBlockX[i], originalBlockY[i], widthBlock, heightBlock);
  }

}

void mousePressed() {
  if (currentPage == 1 && mouseX > 150 && mouseX < 250 && mouseY > 180 && mouseY < 220) {
    currentPage = 2;
  } else if (currentPage == 2 && mouseX > 290 && mouseX < 360 && mouseY > 360 && mouseY < 390) {
    currentPage = 3;
  } else if (currentPage == 3 && mouseX > 290 && mouseX < 390 && mouseY > 360 && mouseY < 400) {
    currentPage = 2;
  } else if (currentPage == 3 && mouseX > 290 && mouseX < 390 && mouseY > 310 && mouseY < 350) {
    currentPage = 4; 
  } else if (currentPage == 3) {
    for (int i = 0; i < blockX.length; i++) {
      if (mouseX > originalBlockX[i] && mouseX < originalBlockX[i] + blockWidth && mouseY > originalBlockY[i] && mouseY < originalBlockY[i] + blockHeight) {
        blockTeleported[i] = true;
        blockX[i] = 200;
        selectedBlock = i;
        currentPage = 2;
      }
    }
  }else if (currentPage == 4){
    for (int i = 0; i < blockX.length; i++){
      if (mouseX > originalBlockX[i] && mouseX < originalBlockX[i] + widthBlock && mouseY > originalBlockY[i] && mouseY < originalBlockY[i] + heightBlock){
        blockTeleported[i] = true;
        blockX[i] = 200;
        selectedBlock = i;
        currentPage = 2;
      }
    }
  } else if (currentPage == 2) {
    for (int i = 0; i < blockX.length; i++) {
      if (blockTeleported[i] && mouseX > blockX[i] && mouseX < blockX[i] + blockWidth && mouseY > (blockY[i] + 100) && mouseY < (blockY[i] + 100) + blockHeight) {
        selectedBlock = i;
      }
    }
    
  } else if (currentPage == 2) {
     for (int i = 0; i < blockX.length; i++) {
      if (blockTeleported[i] && mouseX > blockX[i] && mouseX < blockX[i] + widthBlock && mouseY > (blockY[i] + 100) && mouseY < (blockY[i] + 100) + heightBlock) {
        selectedBlock = i;
      }
    }
    if (mouseX > 20 && mouseX < 120 && mouseY > 360 && mouseY < 400) {
      for (int i = 0; i < blockTeleported.length; i++) {
        blockTeleported[i] = false;
      }
    }
  }
}

void mouseDragged() {
  if (currentPage == 2 && selectedBlock != -1) {
    blockX[selectedBlock] = mouseX - blockWidth / 2;
    blockY[selectedBlock] = mouseY - 100;
  }
}

void mouseReleased() {
  selectedBlock = -1;
}

color getBlockColor(int index) {
  switch (index) {
    case 0: return color(150, 187, 162);
    case 1: return color(252, 213, 84);
    case 2: return color(42, 42, 42);
    case 3: return color(249, 200, 223);
    case 4: return color(162, 215, 185);
    case 5: return color(42, 53, 244);
    case 6: return color(245, 65, 170);
    case 7: return color(30, 78, 210);
    case 8: return color(98, 23, 233);
    case 9: return color(230, 190, 90);
    case 10: return color(10, 29, 100);
    case 11: return color(67, 190, 100);
    case 12: return color(50, 150, 250);
    default: return color(255);
  }
}
