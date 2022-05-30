class Tree{
 int howTall;
 
 Tree(int tallness, int xIndex){
  howTall = tallness;
  int yIndex = startingLevel;
  while (world[yIndex - 1][xIndex] != null){
    yIndex--;
  }
  for (int i = 0; i < howTall; i++){
    world[yIndex - i][xIndex] = new Wood(xIndex * scale, (yIndex - i) * scale, scale);
  }
  int leafLine = howTall/2;
  for (int i = leafLine; i < howTall + 3; i++){
    for (int j = xIndex - 3; j < xIndex + 4; j++){
      if ((j != xIndex || i >= howTall) && (j >= 0 && j < world[0].length)){
        world[yIndex - i][j] = new Leaf (j * scale, (yIndex - i) * scale, scale);
      }
    }
  }
 }
}
