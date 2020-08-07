

class Piece{
  int x,y;
  int horz,vert;
  String pieceColor;
  String type;
  PImage image;
  boolean alive;
  int index;
  int materialValue;
  boolean pieceHasNotMoved;
  Piece(int x, int y, int horz, int vert, String pieceColor, String type, int index){
    this.x = x;
    this.y = y;
    this.horz = horz;
    this.vert = vert;
    this.pieceColor = pieceColor;
    this.type = type;
    this.index = index;
    alive = true;
    pieceHasNotMoved = true;
    this.setImages();
    
  }
  void display(){
    if(alive){
      image(image,x,y);
    }
  }
  void move(int x, int y, int horz, int vert){
    this.x = x;
    this.y = y;
    this.horz = horz;
    this.vert = vert;
    pieceHasNotMoved = false;
    if(pieceColor.equals("black")){
      if(type.equals("pawn") && vert == 7){
        type = "queen";
        materialValue = 9;
        image = images[10];
      }
    }else{
      if(type.equals("pawn") && vert == 0){
        type = "queen";
        materialValue = 9;
        image = images[4];
      }
    }
  }
  void reset(int x, int y, int horz, int vert, String type){
    this.x = x;
    this.y = y;
    this.horz = horz;
    this.vert = vert;
    this.type = type;
    alive = true;
    pieceHasNotMoved = true;
    setImages();
    
  }
  void setImages(){
    if(pieceColor.equals("white")){
      if(type.equals("pawn")){
        image = images[0];
        materialValue = 1;
      }else if(type.equals("rook")){
        image = images[1];
        materialValue = 5;
      }else if(type.equals("knight")){
        image = images[2];
        materialValue = 3;
      }else if(type.equals("bishop")){
        image = images[3];
        materialValue = 3;
      }else if(type.equals("queen")){
        image = images[4];
        materialValue = 9;
      }else if(type.equals("king")){
        image = images[5];
        materialValue = 0;
      }
    }else if(pieceColor.equals("black")){
      if(type.equals("pawn")){
        image = images[6];
        materialValue = 1;
      }else if(type.equals("rook")){
        image = images[7];
        materialValue = 5;
      }else if(type.equals("knight")){
        image = images[8];
        materialValue = 3;
      }else if(type.equals("bishop")){
        image = images[9];
        materialValue = 3;
      }else if(type.equals("queen")){
        image = images[10];
        materialValue = 9;
      }else if(type.equals("king")){
        image = images[11];
        materialValue = 0;
      }
    }
  }
}
