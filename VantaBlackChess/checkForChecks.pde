

//boolean that returns true if white pieces put the black king in check
boolean blackKingInCheck(){
  int kingHorz = pieces[1][12].horz;
  int kingVert = pieces[1][12].vert;
  int[] arr = new int[2];
  for(int i = 0; i<16; i++){
    if(pieces[0][i].alive){
      arr = squares[kingHorz][kingVert].moveAllowed(0,i,squares,false);
      if(arr[0] == 1){
        return true;
      }
    }
  }
  return false;
}

//boolean that returns true if black pieces put the white king in check
boolean whiteKingInCheck(){
  int kingHorz = pieces[0][12].horz ;
  int kingVert = pieces[0][12].vert ;
  int[] arr = new int[2];
  for(int i = 0; i<16; i++){
    if(pieces[1][i].alive){
      arr = squares[kingHorz][kingVert].moveAllowed(1,i,squares,false);
      if(arr[0] == 1){
        return true;
      }
    }
   
  }
   return false;
}


//boolean that returns true if a particular movement will put the black king in check 
//emptySquaresHorz, int emptySquaresVert are variables which describe squares which will be empty after a move
//moving piece describes what piece is attempting to make a movement
//occupiedSquareHorz, int occupiedSquareVert  are variables which describe squares which will be occupied after a move
//castle describes whether or not a given move is a castle
boolean blackKingWillBeInCheck(int emptySquaresHorz, int emptySquaresVert, int movingPiece,
int occupiedSquareHorz, int occupiedSquareVert, 
int castle)
 {
   
  //dead index will index any piece which will be taken in the move, since alive can't be altered to mantain sandboxing
  int deadIndex = -1;
 
  //tempSquares are identical but independent of squares
  Square[][] tempSquares = new Square[8][8];
  //initialize tempSquares as identical to squares in most ways
  for(int x = 0; x < 8; x++){
    for(int y = 0; y < 8; y++){
      tempSquares[x][y] = new Square(squares[x][y].x,squares[x][y].y, squares[x][y].horz, squares[x][y].vert, 
      squares[x][y].squareColor,squares[x][y].occupiedPiece, squares[x][y].occupiedColor);
    }
  }
  //change tempSquares squares's occupiedPiece and occupiedColor according to the specified movements
  if(castle == 2){
     tempSquares[0][0].occupiedColor = "none";
     tempSquares[4][0].occupiedColor = "none";
     tempSquares[1][0].occupiedColor = "none";
     tempSquares[2][0].occupiedColor = "black";
     tempSquares[2][0].occupiedPiece = 12;
     tempSquares[3][0].occupiedColor = "black";
     tempSquares[3][0].occupiedPiece = 8;
    
  }else if(castle == 3){
     tempSquares[4][0].occupiedColor = "none";
     tempSquares[7][0].occupiedColor = "none";
     tempSquares[5][0].occupiedColor = "black";
     tempSquares[5][0].occupiedPiece = 15;
     tempSquares[6][0].occupiedColor = "black";
     tempSquares[6][0].occupiedPiece = 12;
  }else{
    
    if(tempSquares[occupiedSquareHorz][ occupiedSquareVert].occupiedColor.equals("white")){
      deadIndex = tempSquares[occupiedSquareHorz][ occupiedSquareVert].occupiedPiece;
  }else{
      deadIndex = -1;
  }
     tempSquares[emptySquaresHorz][emptySquaresVert].occupiedColor = "none";
     tempSquares[emptySquaresHorz][emptySquaresVert].occupiedPiece = -1;
     tempSquares[ occupiedSquareHorz][ occupiedSquareVert].occupiedColor = "black";
     tempSquares[occupiedSquareHorz][ occupiedSquareVert].occupiedPiece = movingPiece;
     
  }
  
 int kingHorz = pieces[1][12].horz;
 int kingVert = pieces[1][12].vert;
 for(int i = 0; i < 8; i++){
   for(int j = 0; j<8; j++){
     if(tempSquares[i][j].occupiedColor.equals("black") &&
     tempSquares[i][j].occupiedPiece == 12){
       //sees if the king has moved and adjusts it's index accordingly
       kingHorz = tempSquares[i][j].horz;
       kingVert = tempSquares[i][j].vert;
     }
   }
 }
  int[] arr = new int[2];
  for(int i = 0; i<16; i++){
  
    //checks if a black piece is alive
    if(pieces[0][i].alive && i != deadIndex){
      //arr[0] is 1 if a given black piece will threaten the white king
      arr = tempSquares[kingHorz][kingVert].moveAllowed(0,i,tempSquares,false);
      if(arr[0] == 1){
        return true;
      }
    }
  
  }
 
  return false;
}

