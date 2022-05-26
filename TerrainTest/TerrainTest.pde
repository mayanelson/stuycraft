import java.util.*;

Block[][] world;
int sidelength = 10;
int worldHeight = 5000;
int worldWidth = 10000;
int startingLevel = 50;

Player avatar;

void setup(){
  noStroke();
  background(255);
  size(3000, 2000);

  world = new Block[500][1000];
  for (int i = startingLevel + 4; i < world.length; i++){
    for (int j = 0; j < world[i].length; j++){
      float x = j * 10;
      float y = i * 10;
      float decimal = noise(40* x/3000,40* y/2000, 0);
      if (decimal > 0.40){
        world[i][j] = new Block(x, y, decimal, sidelength);
      }
    }
  }
    for (int j = 0; j < world[0].length; j++){
      float x = j * sidelength;
      float decimal = noise(20 * x/width,20 * 0, 0);
      for (int i = startingLevel; i < startingLevel + 4; i++){
        float y = i * sidelength;
        if (decimal > 0.40){
          world[i][j] = new Block(x, y, color(50, 200, 50), sidelength);
        }
        else{ world[i][j] = new Block(x, y, color(200, 200 ,0), sidelength);}
      }
      float nextDeci = noise(20 * x/width,20 * 0, 0);
      int level = (int) (nextDeci/0.1);
      for (int i = 0; i < level; i++){
        float y = (startingLevel - i) * sidelength;
        if (decimal > 0.40){
          world[startingLevel - i][j] = new Block(x, y, color(50, 200, 50), sidelength);
        }
        else{ world[startingLevel - i][j] = new Block(x, y, color(200, 200 ,0), sidelength);}
      }
    }
    worldRevise();
    worldRevise();
    avatar = new Player(width/2, 10);
  }

void draw(){
  background(255);
  noStroke();
  pushMatrix();
  translate(-1  * avatar.moveX, -1 * avatar.moveY);
  for (Block[] row : world){
    for (Block bit : row){
      if (bit != null){
        bit.display();
      }
    }
  }
  popMatrix();
  avatar.display();
  avatar.gravity();
}
void worldRevise(){
  for (int i = 1; i < world[0].length - 1; i++){
   if ( world[startingLevel][i-1].thing == world[startingLevel][i + 1].thing){
    for (int j = 0; j < 4; j++){
     world[j + startingLevel][i].thing = world[j + startingLevel][i-1].thing;
    }
       int counter = 1;
    while(world[startingLevel - counter][i] != null){
      world[startingLevel - counter][i].thing = world[startingLevel][i].thing;
      counter ++;
    }
   }
  }
  for (int row = startingLevel + 5; row < world.length - 1; row++){
    for (int col = 1; col < world[row].length - 1; col++){
      if (world[row][col] != null){
        int surround = surroundCheck(row, col, world);
        if (surround < 2){world[row][col] = null;}
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

void keyPressed(){
 switch (key){
   case ('d'):
     avatar.moveX += avatar.xVel;
     break;
   case ('a'):
     avatar.moveX -= avatar.xVel;
     break;
   case ('w'):
     avatar.yVel -= 10;
     break;
 }
}
