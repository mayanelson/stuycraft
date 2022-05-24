class Player{
  int spawnX, spawnY;
  int moveX, moveY;
  float xVel, yVel;
  float grav;
  
  
  Player(int x, int y){
    xVel = sidelength / 2;
    yVel = 0.0;
    this.spawnX = x;
    this.spawnY = y;
    grav = sidelength / 5;
    moveX = 0;
    moveY = 0;
  }
  
  void display(){
    noStroke();
    fill(100, 0, 100);
    rect(width/2, 10, sidelength, sidelength * 2);
  }
  
  void gravity(){
  float y = spawnY + moveY + sidelength * 2;
  float x = spawnX + moveX;
   Block under = world[(int)(y)/ sidelength][(int)x / sidelength];
   //System.out.println("In Blocks: x: " + ((int)x / 10) + " & y: " + ((int)(y + 20)/ 10));
   if (under == null || yVel < 0){
    moveY += yVel;
    yVel += grav;
   }
   else{
     yVel = 0;
     if (under.y > y){
        moveY = (int)(under.y - spawnY);
     }
   }
  }
}
