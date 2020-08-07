

//checks for a check or stale mate
void checkForCheckMate(){
  if(turn == 0){
          if(someWhitePieceCanMove() == false){
            if(whiteKingInCheck()){
              message = "check mate, black wins";
              restartStr = "restart";
            }else{
              message = "stale mate";
              restartStr = "restart";
            }
          }
        }else{
          if(someBlackPieceCanMove() == false){
            if(blackKingInCheck()){
              message = "check mate, white wins";
              restartStr = "restart";
            }else{
              message ="stale mate";
              restartStr = "restart";
            }
          }
        }
}
