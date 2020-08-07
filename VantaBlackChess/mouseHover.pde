
//boolean that returns true if the mouse is over a rectangle at a specified x, y and x-size and y-size
boolean mouseHover(int x, int y, int xSize, int ySize){
  if(mouseX > x && 
  mouseX < x + xSize &&
  mouseY > y &&
  mouseY <  y + ySize){
    return true;
  }else{
    return false;
  }
}
