int currentPage = 0; // Track the current page
boolean buttonHovered = false; // Track if the button is hovered

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  if (currentPage == 0) {
    drawPage1();
  } else if (currentPage == 1) {
    drawPage2();
  }
}

void drawPage1() {
  fill(0);
  textSize(32);
  text("Page 1", 50, 100);
  
  // Draw button
  fill(buttonHovered ? color(200, 200, 250) : color(100, 100, 250));
  rect(150, 200, 100, 50);
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Next", 200, 225);
}

void drawPage2() {
  fill(0);
  textSize(32);
  text("Page 2", 50, 100);
  
  // Draw button to go back
  fill(buttonHovered ? color(200, 200, 250) : color(100, 100, 250));
  rect(150, 200, 100, 50);
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Back", 200, 225);
}

void mouseMoved() {
  // Check if mouse is over the button
  buttonHovered = mouseX > 150 && mouseX < 250 && mouseY > 200 && mouseY < 250;
}

void mousePressed() {
  // Check if the button is clicked
  if (buttonHovered) {
    if (currentPage == 0) {
      currentPage = 1; // Go to next page
    } else if (currentPage == 1) {
      currentPage = 0; // Go back to the first page
    }
  }
}
