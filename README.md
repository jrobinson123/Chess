# Chess
My chess game known as Vanta Black Chess is a fully playable two-person chess game. Both black and white are human controlled, there is no AI component. All standard chess rules apply including castling and pawn promotion. When selecting a piece, the game will automatically check all possible legal moves and highlight them in red. The game can detect check mates and stale mates but not draws which must be manually declared. The game can be reset without restarting the program. 

# Dependencies
The entire program is written in Processing 3. If you don’t already have Processing you can download for free here: https://processing.org/download/. This program only uses one external library: processing.sound.

# Usage
Clone or download my code. From you computer you can play the game by opening one of the .pde files and pressing the play button in the Processing environment. You can also the export the application as a double-clickable executible on Mac or PC by pressing File/Export Application in the Processing evnironment.

# Code Explaination

## Drawing the board
Standard chess boards have 64 squares in 8 rows and 8 collumns. Therefore I created a Square class with each object acting as one square on a chessboard. I then created a 2D array of length 8 by 8. 
```processing
squares = new Square[8][8];
```
The Square class has a x and y variable to display it's position. Rect mode is set to corner. horz describes the horizontal component of the square (from 0 to 7) and vert describes the vertical component of the square (from 0 to 7). squareColor is either "black" or "white". The occupiedPiece is the index of the piece that occupies a square, it's -1 if the square is unoccupied. 

```processing
class Square {
  int x, y;
  int horz, vert;
  String squareColor;
  color Color;
  int textColor;
  int occupiedPiece;
  String occupiedColor;
  boolean pieceBeingTaken;
  Square(int x, int y, int horz, int vert, String squareColor, int occupiedPiece, String occupiedColor) {
    this.x = x;
    this.y = y;
    this.horz = horz;
    this.vert = vert;
    this.squareColor = squareColor;
    this.occupiedPiece = occupiedPiece;
    this.occupiedColor = occupiedColor;
    pieceBeingTaken = false;
  

    if (squareColor.equals("black")) {
      Color = color(11, 56, 1);
      textColor = 255;
    } else if (squareColor.equals("white")) {
      Color = color(255, 234, 171);
      textColor = 0;
    }
  }
  ```
