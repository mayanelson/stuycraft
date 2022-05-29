class Mob{
  int health;
  Item drop;
  PImage image;
  boolean isMouseHover;
  int xcor;
  int ycor;
  float width;
  float height;
  float xVel;
  float yVel;
  String type;
  
  Mob(int x, int y){
    xcor = x;
    ycor = y;
    width = scale;
    height = scale*2;
    xVel = scale / 5;
    yVel = 0;
  }
  void takeDamage(int amt){
  }
  
  void die(){
  }
  void collision(){
  }
  
  void display(){
    image(image,xcor,ycor);
  }
}
