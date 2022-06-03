  Block[][] world = new Block[250][500];
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

   
   int counter0 = 0;
   while (counter0 < world[0].length){
     //System.out.println("Start Counters: " + counter0);
    int size = (int)(Math.random() * 20) + 40;
      //System.out.println("\tSize Before: " + size);
    if (size > world[0].length - counter0){size = world[0].length - counter0;}
      //System.out.println("\tSize After: " + size);
    int choice = (int)(Math.random() * 100);
    for (int i = 0; i < size; i++){
      int xcor =  (counter0 + i) * scale;
      for (int j = startingLevel + 3; j < world.length; j++){
        //System.out.println(i + ", " + j);
        int ycor =  j* scale;
       // System.out.println("\t" + xcor + ", " + ycor);
       // System.out.println("\t\t" + j + ", " + (counter0 + i));
        if (choice %2 == 0){
             float x = (counter0 + i) * 10;
             float y = j * 10;
             float noiseNum = noise(40* x/3000,40* y/2000, 0);
             if (noiseNum > 0.45){world[j][counter0 + i] = new Stone(xcor, ycor, scale);}
        }
        else{
            double noiseNum = Math.abs(noise((double)xcor * 35 / worldWidth,(double) ycor * 35/ worldHeight, 0));
           // System.out.println(xcor + ", " + ycor);
            // System.out.println ("\t" + noiseNum);
             if (noiseNum > 0.15){world[j][counter0 + i] = new Stone(xcor, ycor, scale);}
             
        }
      }
    }
    counter0 += size;
    
   }
   
   //Adding random ores
   for (int i = startingLevel+5; i < world.length-10; i++){
     for (int j = 10; j < world[0].length-10; j++){
       int rand = (int) random(1000);
       int place = (int) random(5)+3;
       if (world[i][j]!= null){
       if (rand < 10){
         world[i][j] = new ironore(j*scale,i*scale,scale);
         for (int k = 0; k < place/2; k++){
           if (k%2 == 0 && world[i+k][j]!= null){   
             world[i+k][j] = new ironore((j)*scale,(i+k)*scale,scale);
           }
           else if (world[i][j+k]!= null){
             world[i][j+k] = new ironore((j+k)*scale,(i)*scale,scale);
           }
           if (world[i+k/2][j+k/2]!= null){
             world[i+k/2][j+k/2] = new ironore((j+k/2)*scale,(i+k/2)*scale,scale);
           }
         }
         }
         if (rand < 1 && i > 200){
           for (int k = 0; k < place/2; k++){
           if (k%2 == 0){   
             world[i+k][j] = new diaore((j+k)*scale,i*scale,scale);
           }
           else {
             world[i][j+k] = new diaore(j*scale,(i+k)*scale,scale);
           }
           world[i+k/2][j+k/2] = new diaore((j+k/2)*scale,(i+k/2)*scale,scale);
         }
         }
       }
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
 
 //Adding the trees
   for (Biome area: mappish){
    if (area.name.equals("Plains")){
      for (int i = area.leftX; i < area.rightX; i+= scale*2){
        double rando = Math.random();
        if (rando <= area.treeSpawn){
          int ranHeight = (int)(Math.random() * 3) + 4;
          Tree addition = new Tree(ranHeight, i/scale);
        }
      }
    }
   }
   worldRevise();
   worldRevise();
 }
 void worldRevise(){
  for (int row = startingLevel + 5; row < world.length - 1; row++){
    for (int col = 1; col < world[row].length - 1; col++){
      int surround = surroundCheck(row, col, world);
      if (world[row][col] != null){
        if (surround < 2){world[row][col] = null;}
      }
      else if (surround > 3){
        world[row][col] = new Stone(scale*col,scale*row,scale);
      }
    }
  }
}
int surroundCheck(int row, int col, Block[][] area){
 int[][] directions ={{0, -1}, {-1, 0}, { 0, 1}, {1, 0}};
 int counter = 0;
 for (int[] oneDir : directions){
   if (area[row + oneDir[1]][col + oneDir[0]] != null){
     counter ++;
   }
 }
 return counter;
}
