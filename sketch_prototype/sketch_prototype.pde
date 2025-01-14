int currentPage = 1;
int[] blockX = {10, 70, 130, 190, 250};
int[] blockY = {50, 50, 50, 50, 50}; // Separate Y positions for each block
int blockWidth = 50;
int blockHeight = 100;
int selectedBlock = -1;
boolean[] blockTeleported = {false, false, false, false, false};

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
  text("Back", 340, 386);

  noStroke();
  fill(100, 150, 255);
  rect(290, 300, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Closet", 340, 325);

  // Restart button
  fill(255, 0, 0); // Red color for the restart button
  rect(20, 360, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Restart", 70, 386);

  // Doll
  fill(230, 220, 202);
  noStroke(); // Ensure no outline for the doll
  ellipse(200, 36, 50, 50); // head
  rect(178, 80, 50, 100); // torso
  rect(178, 160, 15, 150); // left leg
  rect(213, 160, 15, 150); // right leg

  // Draw teleported blocks
  for (int i = 0; i < blockX.length; i++) {
    if (blockTeleported[i]) {
      fill(getBlockColor(i));
      noStroke(); // Ensure no outline
      rect(blockX[i], blockY[i] + 100, blockWidth, blockHeight); // Adjust Y position
    }
  }
}

void drawPage3() {
  background(44, 230, 190);
  noStroke();

  // Draw blocks
  for (int i = 0; i < blockX.length; i++) {
    fill(getBlockColor(i));
    noStroke(); // Ensure no outline
    rect(blockX[i], blockY[i], blockWidth, blockHeight);
  }

  // Back button
  fill(100, 150, 255);
  noStroke(); // Ensure no outline for the back button
  rect(290, 360, 100, 40);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Back", 340, 386);
}

void mousePressed() {
  if (currentPage == 1 && mouseX > 150 && mouseX < 250 && mouseY > 180 && mouseY < 220) {
    currentPage = 2;
  } else if (currentPage == 2 && mouseX > 290 && mouseX < 390 && mouseY > 360 && mouseY < 400) {
    currentPage = 1;
  } else if (currentPage == 2 && mouseX > 290 && mouseX < 390 && mouseY > 300 && mouseY < 340) {
    currentPage = 3;
  } else if (currentPage == 3 && mouseX > 290 && mouseX < 390 && mouseY > 360 && mouseY < 400) {
    currentPage = 2;
  } else if (currentPage == 3) {
    for (int i = 0; i < blockX.length; i++) {
      if (mouseX > blockX[i] && mouseX < blockX[i] + blockWidth && mouseY > blockY[i] && mouseY < blockY[i] + blockHeight) {
        blockTeleported[i] = true;
        blockX[i] = 200; // Set a fixed X position for teleportation
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
    
    // Check if Restart button is clicked
    if (mouseX > 20 && mouseX < 120 && mouseY > 360 && mouseY < 400) {
      for (int i = 0; i < blockTeleported.length; i++) {
        blockTeleported[i] = false; // Reset block teleported status
      }
    }
  }
}

void mouseDragged() {
  if (currentPage == 2 && selectedBlock != -1) {
    blockX[selectedBlock] = mouseX - blockWidth / 2;
    blockY[selectedBlock] = mouseY - 100; // Update Y position based on mouse, adjusted for page offset
  }
}

void mouseReleased() {
  selectedBlock = -1; // Deselect block on mouse release
}

color getBlockColor(int index) {
  switch (index) {
    case 0: return color(150, 187, 162);
    case 1: return color(252, 213, 84);
    case 2: return color(42, 42, 42);
    case 3: return color(249, 200, 223);
    case 4: return color(162, 215, 185);
    default: return color(255);
  }
}
