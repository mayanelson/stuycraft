  Block[][] world = new Block[200][1000];
  int scale = 10;
  int startingLevel = 15;
  int worldHeight = world.length * scale;
  int worldWidth = world[0].length * scale;
  
 void worldGenerate(){
   // Creating the base plane surface
   for (int add = 0; add < 4; add++){
     for (int col = 0; col < world[0].length; col++){
      world[startingLevel + add][col] = new Block(col * scale, (startingLevel + add) * scale, scale); 
     }
   }
   
   // Creating the underground
   for (int row = startingLevel + 4; row < world.length; row++){
    for (int col = 0; col < world[row].length; col++){
     int xcor =  col * scale;
     int ycor = row * scale;
     double fractX = (double)xcor * scale / worldWidth;
     double fractY = (double)ycor * scale /worldHeight;
     double noiseNum = Math.abs(noise(fractX, fractY, 0.0));
     System.out.println(noiseNum);
     if (noiseNum > 0.2 || noiseNum < 0.1){world[row][col] = new Block(xcor, ycor, scale);}
    }
   }
 }
 void worldRevise(){
 } 
