class Tree{
 int howTall;
 
 Tree(int tallness, int xIndex){
  howTall = tallness;
  int yIndex = startingLevel;
  while (world[yIndex - 1][xIndex] != null){
    yIndex--;
  }
  yIndex--;
  for (int i = 0; i < howTall; i++){
    world[yIndex - i][xIndex] = new Wood(xIndex * scale, (yIndex - i) * scale, scale);
  }
  int leafLine = howTall/2;
  /*for (int i = leafLine; i < howTall + 3; i++){
    for (int j = xIndex - 3; j < xIndex + 4; j++){
      if ((j != xIndex || i >= howTall) && (j >= 0 && j < world[0].length)){
        world[yIndex - i][j] = new Leaf (j * scale, (yIndex - i) * scale, scale);
      }
    }
  }
  */
  int i = leafLine;
    for (int j = xIndex-3; j < xIndex+4; j++){
      if ((j != xIndex || i >= howTall) && (j >= 0 && j < world[0].length)){
        world[yIndex - i][j] = new Leaf (j * scale, (yIndex - i) * scale, scale);
      }
      if ((j != xIndex || i+1 >= howTall) && (j >= 0 && j < world[0].length)){
        world[yIndex - (i+1)][j] = new Leaf (j * scale, (yIndex - (i+1)) * scale, scale);
      }
      if ((j != xIndex || i+2 >= howTall) && (j >= 0 && j < world[0].length)){
        world[yIndex - (i+2)][j] = new Leaf (j * scale, (yIndex - (i+2)) * scale, scale);
      }
    }
      
    i+=3;
    for (int j = xIndex-2; j < xIndex+3; j++){
      if ((j != xIndex || i >= howTall) && (j >= 0 && j < world[0].length)){
        world[yIndex - i][j] = new Leaf (j * scale, (yIndex - i) * scale, scale);
      }
      if ((j != xIndex || i+1 >= howTall) && (j >= 0 && j < world[0].length)){
        world[yIndex - (i+1)][j] = new Leaf (j * scale, (yIndex - (i+1)) * scale, scale);
      }
    }
    
 }
}
