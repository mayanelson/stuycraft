class Creeper extends Mob{

  int explodeTick;
  int randTick;
  boolean explode;
  PImage image2;
  PImage explosion;
  
  Creeper(int x, int y){
    super(x,y);
    type = "Creeper";
    image = loadImage("Creeper.png");
    image2 = loadImage("Creeper0.png");
    explosion = loadImage("Explosion.png");
    image.resize((int)(scale*0.9),(int)(scale*1.8));
    image2.resize((int)(scale*0.9),(int)(scale*1.8));
    explosion.resize(750,750);
    mwidth = scale*0.9;
    mheight = 1.8*scale;
    explodeTick = 0;
    randTick = ((int)random(2)+2) * 60;
  }
  
  void die(){
    crcount--;
    mobs.remove(this);
  }
  
  void attack(){
    if (explodeTick > randTick + 25){
      die();
      for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++){
        if (i != 3 || j != 3){
          if ((int)ycor/scale + i < 250 && xcor/scale +j < 500){
          world[(int)ycor/scale + i][xcor/scale +j] = null;
          }
          if ((int)ycor/scale - i >= 0 && xcor/scale -j >= 0){
          world[(int)ycor/scale - i][xcor/scale -j] = null;
          }
          if ((int)ycor/scale + i < 250 && xcor/scale -j >= 0){
          world[(int)ycor/scale + i][xcor/scale -j] = null;
          }
          if ((int)ycor/scale + i >= 0 && xcor/scale +j < 500){
          world[(int)ycor/scale - i][xcor/scale +j] = null;
          }
        }
      }
    }
    int rand2 = (int)random(2)+4;
    player.health -= rand2;
    if (player.health <= 0){      
      player.die(); 
    }
    }
    }
  
  void move(int inherit){
     if ((int)ycor/scale + 1 < world.length - 1 && (int)ycor/scale + 1 > 1 && xcor/scale < world[0].length - 1 && xcor/scale > 1){
       int nextX;
       if (Math.abs(player.xcor - xcor)/scale*10 < 100){
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
        if (Math.abs(player.xcor - xcor)/scale*10 < 20 && Math.abs(player.ycor - ycor)/scale*10 < 20){
            explode = true;
            if (explodeTick > randTick) {
              attack();
            }
    }
    else {
      explode = false;
    }
     }
  }
  void jump(){
    if( yVel == 0){
      yVel -= 100;
      ycor += yVel;
      if (world[(int)(ycor)/scale][xcor/scale] != null || world[(int)(ycor)/scale][(int)(xcor + mwidth)/scale] != null){
        yVel = 0; 
        ycor = (int)(ycor)/scale * scale + scale + 1;
      }
    }
  }
  void display(){
    if(explode){
      explodeTick++;
    }
    if (explode && explodeTick > randTick){
      image(explosion,xcor-375,ycor-375);
    }
    else if (explode && explodeTick%30 > 5 && explodeTick%30 < 15){
       if (direct){
      image(image2,xcor,ycor);
    }
    else {
      pushMatrix();
      scale(-1,1);
      image(image2,-xcor-mwidth,ycor);
      popMatrix();
    }
    }
    else {
    if (direct){
      image(image,xcor,ycor);
    }
    else {
      pushMatrix();
      scale(-1,1);
      image(image,-xcor-mwidth,ycor);
      popMatrix();
    }
    }
    for (int  i = 0; i < health; i++){
      image(healthBar,xcor + (i*scale)/5 - (scale/2),ycor-(scale/4));
    }
  }
  
}
