  Block[][] world = new Block[64][1000];
  int scale = 100;
  int startingLevel = 30;
  
 void worldGenerate(){
   for (int add = 0; add < 4; add++){
     for (int col = 0; col < world[0].length; col++){
      world[startingLevel + add][col] = new Block(col * scale, (startingLevel + add) * scale, scale); 
     }
   }
 }
 void worldRevise(){
 } 
