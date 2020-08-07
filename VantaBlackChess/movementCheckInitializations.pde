
//prepares for a check of black rook movement
void initBlackRookMovementChecks(int piece, Square[][] testSquares){
    int vertPoint = pieces[1][piece].vert;
    int horzPoint = pieces[1][piece].horz;
    
    allowedMovesUp.clear();
    allowedMovesDown.clear();
    allowedMovesLeft.clear();
    allowedMovesRight.clear();
    boolean breakOut;
    
    
    if(vertPoint == 0){
      breakOut = true;
    }else{
      breakOut = false;
    }
    int i = vertPoint - 1;
    
    while(i >= 0 && breakOut == false){
      if(testSquares[horzPoint][i].occupiedColor.equals("none")){
        allowedMovesUp.add(i);
        i--;
        if(i == -1){
          breakOut = true;
        }
      }else if(testSquares[horzPoint][i].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[horzPoint][i].occupiedColor.equals("white")){
        allowedMovesUp.add(i);
        breakOut = true;
      }
    }
    
    
    if(vertPoint == 7){
      breakOut = true;
    }else{
      breakOut = false;
    }
    i = vertPoint + 1;
    
    while(i <= 7 && breakOut == false){
      if(testSquares[horzPoint][i].occupiedColor.equals("none")){
        allowedMovesDown.add(i);
        i++;
        if(i == 8){
          breakOut = true;
        }
      }else if(testSquares[horzPoint][i].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[horzPoint][i].occupiedColor.equals("white")){
        allowedMovesDown.add(i);
        breakOut = true;
      }
    }
    
    
    if(horzPoint == 0){
      breakOut = true;
    }else{
      breakOut = false;
    }
    
    i = horzPoint - 1;
    
    while(i >= 0  && breakOut == false){
      if(testSquares[i][vertPoint].occupiedColor.equals("none")){
        allowedMovesLeft.add(i);
        i--;
        if(horzPoint == -1){
          breakOut = false;
        }
      }else if(testSquares[i][vertPoint].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[i][vertPoint].occupiedColor.equals("white")){
        allowedMovesLeft.add(i);
        breakOut = true;
      }
    }
    
    if(horzPoint == 7){
      breakOut = true;
    }else{
      breakOut = false;
    }
    i = horzPoint + 1;
    
    while(i <= 7  && breakOut == false){
      if(testSquares[i][vertPoint].occupiedColor.equals("none")){
        allowedMovesRight.add(i);
        //problem area
        i++;
        if(horzPoint == 8){
          breakOut = true;
        }
      }else if(testSquares[i][vertPoint].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[i][vertPoint].occupiedColor.equals("white")){
        allowedMovesRight.add(i);
       
        breakOut = true;
      }
    }
  }
  
