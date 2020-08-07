

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
  
  void setColor(color Color){
    this.Color = Color;
  }
  
  void display() {
    noStroke();
    fill(Color);
    rect(x, y, 100, 100);
    
  }

  void checkForClick() {
    if (mouseHover(x, y, 100, 100)) {
      if(occupiedColor.equals("white") && turn == 0){
        if(pieceSelected == occupiedPiece){
          pieceSelected = -1;
          resetSquareColors();
        }else{
          pieceSelected = occupiedPiece;
          showPossibleMoves();
        }
      }else if(occupiedColor.equals("black") && turn == 1){
        if(pieceSelected == occupiedPiece){
          pieceSelected = -1;
          resetSquareColors();
        }else{
          pieceSelected = occupiedPiece;
          showPossibleMoves();
        }
      }
      else if(pieceSelected != -1){
        int[] arr = new int[2];
        
        arr = moveAllowed(turn,pieceSelected, squares,true);
        
        if(arr[1] == 2){
                pieces[1][12].move(x + 50,y + 50, horz,vert);
                pieces[1][8].move(x + 150,y + 50, 3,vert);
                
                pieceSelected = -1;
                squares[0][0].occupiedColor = "none";
                squares[4][0].occupiedColor = "none";
                squares[3][0].occupiedColor = "black";
                squares[2][0].occupiedColor = "black";
                squares[0][0].occupiedPiece = -1;
                squares[4][0].occupiedPiece = -1;
                squares[3][0].occupiedPiece = 8;
                squares[2][0].occupiedPiece = 12;
                resetSquareColors();
                turn = 0;
                turnMessageColor = 255;
                turnMessage = "white's turn";
                
                if(blackKingInCheck()){
                  sword.play();
                }else if(whiteKingInCheck()){
                  sword.play();
                }else{
                  switchSound.play();
                }
                
              }else if(arr[1] == 3){
                pieces[1][12].move(x + 50,y + 50, horz,vert);
                pieces[1][15].move(x - 50,y + 50, 5,vert);
                squares[5][0].occupiedColor = "black";
                squares[5][0].occupiedPiece = 15;
                
                squares[6][0].occupiedColor = "black";
                squares[6][0].occupiedPiece = 12;
                
                squares[7][0].occupiedColor = "none";
                squares[7][0].occupiedPiece = -1;
                
                squares[4][0].occupiedColor = "none";
                squares[4][0].occupiedPiece = -1;
                pieceSelected = -1;
                resetSquareColors();
                turn = 0;
                turnMessageColor = 255;
                turnMessage = "white's turn";
                
                 if(blackKingInCheck()){
                  sword.play();
                }else if(whiteKingInCheck()){
                  sword.play();
                }else{
                  switchSound.play();
                }
              }
              else if(arr[1] == 0){
                
             
                pieces[0][12].move(x + 50,y + 50, horz,vert);
                pieces[0][8].move(x + 150,y + 50, 3,vert);
                pieceSelected = -1;
                squares[0][7].occupiedColor = "none";
                squares[4][7].occupiedColor = "none";
                squares[3][7].occupiedColor = "white";
                squares[2][7].occupiedColor = "white";
                squares[0][7].occupiedPiece = -1;
                squares[4][7].occupiedPiece = -1;
                squares[3][7].occupiedPiece = 8;
                squares[2][7].occupiedPiece = 12;
                resetSquareColors();
                turn = 1;
                turnMessageColor = 0;
                turnMessage = "blacks's turn";
                if(blackKingInCheck()){
                  sword.play();
                }else if(whiteKingInCheck()){
                  sword.play();
                }else{
                  switchSound.play();
                }
                
              }else if(arr[1] == 1){
                
                pieces[0][12].move(x + 50,y + 50, horz,vert);
                pieces[0][15].move(x - 50,y + 50, 5,vert);
                squares[5][7].occupiedColor = "white";
                squares[5][7].occupiedPiece = 15;
                
                squares[6][7].occupiedColor = "white";
                squares[6][7].occupiedPiece = 12;
                
                squares[7][7].occupiedColor = "none";
                squares[7][7].occupiedPiece = -1;
                
                squares[4][7].occupiedColor = "none";
                squares[4][7].occupiedPiece = -1;
                pieceSelected = -1;
                resetSquareColors();
                turn = 1;
                turnMessageColor = 0;
                turnMessage = "blacks's turn";
                
                if(blackKingInCheck()){
                  sword.play();
                }else if(whiteKingInCheck()){
                  sword.play();
                }else{
                  switchSound.play();
                }
         }
        else if(arr[0] == 1 && arr[1] == -1){
          if(occupiedColor.equals("black")){
            pieces[1][occupiedPiece].alive = false;
             pieceBeingTaken = true;
          }else if(occupiedColor.equals("white")){
            pieces[0][occupiedPiece].alive = false;
            pieceBeingTaken = true;
          }
          
          else{
            pieceBeingTaken = false;
            
          }
          
          occupiedColor = pieces[turn][pieceSelected].pieceColor;
          occupiedPiece = pieceSelected;
          squares[pieces[turn][pieceSelected].horz][pieces[turn][pieceSelected].vert].occupiedPiece = -1;
          squares[pieces[turn][pieceSelected].horz][pieces[turn][pieceSelected].vert].occupiedColor = "none";   
          pieces[turn][pieceSelected].move(x + 50,y + 50,horz,vert);
          
          if(blackKingInCheck()){
            message = "black in check";
          }else if(whiteKingInCheck()){
            message = "white king in check";
          }else{
            message = ""; 
          }
          
          if(turn == 0){
            turn = 1;
            turnMessageColor = 0;
            turnMessage = "black's turn";
          }else{
            turn = 0;
            turnMessageColor = 255;
            turnMessage = "white's turn";
          }
          pieceSelected = -1;
          resetSquareColors();
          
          if(blackKingInCheck()){
              sword.play();
            }else if(whiteKingInCheck()){
              sword.play();
            }else{
              if(pieceBeingTaken){
                 takeSound.play();
              }else{
                 click.play();
              }
            }
          
          
        }
        decideMaterialBalance();
        
      }
    }
  }
  
  /*
  boolean checkForChecks, int colorIndex, 
int emptySquaresHorz, int emptySquaresVert, int movingPiece,
int occupiedSquareHorz, int occupiedSquareVert, 
int castle
  */
  
  int[] moveAllowed(int colorIndex, int piece, Square[][] testSquares, boolean checkForChecks){
    String type = pieces[colorIndex][piece].type;
    int[] arr;
    arr = new int[2];
    if(colorIndex == 0){
      if(type.equals("pawn")){
        if(whitePawnMoveAllowed(piece,testSquares) && considerChecks(checkForChecks,0,pieces[0][piece].horz,
        pieces[0][piece].vert,pieces[0][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("knight")){
        if(whiteKnightMoveAllowed(piece) && considerChecks(checkForChecks,0,pieces[0][piece].horz,
        pieces[0][piece].vert,pieces[0][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
          
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("rook") && considerChecks(checkForChecks,0,pieces[0][piece].horz,
        pieces[0][piece].vert,pieces[0][piece].index,horz,vert,-1)){
        if(whiteRookMoveAllowed(piece,testSquares)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("bishop") && considerChecks(checkForChecks,0,pieces[0][piece].horz,
        pieces[0][piece].vert,pieces[0][piece].index,horz,vert,-1)){
        if(whiteBishopMoveAllowed(piece,testSquares)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("queen")){
        if( (whiteBishopMoveAllowed(piece,testSquares) || whiteRookMoveAllowed(piece,testSquares))
        && considerChecks(checkForChecks,0,pieces[0][piece].horz,
        pieces[0][piece].vert,pieces[0][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
        
      }else if(type.equals("king")){
        arr = moveAllowedWhiteKing(piece,testSquares);
        if(arr[0] == 1 && considerChecks(checkForChecks,0,pieces[0][piece].horz,
        pieces[0][piece].vert,pieces[0][piece].index,horz,vert,arr[1])){
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else{
        arr[0] = 0;
        arr[1] = -1;
        return arr;
      }
    //if(turn == 1)
    }else{
        if(type.equals("pawn")){
        if(blackPawnMoveAllowed(piece,testSquares) && 
         blackPawnMoveAllowed(piece,testSquares) && considerChecks(checkForChecks,1,pieces[1][piece].horz,
        pieces[1][piece].vert,pieces[1][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("bishop")){
        if(blackBishopMoveAllowed(piece,testSquares) && considerChecks(checkForChecks,1,pieces[1][piece].horz,
        pieces[1][piece].vert,pieces[1][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }  
      }else if(type.equals("knight")){
        if(blackKnightMoveAllowed(piece) && considerChecks(checkForChecks,1,pieces[1][piece].horz,
        pieces[1][piece].vert,pieces[1][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("rook")){
        if(blackRookMoveAllowed(piece,testSquares) && considerChecks(checkForChecks,1,pieces[1][piece].horz,
        pieces[1][piece].vert,pieces[1][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("queen")){
        if( (blackRookMoveAllowed(piece,testSquares) || blackBishopMoveAllowed(piece,testSquares))
        && considerChecks(checkForChecks,1,pieces[1][piece].horz,
        pieces[1][piece].vert,pieces[1][piece].index,horz,vert,-1)){
          arr[0] = 1;
          arr[1] = -1;
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else if(type.equals("king")){
        arr = moveAllowedBlackKing(piece,testSquares);
        if(arr[0] == 1 && considerChecks(checkForChecks,1,pieces[1][piece].horz,
        pieces[1][piece].vert,pieces[1][piece].index,horz,vert,arr[1])){
          return arr;
        }else{
          arr[0] = 0;
          arr[1] = -1;
          return arr;
        }
      }else{
        arr[0] = 0;
        arr[1] = -1;
        return arr;
      }
    }
   }
    
    
  
  //add new boolean for new pieces
  boolean whitePawnMoveAllowed(int piece, Square[][] testSquares){
    int pieceHorz = pieces[0][piece].horz;
    int pieceVert = pieces[0][piece].vert;
    if(pieceVert == 6){
      if(pieceHorz == horz 
      && ( (vert == pieceVert - 1 && occupiedColor.equals("none")) ||
      (vert == pieceVert - 2 && occupiedColor.equals("none")
      && testSquares[pieceHorz][pieceVert -1].occupiedColor.equals("none"))) ){
        return true;
        
      }else if(vert == pieceVert - 1 && (pieceHorz == horz - 1 || pieceHorz == horz + 1)
      && occupiedColor.equals("black")){
        return true;
      }else{
        return false;
      }
      
    }else{
      if(pieceHorz == horz 
      && (vert == pieceVert - 1 && occupiedColor.equals("none"))){
        return true;
        
      }else if(vert == pieceVert - 1 && (pieceHorz == horz - 1 || pieceHorz == horz + 1)
      && occupiedColor.equals("black")){
        return true;
      }else{
        return false;
      }
    }
  }
  
  boolean blackPawnMoveAllowed(int piece, Square[][] testSquares){
    int pieceHorz = pieces[1][piece].horz;
    int pieceVert = pieces[1][piece].vert;
    if(pieceVert == 1){
      if(pieceHorz == horz 
      && ( (vert == pieceVert + 1 && occupiedColor.equals("none")) ||
      (vert == pieceVert + 2 && occupiedColor.equals("none")
      && testSquares[pieceHorz][pieceVert + 1].occupiedColor.equals("none"))) ){
        return true;
        
      }else if(vert == pieceVert + 1 && (pieceHorz == horz - 1 || pieceHorz == horz + 1)
      && occupiedColor.equals("white")){
        return true;
      }else{
        return false;
      }
      
    }else{
      if(pieceHorz == horz 
      && (vert == pieceVert + 1 && occupiedColor.equals("none"))){
        return true;
        
      }else if(vert == pieceVert + 1 && (pieceHorz == horz - 1 || pieceHorz == horz + 1)
      && occupiedColor.equals("white")){
        return true;
      }else{
        return false;
      }
    }
  }
  
  boolean whiteKnightMoveAllowed(int piece){
    int horzDiff = Math.abs(horz - pieces[0][piece].horz);
    int vertDiff = Math.abs(vert - pieces[0][piece].vert);
    if(horzDiff == 1 && vertDiff == 2){
      if(occupiedColor.equals("white")){
        return false;
      }else{
        return true;
      }
      
    }else if(horzDiff == 2 && vertDiff == 1){
      if(occupiedColor.equals("white")){
        return false;
      }else{
        return true;
      }
    }else{
      return false;
    }
  }
  boolean blackKnightMoveAllowed(int piece){
    int horzDiff = Math.abs(horz - pieces[1][piece].horz);
    int vertDiff = Math.abs(vert - pieces[1][piece].vert);
    if(horzDiff == 1 && vertDiff == 2){
      if(occupiedColor.equals("black")){
        return false;
      }else{
        return true;
      }
      
    }else if(horzDiff == 2 && vertDiff == 1){
      if(occupiedColor.equals("black")){
        return false;
      }else{
        return true;
      }
    }else{
      return false;
    }
}

boolean whiteRookMoveAllowed(int piece, Square[][] testSquares){
  initWhiteRookMovementChecks(piece,testSquares);
  int pieceVert = pieces[0][piece].vert;
  int pieceHorz = pieces[0][piece].horz;
  boolean allowed = false;
  if(pieceHorz == horz && pieceVert == vert){
      return false;
   }else if(pieceHorz == horz){
     for(int j = 0; j<allowedMovesDown.size();j++){
          if(allowedMovesDown.get(j) == vert){
            allowed = true;
          }
      }
      for(int j = 0; j<allowedMovesUp.size();j++){
          if(allowedMovesUp.get(j) == vert){
            allowed = true;
          }
      }
      return allowed;
   }else if(pieceVert == vert){
     for(int j = 0; j<allowedMovesRight.size();j++){
          if(allowedMovesRight.get(j) == horz){
            allowed = true;
          }
      }
      for(int j = 0; j<allowedMovesLeft.size();j++){
          if(allowedMovesLeft.get(j) == horz){
            allowed = true;
          }
        }
        return allowed;
   }else{
     return false;
   }
}

boolean blackRookMoveAllowed(int piece,Square[][] testSquares){
  //this next line is inefficient but ok for now
  initBlackRookMovementChecks(piece,testSquares);
  int pieceVert = pieces[1][piece].vert;
  int pieceHorz = pieces[1][piece].horz;
  boolean allowed = false;
  if(pieceHorz == horz && pieceVert == vert){
      return false;
   }else if(pieceHorz == horz){
     for(int j = 0; j<allowedMovesDown.size();j++){
          if(allowedMovesDown.get(j) == vert){
            allowed = true;
          }
      }
      for(int j = 0; j<allowedMovesUp.size();j++){
          if(allowedMovesUp.get(j) == vert){
            allowed = true;
          }
      }
      return allowed;
   }else if(pieceVert == vert){
     for(int j = 0; j<allowedMovesRight.size();j++){
          if(allowedMovesRight.get(j) == horz){
            allowed = true;
          }
      }
      for(int j = 0; j<allowedMovesLeft.size();j++){
          if(allowedMovesLeft.get(j) == horz){
            allowed = true;
          }
        }
        return allowed;
   }else{
     return false;
   }
}


boolean whiteBishopMoveAllowed(int piece,Square[][] testSquares){  
    initWhiteBishopMovement(piece,testSquares);
    for(int i = 0; i<allowedMovesUpAndRight.size(); i++){
      if(allowedMovesUpAndRight.get(i)[0] == horz
      && allowedMovesUpAndRight.get(i)[1] == vert){
        return true;
      }
    }
    for(int i = 0; i<allowedMovesDownAndRight.size(); i++){
      if(allowedMovesDownAndRight.get(i)[0] == horz
      && allowedMovesDownAndRight.get(i)[1] == vert){
        return true;
      }
    }
    for(int i = 0; i<allowedMovesLeftAndUp.size(); i++){
      if(allowedMovesLeftAndUp.get(i)[0] == horz
      && allowedMovesLeftAndUp.get(i)[1] == vert){
        return true;
      }
    }
    for(int i = 0; i< allowedMovesLeftAndDown.size(); i++){
      if(allowedMovesLeftAndDown.get(i)[0] == horz
      && allowedMovesLeftAndDown.get(i)[1] == vert){
        return true;
      }
    }
    return false;
}

boolean blackBishopMoveAllowed(int piece, Square[][] testSquares){  
    initBlackBishopMovement(piece,testSquares);
    for(int i = 0; i<allowedMovesUpAndRight.size(); i++){
      if(allowedMovesUpAndRight.get(i)[0] == horz
      && allowedMovesUpAndRight.get(i)[1] == vert){
        return true;
      }
    }
    for(int i = 0; i<allowedMovesDownAndRight.size(); i++){
      if(allowedMovesDownAndRight.get(i)[0] == horz
      && allowedMovesDownAndRight.get(i)[1] == vert){
        return true;
      }
    }
    for(int i = 0; i<allowedMovesLeftAndUp.size(); i++){
      if(allowedMovesLeftAndUp.get(i)[0] == horz
      && allowedMovesLeftAndUp.get(i)[1] == vert){
        return true;
      }
    }
    for(int i = 0; i< allowedMovesLeftAndDown.size(); i++){
      if(allowedMovesLeftAndDown.get(i)[0] == horz
      && allowedMovesLeftAndDown.get(i)[1] == vert){
        return true;
      }
    }
    return false;
}


//first int acts as a boolean(0 or 1), the second ranging from -1 to 3 show whether not to castle
  //change to int[] function
  //make seperate functions for moving black and white king
  
  
 int[] moveAllowedBlackKing(int piece, Square[][] testSquares){
    int vertDiff = Math.abs( (pieces[1][piece].vert) - vert);
    int horzDiff = Math.abs( (pieces[1][piece].horz) - horz);
    int[] tempArr = new int[2];
    
    if(vert == 0 && horz == 2){
        if((pieces[1][12].pieceHasNotMoved && pieces[1][8].pieceHasNotMoved
        && testSquares[2][0].occupiedColor.equals("none") && testSquares[3][0].occupiedColor.equals("none")
        && testSquares[1][0].occupiedColor.equals("none") && blackKingInCheck() == false)){
          tempArr[0]  = 1;
          tempArr[1]  = 2;
          return tempArr;
        }
      }else if(vert == 0 && horz == 6){
         if((pieces[1][12].pieceHasNotMoved && pieces[1][15].pieceHasNotMoved
        && testSquares[6][0].occupiedColor.equals("none") && testSquares[5][0].occupiedColor.equals("none")
         && blackKingInCheck() == false)){
          tempArr[0]  = 1;
          tempArr[1]  = 3;
          return tempArr;
      }  
     }
       if(occupiedColor.equals("black")){
      tempArr[0]  = 0;
      tempArr[1]  = -1;
      return tempArr;
    }else{
      
      if(vertDiff == 1 && horzDiff == 0){
        tempArr[0]  = 1;
        tempArr[1]  = -1;
        return tempArr;
      }else if(vertDiff == 0 && horzDiff == 1){
        tempArr[0]  = 1;
        tempArr[1]  = -1;
        return tempArr;
      }else if(vertDiff == 1 && horzDiff == 1){
        tempArr[0]  = 1;
        tempArr[1]  = -1;
        return tempArr;
      }else{
        tempArr[0]  = 0;
        tempArr[1]  = -1;
        return tempArr;
      }
     }
  }
  
  int[] moveAllowedWhiteKing(int piece, Square[][] testSquares){
    int vertDiff = Math.abs( (pieces[0][piece].vert) - vert);
    int horzDiff = Math.abs( (pieces[0][piece].horz) - horz);
    int[] tempArr = new int[2];
    
    
   
    if(vert == 7 && horz == 2){
        if((pieces[0][12].pieceHasNotMoved && pieces[0][8].pieceHasNotMoved
        && testSquares[2][7].occupiedColor.equals("none") && testSquares[3][7].occupiedColor.equals("none")
        && testSquares[1][7].occupiedColor.equals("none") && whiteKingInCheck() == false)){
          tempArr[0]  = 1;
          tempArr[1]  = 0;
          return tempArr;
        }
      }else if(vert == 7 && horz == 6){
         if((pieces[0][12].pieceHasNotMoved && pieces[0][15].pieceHasNotMoved
        && testSquares[6][7].occupiedColor.equals("none") && testSquares[5][7].occupiedColor.equals("none")
        && whiteKingInCheck() == false)){
          tempArr[0]  = 1;
          tempArr[1]  = 1;
          return tempArr;
      }  
     }
       if(occupiedColor.equals("white")){
      tempArr[0]  = 0;
      tempArr[1]  = -1;
      return tempArr;
    }else{
      
      if(vertDiff == 1 && horzDiff == 0){
        tempArr[0]  = 1;
        tempArr[1]  = -1;
        return tempArr;
      }else if(vertDiff == 0 && horzDiff == 1){
        tempArr[0]  = 1;
        tempArr[1]  = -1;
        return tempArr;
      }else if(vertDiff == 1 && horzDiff == 1){
        tempArr[0]  = 1;
        tempArr[1]  = -1;
        return tempArr;
      }else{
        tempArr[0]  = 0;
        tempArr[1]  = -1;
        return tempArr;
      }
     }
  }
  
 
  

boolean considerChecks(boolean checkForChecks, int colorIndex, 
int emptySquaresHorz, int emptySquaresVert, int movingPiece,
int occupiedSquareHorz, int occupiedSquareVert, 
int castle){
  if(checkForChecks == false){
    return true;
  }else{
    if(colorIndex == 1){
      if(blackKingWillBeInCheck(emptySquaresHorz,emptySquaresVert,movingPiece,occupiedSquareHorz,
      occupiedSquareVert,castle) == false){
        return true;
      }else{
        return false;
      }
    }else if(colorIndex == 0){
      if(whiteKingWillBeInCheck(emptySquaresHorz,emptySquaresVert,movingPiece,occupiedSquareHorz,
      occupiedSquareVert,castle) == false){
        return true;
      }else{
        return false;
      }
    }
  }
  return false;
}

void reset(int occupiedPiece, String occupiedColor){
  this.occupiedPiece = occupiedPiece;
  this.occupiedColor = occupiedColor;
}

}
