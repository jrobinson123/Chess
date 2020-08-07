


//compares the material held by white and black
void decideMaterialBalance(){
  int whiteMaterial = 0;
  for(int i = 0; i<16; i++){
    if(pieces[0][i].alive){
      whiteMaterial += pieces[0][i].materialValue;
    }
  }
  int blackMaterial = 0;
  for(int i = 0; i<16; i++){
    if(pieces[1][i].alive){
      blackMaterial += pieces[1][i].materialValue;
    }
  }
  if(blackMaterial > whiteMaterial){
    int diff = blackMaterial - whiteMaterial;
    materialColor = 0;
    materialMessage = "+ " + diff;
  }else if(whiteMaterial > blackMaterial){
    int diff = whiteMaterial - blackMaterial;
    materialColor = 255;
    materialMessage = "+ " + diff;
  }else{
    materialMessage = "";
  }
}
