



//checks whether at least one white piece can legally move
boolean someWhitePieceCanMove(){
  for(int i = 0; i<16; i++){
    if(pieces[0][i].alive){
      for(int x = 0; x<8; x++){
        for(int y = 0; y<8; y++){
          int[] tempArr = squares[x][y].moveAllowed(0,i, squares,true);
          if(tempArr[0] == 1){
            return true;
          }
        }
      }
    }
    
  }
  return false;
}

//checks whether at least one black piece can legally move
boolean someBlackPieceCanMove(){
  for(int i = 0; i<16; i++){
    if(pieces[1][i].alive){
      for(int x = 0; x<8; x++){
        for(int y = 0; y<8; y++){
          int[] tempArr = squares[x][y].moveAllowed(1,i, squares,true);
          if(tempArr[0] == 1){
            return true;
          }
        }
      }
    }
    
  }
  return false;
}
