int [][] board;
int currentPlayer;
boolean gameOver;

void setup() {
  size(500, 500);
  board = new int[3][3];
  gameOver = false;
  currentPlayer = 0;
 
}

void draw(){
  background(255);
  drawBoard();
  drawMarks();
  checkGameOver();

}

void drawBoard() {
 stroke(0);
 strokeWeight(3);
 for(int i = 1; i < 3; i++) {
   line(0, height / 3 * i, width, height / 3 * i);
   line(width / 3 * i, 0, width / 3 * i, height);
 }
}

void drawMarks() {
 textAlign(CENTER, CENTER); 
 textSize(60);
 fill(0);
 for(int i = 0; i < 3; i++) {
   for (int j = 0; j < 3; j++) {
     if (board[i][j] == 1) {
       text("X", j * 100 + 50, i * 100 + 50);
     } else if (board[i][j] == 2) {
       text("O", j * 100 + 50, i * 100 + 50);
     }
   }
 }
}

void mousePressed() {
  if (gameOver) return;
  
  int row = mouseY / 100;
  int col = mouseX / 100;
  
  if (row < 3 && col < 3 && board [row][col] == 0) {
    board[row][col] = currentPlayer + 1;
    currentPlayer = (currentPlayer + 1) % 2;
    redraw();
  }
}

void checkGameOver() {
  
  for (int i = 0; i < 3; i++) {
    if (board[0][0] != 0 && board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
      gameOver = true;
      showWinner(board[i][0]);
      return;
    }
    if (board[0][0] != 0 && board[1][1] == board[1][1] && board[1][1] == board [2][2]) {
      gameOver = true;
      showWinner(board[0][i]);
      return;
    }
  }
  
  if (board[0][0] !=0 && board[0][0] == board[1][1] && board[2][2] == board[1][0]) {
    gameOver = true;
    showWinner(board[0][0]);
    return;
  }
  if (board[0][2] != 0 && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
    gameOver = true;
    showWinner(board[0][2]);
    return;
  }
  
  boolean tie = true;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if(board[i][j] == 0) {
        tie = false;
      }
    }
  }
  if (tie) {
    gameOver = true;
    showTie();
  }
}
void showWinner(int player) {
  fill(0);
  textSize(32);
  text("Player" + (player == 1 ? "X" : "O") + "wins!", width / 2, height - 20);
}

void showTie() {
  fill(0);
  textSize(32);
  text("it's a tie!", width / 2, height - 20);
}
  
  
  
  
  
  
  
  
  
  
