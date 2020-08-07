


//method that highlights squares that are possible to move to in red
void showPossibleMoves(){
  for(int i = 0; i<8; i++){
    for(int j = 0; j < 8; j++){
        int[] arr = squares[i][j].moveAllowed(turn,pieceSelected,squares,true);
        if(squares[i][j].squareColor.equals("white")){
          if(arr[0] == 1){
            squares[i][j].setColor(color(255, 191, 171));
          }else{
           squares[i][j].setColor(color(255, 234, 171));
          }
       }else{
         if(arr[0] == 1){
           squares[i][j].setColor(color(56, 26, 1));
         }else{
           squares[i][j].setColor(color(11, 56, 1));
         }
      }
     }
  }   
}

//method that resets all squares to their original color
void resetSquareColors(){
  for(int i = 0; i<8; i++){
     for(int j = 0; j < 8; j++){
       if(squares[i][j].squareColor.equals("white")){
         squares[i][j].setColor(color(255, 234, 171));
       }else{
         squares[i][j].setColor(color(11, 56, 1));
       }
       
     }
  }
}
