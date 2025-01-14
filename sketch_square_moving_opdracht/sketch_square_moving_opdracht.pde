// Square properties
int[][] squares = {
  {50, 50, 30}, // Square 1: x, y, size
  {150, 50, 50}, // Square 2: x, y, size
  {250, 50, 70}  // Square 3: x, y, size
};

boolean dragging = false; // Flag to check if a square is being dragged
int draggingIndex = -1; // Index of the currently dragged square
PVector lastPoint; // To store the last mouse point

void setup() {
  size(400, 400); // Set the size of the window
}

void draw() {
  background(255); // Clear the background
  for (int i = 0; i < squares.length; i++) {
    fill(0, 0, 255); // Set the fill color to blue
    rect(squares[i][0], squares[i][1], squares[i][2], squares[i][2]); // Draw each square
  }
}

void mousePressed() {
  for (int i = 0; i < squares.length; i++) {
    // Check if the mouse is inside the square
    if (mouseX >= squares[i][0] && mouseX <= squares[i][0] + squares[i][2] &&
        mouseY >= squares[i][1] && mouseY <= squares[i][1] + squares[i][2]) {
      dragging = true; // Start dragging
      draggingIndex = i; // Store the index of the square being dragged
      lastPoint = new PVector(mouseX, mouseY); // Store the mouse position
      break; // Exit the loop once we find the square
    }
  }
}

void mouseDragged() {
  if (dragging && draggingIndex != -1) {
    // Calculate the new position of the square
    int dx = mouseX - (int)lastPoint.x;
    int dy = mouseY - (int)lastPoint.y;
    
    // Update the square's position
    squares[draggingIndex][0] += dx;
    squares[draggingIndex][1] += dy;
    lastPoint.set(mouseX, mouseY); // Update lastPoint
  }
}

void mouseReleased() {
  dragging = false; // Stop dragging when the mouse is released
  draggingIndex = -1; // Reset the dragging index
}
 
