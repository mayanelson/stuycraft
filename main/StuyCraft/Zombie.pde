class Zombie extends Mob{
  
  Zombie(int x, int y){
    super(x,y);
    type = "Zombie";
    image = loadImage("Zombie0.png");
    image.resize((int)(scale*1),(int)(scale*2));
    mwidth = 0.75 * scale;
    mheight = 2*scale;
  }
  
  void die(){
    zcount--;
  }
  void attack(){
    int rand = (int)random(10);
    if (rand == 1){
    int rand2 = (int)random(3)+1;
    player.health -= rand2;
    if (player.health <= 0){
      player.die();
      
    }
    }
  }
  void move(int inherit){
     if (xcor/scale < world[0].length - 1 && xcor/scale > 1){
       int nextX;
        if (player.xcor - xcor < 0){
          direct = false;
          nextX = xcor - xVel;
         Block leftBottom = world[(int)(ycor/scale) + 1][nextX/scale];
         Block leftTop = world[(int)(ycor/scale)][nextX/scale];
         if (leftBottom != null || leftTop != null || nextX <= 1){
           if (leftBottom!= null && leftTop == null && world[(int)(ycor/scale)-1][nextX/scale] == null){
             jump();
             xcor -= xVel;
           }
          //xcor +=  1;
         }
         else {
           xcor -= xVel;
         }
        }
        else {
          direct = true;
          nextX = xcor + xVel;
         Block rightBottom = world[(int)(ycor/scale) + 1][(nextX + (int)(mwidth))/scale];
         Block rightTop = world[(int)(ycor/scale)][(nextX + (int)(mwidth))/scale];
         if (rightBottom != null || rightTop != null || (nextX + (int)(mwidth)) >= worldWidth - 1){
          //xcor -= 1;
          if (rightBottom != null && rightTop == null && world[(int)(ycor/scale)-1][(nextX + (int)(mwidth))/scale] == null) {
            jump();
            xcor += xVel;
          }
         }
         else {
           xcor += xVel;
         }
        }
        //xcor += xVel * direction;
        }
        if (Math.abs(player.xcor - xcor)/scale*10 < 10 && Math.abs(player.ycor - ycor)/scale*10 < 5){
          attack();
    }
  }
  void jump(){
    if( yVel == 0){
      yVel -= 15;
      ycor += yVel;
      if (world[(int)(ycor)/scale][xcor/scale] != null || world[(int)(ycor)/scale][(int)(xcor + mwidth)/scale] != null){
        yVel = 0; 
        ycor = (int)(ycor)/scale * scale + scale + 1;
      }
    }
  }
  void display(){
    if (direct){
      image(image,xcor,ycor);
    }
    else {
      pushMatrix();
      scale(-1,1);
      image(image,-xcor-mwidth,ycor);
      popMatrix();
    }
    for (int  i = 0; i < health; i++){
      image(healthBar,xcor + (i*scale)/5 - (scale/2),ycor-(scale/4));
    }
  }
  
}
