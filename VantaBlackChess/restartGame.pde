
//resets the entire game
void restartGame(){
  message = "";
  materialColor = 0;
  materialMessage = "";
  restartStr = "declare draw";
  turn = 0;
  turnMessageColor = 255;
  turnMessage = "white's turn";
  pieceSelected = -1;
  for(int h = 0; h < 8; h++){
    for(int v = 0; v < 8; v++){
      squares[h][v].reset(decideOccupiedPiece(h,v), decideOccupiedColor(v));
    }
  }
  
  for(int i = 0; i<8; i++){
    pieces[0][i].reset(i * 100 + 50, 650, i, 6,"pawn");
  }
  pieces[0][8].reset(50,750,0,7,"rook");
  pieces[0][9].reset(150,750,1,7,"knight");
  pieces[0][10].reset(250,750,2,7, "bishop");
  pieces[0][11].reset(350,750,3,7,"queen");
  pieces[0][12].reset(450,750,4,7,"king");
  pieces[0][13].reset(550,750,5,7,"bishop");
  pieces[0][14].reset(650,750,6,7,"knight");
  pieces[0][15].reset(750,750,7,7,"rook");
  
  for(int i = 0; i<8; i++){
    pieces[1][i].reset(i * 100 + 50, 150, i, 1, "pawn");
  }
  pieces[1][8].reset(50,50,0,0,"rook");
  pieces[1][9].reset(150,50,1,0,"knight");
  pieces[1][10].reset(250,50,2,0,"bishop");
  pieces[1][11].reset(350,50,3,0,"queen");
  pieces[1][12].reset(450,50,4,0,"king");
  pieces[1][13].reset(550,50,5,0,"bishop");
  pieces[1][14].reset(650,50,6,0,"knight");
  pieces[1][15].reset(750,50,7,0,"rook");
}
