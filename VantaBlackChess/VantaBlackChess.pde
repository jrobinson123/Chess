
//code written by Jonah Robinson in 2020
import processing.sound.*;

PImage[] images;
Square[][] squares;
Piece[][] pieces;
int turn;
int pieceSelected;

SoundFile click;
SoundFile switchSound;
SoundFile sword;
SoundFile takeSound;

PFont roboto;
PFont helvetica;

int materialColor;
String materialMessage;
String restartStr;


int turnMessageColor;
String turnMessage;


ArrayList<Integer> allowedMovesUp;
ArrayList<Integer> allowedMovesDown;
ArrayList<Integer> allowedMovesLeft;
ArrayList<Integer> allowedMovesRight;


ArrayList<Integer[]> allowedMovesUpAndRight;
ArrayList<Integer[]> allowedMovesDownAndRight;
ArrayList<Integer[]> allowedMovesLeftAndUp;
ArrayList<Integer[]> allowedMovesLeftAndDown;

String message;



void setup(){
  size(1100,800);
  rectMode(CORNER);
  imageMode(CENTER);
  noStroke();
  textSize(20);
  message = "";
  materialColor = 0;
  materialMessage = "";
  restartStr = "declare draw";
  turn = 0;
  pieceSelected = -1;
  turnMessageColor = 255;
  turnMessage = "white's turn";
  roboto = createFont("Roboto-Thin.ttf", 30);
  helvetica = createFont("helvetica-bold",30);
  loadImages();
  click = new SoundFile(this,"chessClick.wav");
  switchSound = new SoundFile(this,"switchSound.wav");
  sword = new SoundFile(this,"sword.mp3");
  sword.amp(0.4);
  takeSound = new SoundFile(this,"takeSound.wav");
  takeSound.amp(0.6);
  
  pieces = new Piece[2][16];
  
  squares = new Square[8][8];
  for(int h = 0; h < 8; h++){
    for(int v = 0; v < 8; v++){
      squares[h][v] = new Square(100 * h, 100 * v, h, v, decideSquareColor(h,v),
      decideOccupiedPiece(h,v), decideOccupiedColor(v));
    }
  }
  
  for(int i = 0; i<8; i++){
    pieces[0][i] = new Piece(i * 100 + 50, 650, i, 6, "white", "pawn",i);
  }
  pieces[0][8] = new Piece(50,750,0,7,"white", "rook",8);
  pieces[0][9] = new Piece(150,750,1,7,"white", "knight",9);
  pieces[0][10] = new Piece(250,750,2,7,"white", "bishop",10);
  pieces[0][11] = new Piece(350,750,3,7,"white", "queen",11);
  pieces[0][12] = new Piece(450,750,4,7,"white", "king",12);
  pieces[0][13] = new Piece(550,750,5,7,"white", "bishop",13);
  pieces[0][14] = new Piece(650,750,6,7,"white", "knight",14);
  pieces[0][15] = new Piece(750,750,7,7,"white", "rook",15);
  
  for(int i = 0; i<8; i++){
    pieces[1][i] = new Piece(i * 100 + 50, 150, i, 1, "black", "pawn",i);
  }
  pieces[1][8] = new Piece(50,50,0,0,"black", "rook",8);
  pieces[1][9] = new Piece(150,50,1,0,"black", "knight",9);
  pieces[1][10] = new Piece(250,50,2,0,"black", "bishop",10);
  pieces[1][11] = new Piece(350,50,3,0,"black", "queen",11);
  pieces[1][12] = new Piece(450,50,4,0,"black", "king",12);
  pieces[1][13] = new Piece(550,50,5,0,"black", "bishop",13);
  pieces[1][14] = new Piece(650,50,6,0,"black", "knight",14);
  pieces[1][15] = new Piece(750,50,7,0,"black", "rook",15);
  
  allowedMovesLeft = new ArrayList<Integer>();
  allowedMovesDown = new ArrayList<Integer>();
  allowedMovesUp = new ArrayList<Integer>();
  allowedMovesRight = new ArrayList<Integer>();
  
  allowedMovesUpAndRight = new ArrayList<Integer[]>();
  allowedMovesDownAndRight = new ArrayList<Integer[]>();
  allowedMovesLeftAndUp = new ArrayList<Integer[]>();
  allowedMovesLeftAndDown = new ArrayList<Integer[]>();

}


void draw(){
  background(200);
  for(int h = 0; h < 8; h++){
    for(int v = 0; v < 8; v++){
      squares[h][v].display();
    }
   }
   for(int i = 0; i<16; i++){
     pieces[0][i].display();
     pieces[1][i].display();
   }
   displayPanel();
   
}



void mousePressed(){
  for(int h = 0; h < 8; h++){
    for(int v = 0; v < 8; v++){
      squares[h][v].checkForClick();
    }
    checkForCheckMate();
   }
   if(mouseHover(825,600,250,100)){
     restartGame();
   }
}
