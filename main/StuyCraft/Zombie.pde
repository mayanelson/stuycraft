class Zombie extends Mob{
  
  Zombie(int x, int y){
    super(x,y);
    type = "Zombie";
    image = loadImage("Zombie0.png");
    image.resize(scale,scale*2);
  }
  
  void move(){
  }
  
  void attack(Player p){
  }
  
  void display(){
    print(ycor + "  " );
    image(image,xcor,ycor);
  }
  
}
