
//decides the color of a square based on its horizontal and vertical position
String decideSquareColor(int h, int v){
  if(h%2 == 0){
    if(v%2==0){
      return "white";
    }else{
      return "black";
    }
  }else{
    if(v%2==0){
      return "black";
    }else{
      return "white";
    }
  }
}

//decides the occupied color of a square based on its vertical position 
String decideOccupiedColor(int v){
  if(v == 0 || v == 1){
    return "black";
  }else if(v == 6 || v == 7){
    return "white";
  }else{
    return "none";
  }
}

int decideOccupiedPiece(int h, int v){
 if(v == 0 || v == 7){
    return h + 8;
  }else if(v == 1 || v == 6){
    return h;
  }else{
    return -1;
  }
}


void loadImages(){
  images = new PImage[12];
  images[0] = loadImage("white_pawn_resized.png");
  images[1] = loadImage("white_rook_resized.png");
  images[2] = loadImage("white_knight_resized.png");
  images[3] = loadImage("white_bishop_resized.png");
  images[4] = loadImage("white_queen_resized.png");
  images[5] = loadImage("white_king_resized.png");
  images[6] = loadImage("black_pawn_resized.png");
  images[7] = loadImage("black_rook_resized.png");
  images[8] = loadImage("black_knight_resized.png");
  images[9] = loadImage("black_bishop_resized.png");
  images[10] = loadImage("black_queen_resized.png");
  images[11] = loadImage("black_king_resized.png");
}
