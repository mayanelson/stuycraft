  Block[][] world = new Block[250][750];
  int scale = 100;
  int startingLevel = 100;
  int worldHeight = world.length * scale;
  int worldWidth = world[0].length * scale;
  ArrayList<Biome> mappish= new ArrayList<Biome>();
  
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
     float x = col * 10;
     float y = row * 10;
     float noiseNum = noise(40* x/3000,40* y/2000, 0);
     if (noiseNum > 0.4){world[row][col] = new Stone(xcor, ycor, scale);}
    }
   }
   
   // Creating Surface w/o biomes
   for (int col = 0; col < world[0].length; col++){
     int xcor =  col * 10;
     double fractX = (double)xcor * 10 / (world[0].length * 10);
     double noiseNum = Math.abs(noise(fractX, 0, 0));
     for(int up = 1; up < (int)(noiseNum * 25) && up < startingLevel; up++){
       world[startingLevel - up][col] = new Block(xcor, (startingLevel - up) * scale, scale);
     }
   }
   //Creating Biomes
   int counter = 0;
   while (counter < world[0].length){
    int blockCount = (int)(Math.random() * 16) + 10;
    if (blockCount > world[0].length - counter){blockCount = world[0].length - counter;}
    int choice = (int)(Math.random() * 100);
     if (choice % 10 > 5){
        mappish.add(new Desert(counter * scale, (counter + blockCount) * scale, 0, (startingLevel + 3) * scale));
     }
     else{
       mappish.add(new Plains(counter * scale, (counter + blockCount) * scale, 0, (startingLevel + 3) * scale));
     }
    for (int i = 0; i < blockCount; i++){
      int xcor = (counter + i) * scale;
      int ycor = (startingLevel + 3) * scale;
      while (world[ycor/scale][xcor/scale] != null){
         if (choice % 10 > 5){world[ycor/scale][xcor/scale] = new Sand(xcor, ycor, scale);}
         else{world[ycor/scale][xcor/scale] = new Grass(xcor, ycor, scale);}
         ycor -= scale;
         //System.out.println(ycor);
      }
    }
    counter += blockCount;
   }
   mappish.add(new Cave(0, world[0].length * scale, (startingLevel + 4) * scale, world.length * scale));
 }
 void worldRevise(){
 } 
