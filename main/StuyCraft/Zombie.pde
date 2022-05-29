class Zombie extends Mob{
  
  Zombie(int x, int y){
    super(x,y);
    type = "Zombie";
    image = loadImage("Zombie0.png");
    image.resize((int)(scale*1.2),(int)(scale*2));
  }
  
  void move(){
  }
  
  void attack(Player p){
  }
  
  void display(){
    image(image,xcor,ycor);
  }
  
}
