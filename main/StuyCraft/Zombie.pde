class Zombie extends Mob{
  
  Zombie(int x, int y){
    super(x,y);
    type = "Zombie";
    image = loadImage("Zombie0.png");
    image.resize((int)(scale*1.2),(int)(scale*2));
    mwidth = 1.2*scale;
    mheight = 2*scale;
  }
  
  void die(){
    zcount--;
  }
  void attack(Player p){
    
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
      image(healthBar,xcor + (i*scale)/5 - (scale/2),ycor-(scale/4));
    }
  }
  
}