//prepares for a check of white rook movement
 void initWhiteRookMovementChecks(int piece, Square[][] testSquares){
    int vertPoint = pieces[0][piece].vert;
    int horzPoint = pieces[0][piece].horz;
    
    allowedMovesUp.clear();
    allowedMovesDown.clear();
    allowedMovesLeft.clear();
    allowedMovesRight.clear();
    boolean breakOut;
    
    
    if(vertPoint == 0){
      breakOut = true;
    }else{
      breakOut = false;
    }
    int i = vertPoint - 1;
    
    while(i >= 0 && breakOut == false){
      if(testSquares[horzPoint][i].occupiedColor.equals("none")){
        allowedMovesUp.add(i);
        i--;
        if(i == -1){
          breakOut = true;
        }
      }else if(testSquares[horzPoint][i].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[horzPoint][i].occupiedColor.equals("black")){
        allowedMovesUp.add(i);
        breakOut = true;
      }
    }
    
    
    if(vertPoint == 7){
      breakOut = true;
    }else{
      breakOut = false;
    }
    i = vertPoint + 1;
    
    while(i <= 7 && breakOut == false){
      if(testSquares[horzPoint][i].occupiedColor.equals("none")){
        allowedMovesDown.add(i);
        i++;
        if(i == 8){
          breakOut = true;
        }
      }else if(testSquares[horzPoint][i].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[horzPoint][i].occupiedColor.equals("black")){
        allowedMovesDown.add(i);
        breakOut = true;
      }
    }
    
    
    if(horzPoint == 0){
      breakOut = true;
    }else{
      breakOut = false;
    }
    
    i = horzPoint - 1;
    
    while(i >= 0  && breakOut == false){
      if(testSquares[i][vertPoint].occupiedColor.equals("none")){
        allowedMovesLeft.add(i);
        i--;
        if(horzPoint == -1){
          breakOut = false;
        }
      }else if(testSquares[i][vertPoint].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[i][vertPoint].occupiedColor.equals("black")){
        allowedMovesLeft.add(i);
        breakOut = true;
      }
    } 
    if(horzPoint == 7){
      breakOut = true;
    }else{
      breakOut = false;
    }
    i = horzPoint + 1;
    
    while(i <= 7  && breakOut == false){
      if(testSquares[i][vertPoint].occupiedColor.equals("none")){
        allowedMovesRight.add(i);
        i++;
        if(horzPoint == 8){
          breakOut = true;
        }
      }else if(testSquares[i][vertPoint].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[i][vertPoint].occupiedColor.equals("black")){
        allowedMovesRight.add(i);
        breakOut = true;
      }
    }
 }
 
 //prepares for a check of black bishop movement
 void initBlackBishopMovement(int piece, Square[][] testSquares){
    allowedMovesUpAndRight.clear();
    allowedMovesDownAndRight.clear();
    allowedMovesLeftAndUp.clear();
    allowedMovesLeftAndDown.clear();
    
    int vertPoint = pieces[1][piece].vert;
    int horzPoint = pieces[1][piece].horz;
    int v = vertPoint - 1 ;
    int h = horzPoint + 1;
    boolean breakOut = false;
    while(v >= 0 && h <= 7 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesUpAndRight.add(tempArr);
        v--;
        h++;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        Integer[] tempArr = {h,v};
        allowedMovesUpAndRight.add(tempArr);
        breakOut = true;
      }
    }
    
    v = vertPoint - 1 ;
    h = horzPoint - 1;
    breakOut = false;
    while(v >= 0 && h >= 0 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndUp.add(tempArr);
        v--;
        h--;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndUp.add(tempArr);
        breakOut = true;
      }
    }
    v = vertPoint + 1 ;
    h = horzPoint - 1;
    breakOut = false;
    while(v <= 7 && h >= 0 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndDown.add(tempArr);
        v++;
        h--;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndDown.add(tempArr);
        breakOut = true;
      }
    }
    v = vertPoint + 1 ;
    h = horzPoint + 1;
    breakOut = false;
    while(v <= 7 && h <= 7 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesDownAndRight.add(tempArr);
        v++;
        h++;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        Integer[] tempArr = {h,v};
        allowedMovesDownAndRight.add(tempArr);
        breakOut = true;
      }
    }
  }
  
 //prepares for a check of white bishop movement
  void initWhiteBishopMovement(int piece, Square[][] testSquares){
    allowedMovesUpAndRight.clear();
    allowedMovesDownAndRight.clear();
    allowedMovesLeftAndUp.clear();
    allowedMovesLeftAndDown.clear();
    
    int vertPoint = pieces[0][piece].vert;
    int horzPoint = pieces[0][piece].horz;
    int v = vertPoint - 1 ;
    int h = horzPoint + 1;
    boolean breakOut = false;
    while(v >= 0 && h <= 7 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesUpAndRight.add(tempArr);
        v--;
        h++;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        Integer[] tempArr = {h,v};
        allowedMovesUpAndRight.add(tempArr);
        breakOut = true;
      }
    }
    
    v = vertPoint - 1 ;
    h = horzPoint - 1;
    breakOut = false;
    while(v >= 0 && h >= 0 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndUp.add(tempArr);
        v--;
        h--;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndUp.add(tempArr);
        breakOut = true;
      }
    }
    v = vertPoint + 1 ;
    h = horzPoint - 1;
    breakOut = false;
    while(v <= 7 && h >= 0 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndDown.add(tempArr);
        v++;
        h--;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        Integer[] tempArr = {h,v};
        allowedMovesLeftAndDown.add(tempArr);
        breakOut = true;
      }
    }
    v = vertPoint + 1 ;
    h = horzPoint + 1;
    breakOut = false;
    while(v <= 7 && h <= 7 && breakOut == false){
      if(testSquares[h][v].occupiedColor.equals("none")){
        Integer[] tempArr = {h,v};
        allowedMovesDownAndRight.add(tempArr);
        v++;
        h++;
      }else if(testSquares[h][v].occupiedColor.equals("white")){
        breakOut = true;
      }else if(testSquares[h][v].occupiedColor.equals("black")){
        Integer[] tempArr = {h,v};
        allowedMovesDownAndRight.add(tempArr);
        breakOut = true;
      }
    }
  }
  
 
 
 
 
 
