int currentPage = 1; // Initialize currentPage
Square square; // Square object
int lastClickTime = 0; // Store the last click time
final int DOUBLE_CLICK_DELAY = 200; // Time interval for double-click in milliseconds

void setup() {
  size(400, 400); // Set window size
  square = new Square(150, 150, 40); // Initialize square in the second page
}

void draw() {
  background(255);

  if (currentPage == 1) {
    drawPage1();
  } else if (currentPage == 2) {
    drawPage2();
  }
}

void drawPage1() {
  fill(100, 150, 255);
  rect(150, 180, 100, 40); // Button to go to Page 2
  fill(0);
  textAlign(CENTER);
  textSize(16);
  text("Go to Page 2", 200, 205); // Button label

  // Draw the square if it has been teleported back
  if (square != null && square.isTeleported) {
    square.display(); // Display the square
  }
}

void drawPage2() {
  fill(200, 100, 100);
  rect(150, 180, 100, 40); // Button to go back to Page 1
  fill(0);
  textAlign(CENTER);
  textSize(16);
  text("Back to Page 1", 200, 205); // Button label

  // Draw the square
  square.display(); // Display the square
}

void mousePressed() {
  if (currentPage == 1) {
    // Navigate to Page 2
    if (mouseX > 150 && mouseX < 250 && mouseY > 180 && mouseY < 220) {
      currentPage = 2;
    }
  } else if (currentPage == 2) {
    // Navigate back to Page 1
    if (mouseX > 150 && mouseX < 250 && mouseY > 180 && mouseY < 220) {
      currentPage = 1;
    } else if (square.contains(mouseX, mouseY)) {
      // Teleport square to Page 1
      currentPage = 1; // Go back to Page 1
      square.teleport(); // Teleport square back to Page 1
    }
  }
}

void mouseDragged() {
  // Allow moving the square only when on Page 1
  if (currentPage == 1 && square.isTeleported && square.contains(mouseX, mouseY)) {
    square.x = mouseX - square.size / 2; // Move square with mouse
    square.y = mouseY - square.size / 2;
  }
}

void mouseReleased() {
  // Check for double-click on the square in Page 1
  if (currentPage == 1 && square.isTeleported && square.contains(mouseX, mouseY)) {
    int currentTime = millis();
    if (currentTime - lastClickTime < DOUBLE_CLICK_DELAY) {
      square.teleportBack(); // Teleport back to Page 2
    }
    lastClickTime = currentTime; // Update the last click time
  }
}

// Square class to represent the square
class Square {
  float x, y; // Position
  float size; // Size
  boolean isTeleported = false; // Track if the square has been teleported

  Square(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    fill(255, 0, 0); // Red color
    rect(x, y, size, size); // Draw the square
  }

  boolean contains(float mx, float my) {
    return (mx > x && mx < x + size && my > y && my < y + size);
  }

  void teleport() {
    isTeleported = true; // Mark the square as teleported
    x = random(50, 350); // Random position in the first page
    y = random(50, 350);
  }

  void teleportBack() {
    isTeleported = false; // Mark the square as not teleported
    x = 150; // Reset position or set to initial position in the second page
    y = 150;
  }
}
