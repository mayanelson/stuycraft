class Mob{
  int health;
  Item drop;
  PImage image;
  boolean isMouseHover;
  int xcor;
  int ycor;
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