boolean whiteKingWillBeInCheck(int emptySquaresHorz, int emptySquaresVert, int movingPiece,
int occupiedSquareHorz, int occupiedSquareVert, 
int castle)
 {
   
 int deadIndex = -1;
 //  take position after board is determined
 
  //modify moveAllowed method to alternatively intiatiate and work with the tempSquare and 
  Square[][] tempSquares = new Square[8][8];
  //initialize tempSquares as clones of Squares
  for(int x = 0; x < 8; x++){
    for(int y = 0; y < 8; y++){
      //int x, int y, int horz, int vert, String squareColor, int occupiedPiece, String occupiedColor
      tempSquares[x][y] = new Square(squares[x][y].x,squares[x][y].y, squares[x][y].horz, squares[x][y].vert, 
      squares[x][y].squareColor,squares[x][y].occupiedPiece, squares[x][y].occupiedColor);
    }
  }
  if(castle == 0){
     tempSquares[0][7].occupiedColor = "none";
     tempSquares[4][7].occupiedColor = "none";
     tempSquares[1][7].occupiedColor = "none";
     tempSquares[2][7].occupiedColor = "white";
     tempSquares[2][7].occupiedPiece = 12;
     tempSquares[3][7].occupiedColor = "white";
     tempSquares[3][7].occupiedPiece = 8;
    
  }else if(castle == 1){
     tempSquares[4][7].occupiedColor = "none";
     tempSquares[7][7].occupiedColor = "none";
     tempSquares[5][7].occupiedColor = "white";
     tempSquares[5][7].occupiedPiece = 15;
     tempSquares[6][7].occupiedColor = "white";
     tempSquares[5][7].occupiedPiece = 12;
     
     //also add occupied piece v 
  }else{
    
    if(tempSquares[occupiedSquareHorz][ occupiedSquareVert].occupiedColor.equals("black")){
      deadIndex = tempSquares[occupiedSquareHorz][ occupiedSquareVert].occupiedPiece;
  }else{
      deadIndex = -1;
  }
     tempSquares[emptySquaresHorz][emptySquaresVert].occupiedColor = "none";
     tempSquares[emptySquaresHorz][emptySquaresVert].occupiedPiece = -1;
     tempSquares[ occupiedSquareHorz][ occupiedSquareVert].occupiedColor = "white";
     tempSquares[occupiedSquareHorz][ occupiedSquareVert].occupiedPiece = movingPiece;
     
  }
  
 int kingHorz = pieces[1][12].horz;
 int kingVert = pieces[1][12].vert;
 for(int i = 0; i < 8; i++){
   for(int j = 0; j<8; j++){
     if(tempSquares[i][j].occupiedColor.equals("white") &&
     tempSquares[i][j].occupiedPiece == 12){
       kingHorz = tempSquares[i][j].horz;
       kingVert = tempSquares[i][j].vert;
     }
   }
 }
  int[] arr = new int[2];
  //temp pieces array is actually also necessary in order to account for deaths
  //actually since only death is checked a simple variable of the "dead" piece should work
  for(int i = 0; i<16; i++){
  
    //checking black pieces put the white king in check
    if(pieces[1][i].alive && i != deadIndex){
      arr = tempSquares[kingHorz][kingVert].moveAllowed(1,i,tempSquares,false);
      if(arr[0] == 1){
        return true;
      }
    }
  
  }
 
  return false;
}
