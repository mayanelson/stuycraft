class Mob{
  int health;
  Item drop;
  PImage image;
  boolean isMouseHover;
  float xcor;
  float ycor;
  float mwidth;
  float mheight;
  int xVel;
  int yVel;
  String type;
  PImage healthBar;
  
  Mob(int x, int y){
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
     if ((int)ycor/scale + 1 < 249 && (int)ycor/scale + 1 > 1 && xcor/scale < 490 && xcor/scale > 1){
      xcor += xVel * direction;
    if (direction < 0){
     Block leftBottom = world[(int)(ycor/scale) + 1][(int)xcor/scale];
     Block leftTop = world[(int)(ycor/scale)][(int)xcor/scale];
     if (leftBottom != null || leftTop != null && xcor <= 1){
      xcor = (xcor / scale) * scale + scale + 0.001;
     }
    }
    if (direction > 0){
     Block rightBottom = world[(int)(ycor/scale) + 1][(int)(xcor + int(mwidth))/scale];
     Block rightTop = world[(int)(ycor/scale)][(int)(xcor + (int)(mwidth))/scale];
     if (rightBottom != null || rightTop != null || (xcor + (int)(mwidth)) >= worldWidth - 1){
      xcor = (xcor)/ scale * scale + scale - (int)(mwidth) - 0.001;
      //System.out.println("Before: " + (xcor + ", " + (xcor + pwidth)));
     // System.out.println("Reached");
     }
    }
    }
  }
  void die(){
    
  }
  void collision(){
  }
  
  void display(){
    image(image,xcor,ycor);
    for (int  i = 0; i < health; i++){
      image(healthBar,xcor, ycor);
    }
  }
}
