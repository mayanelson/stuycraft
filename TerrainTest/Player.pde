class Player{
  int spawnX, spawnY;
  int moveX, moveY;
  float xVel, yVel;
  float grav;
  
  
  Player(int x, int y){
    xVel = 5.0;
    yVel = 0.0;
    this.spawnX = x;
    this.spawnY = y;
    grav = 1.0;
    moveX = 0;
    moveY = 0;
  }
  
  void display(){
    noStroke();
    fill(100, 0, 100);
    rect(width/2, 10, 10, 20);
  }
  
  void gravity(){
    float y = spawnY + moveY;
    float x = spawnX + moveX;
   Block under = world[(int)(y)/ 10 + 2][(int)x / 10];
   System.out.println("In Blocks: x: " + ((int)x / 10) + " & y: " + ((int)(y + 20)/ 10));
   if (under == null || yVel < 0){
    moveY += yVel;
    yVel += grav;
   }
   else{
     yVel = 0;
   }
  }
}
