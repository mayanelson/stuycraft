class Mob{
  int health;
  Item drop;
  PImage image;
  int xcor;
  float ycor;
  float mwidth;
  float mheight;
  int xVel;
  int yVel;
  String type;
  PImage healthBar;
  int motion;
  boolean direct;
  
  Mob(int x, int y){
    direct = true;
    motion = 0;
    health = 10;
    xcor = x;
    ycor = y;
    xVel = scale / 5;
    yVel = 0;
    healthBar = loadImage("heart.png");
    healthBar.resize(scale/4,scale/4);
  }
  
  void takeDamage(int amt){
    health -= amt;
    if (health <= 0){
      die();
    }
  }
  
  void move(int direction){
     if ( xcor/scale < world[0].length - 2 && xcor/scale > 1){
      //xcor += xVel * direction;
    if (direction < 0){
      direct = false;
     Block leftBottom = world[(int)(ycor/scale) + 1][(int)xcor/scale];
     Block leftTop = world[(int)(ycor/scale)][(int)xcor/scale];
     if (leftBottom != null || leftTop != null || xcor <= 1){
       if (leftBottom!= null && leftTop == null && world[(int)(ycor/scale)-1][(int)(xcor/scale)] == null){
         jump();
         xcor += xVel * direction;
       }
      //xcor +=  1;
     }
     else {
       xcor += xVel * direction;
     }
    }
    else if (direction > 0){
      direct = true;
     Block rightBottom = world[(int)(ycor/scale) + 1][(int)(xcor + int(mwidth))/scale];
     Block rightTop = world[(int)(ycor/scale)][(int)(xcor + (int)(mwidth))/scale];
     if (rightBottom != null || rightTop != null || (xcor + (int)(mwidth)) >= worldWidth - 1){
      //xcor -= 1;
      if (rightBottom != null && rightTop == null && world[(int)(ycor/scale)-1][(int)(xcor + (int)(mwidth))/scale] == null){
        jump();
        xcor += xVel * direction;
      }
     }
     else {
       xcor += xVel * direction;
     }
    }
    //xcor += xVel * direction;
    }
    upCollision();
  }
  
    void gravity(){
    int feet = (int)(ycor+ mheight);
    if (feet/scale > 1 && feet/scale < world.length -1 && (xcor+mwidth)/scale > 1 && (xcor+mwidth)/scale < world[0].length){
    Block mayFloor = world[feet/scale][(int)xcor/scale];
    Block mayFloor2 = world[feet/scale][(int)(xcor + mwidth)/scale];
    
    if (mayFloor == null && mayFloor2 == null){
      ycor += yVel;
      yVel += 1;
      if (yVel > scale){yVel = scale;}
    }
    else{
      yVel = 0;
      ycor = ((feet/scale) * scale) - mheight;
    }
  }
  }
  void die(){
    
  }
  void upCollision(){
     if (world[(int)(ycor)/scale][xcor/scale] != null || world[(int)(ycor)/scale][(int)(xcor + mwidth)/scale] != null || (int)(ycor/scale) == 0){
        yVel = 0; 
        ycor = (int)(ycor)/scale * scale + scale;
      }
  }
  void jump(){
    if( yVel == 0){
      yVel -= 8;
      ycor += yVel;
      upCollision();
    }
  }
  void display(){
    if (direct){
      image(image,xcor,ycor);
    }
    else {
      pushMatrix();
      scale(-1,1);
      image(image,-xcor - mwidth,ycor);
      popMatrix();
    }
    for (int  i = 0; i < health; i++){
      image(healthBar,xcor, ycor);
    }
  }
}
