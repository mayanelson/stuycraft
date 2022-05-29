class Cow extends Mob{
  
  Cow(int x, int y){
    super(x,y);
    type = "Cow";
    image = loadImage("Cow0.png");
    image.resize(scale*2,scale);
    
  }
  
  void display(){
    image(image,xcor,ycor);
  }
}
