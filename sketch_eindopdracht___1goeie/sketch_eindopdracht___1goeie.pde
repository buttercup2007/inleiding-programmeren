int currentPage = 1; //<>//
int[] blockX = {10, 70, 130, 190, 250, 310 };
int[] blockY = {50, 50, 50, 50, 50, 50};
int[] originalBlockX2 = {10, 70, 130, 190, 250, 310};
int[] originalBlockY2 = {50, 50, 50, 50, 50, 50};
int[] blockX2 = {10, 70, 130, 190, 250, 310 };
int[] blockY2 = {50, 50, 50, 50, 50, 50};
int[] originalBlockX = {10, 70, 130, 190, 250, 310};
int[] originalBlockY = {50, 50, 50, 50, 50, 50};
int blockWidth = 50;
int blockHeight = 100;
int widthBlock = 15;
int heightBlock = 130;
int selectedBlock = -1;
boolean[] blockTeleported = {false, false, false, false, false, false};
boolean[] blockTeleported2 = {false, false, false, false, false, false};

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

  // pop
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
    }
  }
      
  for (int i = 0; i < blockX2.length; i++) {
    if (blockTeleported2[i]) {
      fill(getBlockColor(i));
      noStroke();
      rect(blockX2[i], blockY2[i] + 100, widthBlock, heightBlock);
     
    }
  }
}
void drawPage3() {
  background(255, 20, 60);
  noStroke();
  
  for (int i = 0; i < blockX.length; i++) {
    fill(getBlockColor(i));
    noStroke();
    rect(originalBlockX[i], originalBlockY[i], blockWidth, blockHeight);
    
    fill(150, 10, 5);
    rect(20, 360, 100, 40);
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text("Pants", 70, 386);
    
  }

  // Back button
  fill(100, 150, 255);
  rect(290, 360, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Back", 340, 386);
}

void drawPage4() {
  background(255, 30, 60);
  
    for (int i = 0; i < blockX.length; i++) {
    fill(getBlockColor(i));
    noStroke();
    rect(originalBlockX2[i], originalBlockY2[i], widthBlock, heightBlock);
    }
}

void mousePressed() {
  if (currentPage == 1 && mouseX > 150 && mouseX < 250 && mouseY > 180 && mouseY < 220) {
    currentPage = 2;
  } else if (currentPage == 2 && mouseX > 290 && mouseX < 360 && mouseY > 360 && mouseY < 390) {
    currentPage = 3;
  } else if (currentPage == 3 && mouseX > 290 && mouseX < 390 && mouseY > 360 && mouseY < 400) {
    currentPage = 2;
  } else if (currentPage == 3 && mouseX > 20 && mouseX < 360 && mouseY > 360 && mouseY < 400) {
    currentPage = 4;
  } else if (currentPage == 2 && mouseX > 20 && mouseX < 120 && mouseY > 360 && mouseY < 400) {
    for (int i = 0; i < blockTeleported.length; i++) {
      blockTeleported[i] = false;
      blockX[i] = originalBlockX[i];
      blockY[i] = originalBlockY[i];
    }
    for (int i = 0; i < blockTeleported2.length; i++) {
      blockTeleported2[i] = false;
      blockX2[i] = originalBlockX2[i];
      blockY2[i] = originalBlockY2[i];
    } 
  } else if (currentPage == 3) {
    for (int i = 0; i < blockX.length; i++) {
      if (mouseX > originalBlockX[i] && mouseX < originalBlockX[i] + blockWidth && mouseY > originalBlockY[i] && mouseY < originalBlockY[i] + blockHeight) {
        blockTeleported[i] = true;
        blockX[i] = 200;
        selectedBlock = i;
        currentPage = 2;
      }
    }
  } else if (currentPage == 4) {
   for (int i = 0; i < blockX2.length; i++) {
    if (mouseX > originalBlockX2[i] && mouseX < originalBlockX2[i] + widthBlock && mouseY > originalBlockY2[i] && mouseY < originalBlockY2[i] + heightBlock) {
      blockTeleported2[i] = true;
      blockX2[i] = 200;
      selectedBlock = i;
      currentPage = 2;
    }
   }
  } else if (currentPage == 2) { 
    for (int i = 0; i < blockX.length; i++) {
      if (blockTeleported[i] && mouseX > blockX[i] && mouseY < blockX[i] + blockWidth && mouseY > (blockY[i] + 100) && mouseY < (blockY[i] + 100) + blockHeight) {
        selectedBlock = i;
      }
    }
    for (int i = 0; i < blockX2.length; i++) {
      if (blockTeleported2[i] && mouseX > blockX2[i] && mouseX < blockX2[i] + widthBlock && mouseY > (blockY2[i] + 100) && mouseY < (blockY2[i] + 100) + heightBlock) {
        selectedBlock = i;
      }
    }
  }
}

void mouseDragged() {
  if (currentPage == 2 && selectedBlock != -1) {
    if (blockTeleported[selectedBlock]) {
    blockX[selectedBlock] = mouseX - blockWidth / 2;
    blockY[selectedBlock] = mouseY - 100;
  } else if (blockTeleported2[selectedBlock]) {
    blockX2[selectedBlock] = mouseX - widthBlock / 2;
    blockY2[selectedBlock] = mouseY - 100;
   }
  }  
}


void mouseReleased() {
  selectedBlock = -1;
}

color getBlockColor(int index) {
  switch (index) {
  case 0:
    return color(154, 7, 0);
  case 1:
    return color(250, 77, 2);
  case 2:
    return color(245, 229, 2);
  case 3:
    return color(79, 245, 2);
  case 4:
    return color(10, 123, 245);
  case 5:
    return color(141, 2, 247);
  default:
    return color(255);
  }
}
