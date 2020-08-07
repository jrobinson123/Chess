

//displays information to the right of the chessboard
void displayPanel(){
  fill(0);
  textAlign(LEFT,CENTER);
  textSize(30);
  textFont(roboto);
  text(message,825,100,250,300);
  fill(150);
  rect(800,50,300,100);
  fill(materialColor);
  textAlign(LEFT,CENTER);
  textSize(50);
  textFont(roboto);
   
  text(materialMessage,825,100);
  textSize(30);
  fill(turnMessageColor);
  text(turnMessage,900,100);
  if(mouseHover(825,600,250,100)){
    stroke(255,0,0);
    strokeWeight(4);
  }else{
    noStroke();
  }
  fill(0);
  rect(825,600,250,100,20);
  fill(255);
  textSize(20);
  textFont(roboto);
  text(restartStr,860,650);
  textFont(helvetica);
  fill(0);
  textAlign(CENTER,CENTER);
  text("VantaBlack Chess",950,500);
  textFont(roboto);
  textSize(20);
  text("by Jonah Robinson",950,550);
}
